# Ucore Lab 1

## 练习1：理解通过make生成执行文件的过程。

### 1. 操作系统镜像文件ucore.img是如何一步一步生成的？

```asm
//生成bootblock
+ cc boot/bootasm.S
gcc -Iboot/ -march=i686 -fno-builtin -fno-PIC -Wall -ggdb -m32 -gstabs -nostdinc  -fno-stack-protector -Ilibs/ -Os -nostdinc -c boot/bootasm.S -o obj/boot/bootasm.o
+ cc boot/bootmain.c
gcc -Iboot/ -march=i686 -fno-builtin -fno-PIC -Wall -ggdb -m32 -gstabs -nostdinc  -fno-stack-protector -Ilibs/ -Os -nostdinc -c boot/bootmain.c -o obj/boot/bootmain.o
+ cc tools/sign.c
gcc -Itools/ -g -Wall -O2 -c tools/sign.c -o obj/sign/tools/sign.o
gcc -g -Wall -O2 obj/sign/tools/sign.o -o bin/sign
+ ld bin/bootblock
ld -m    elf_i386 -nostdlib -N -e start -Ttext 0x7C00 obj/boot/bootasm.o obj/boot/bootmain.o -o obj/bootblock.o
'obj/bootblock.out' size: 492 bytes
build 512 bytes boot sector: 'bin/bootblock' success!
```

ld命令参数：

-m:仿真链接器

-nostdlib:仅搜索显示指出的搜索地址

-N:设置代码段和数据段可读写。

-e:指定入口

-Ttext:设置代码段开始位置

```asm
//生成kernel
ld -m    elf_i386 -nostdlib -T tools/kernel.ld -o bin/kernel obj/kern/init/init.o obj/kern/libs/readline.o obj/kern/libs/stdio.o obj/kern/debug/kdebug.o obj/kern/debug/kmonitor.o obj/kern/debug/panic.o obj/kern/driver/clock.o obj/kern/driver/console.o obj/kern/driver/intr.o obj/kern/driver/picirq.o obj/kern/trap/trap.o obj/kern/trap/trapentry.o obj/kern/trap/vectors.o obj/kern/mm/pmm.o obj/libs/printfmt.o obj/libs/string.o
```

```asm
//在生成了bootblock以后，先清空ucore.img的前10000块，然后把它写入到ucore.img的第0块
dd if=/dev/zero of=bin/ucore.img count=10000
10000+0 records in
10000+0 records out
5120000 bytes (5.1 MB, 4.9 MiB) copied, 0.038024 s, 135 MB/s
dd if=bin/bootblock of=bin/ucore.img conv=notrunc
1+0 records in
1+0 records out
512 bytes copied, 7.1951e-05 s, 7.1 MB/s

//把kernel这个ELF格式的文件写入ucore.img的第1块
dd if=bin/kernel of=bin/ucore.img seek=1 conv=notrunc
154+1 records in
154+1 records out
78888 bytes (79 kB, 77 KiB) copied, 0.000356768 s, 221 MB/s
```

### 2. 一个被系统认为是符合规范的硬盘主引导扇区的特征是什么？

> 第511和第512个字节的内容为`0x55`和`0xaa`



## 练习2：使用qemu执行并调试lab1中的软件。



## 练习3：分析bootloader进入保护模式的过程。

### 1. 为何开启A20，如何开启A20？

>进入保护模式以后，我们的地址线有32条，因此不需要实模式下的地址回绕，即第20根及以后的地址线都可用。因此需要打开A20地址线开关。
>
>开启A20地址线要用到i8042这个键盘控制器芯片。seta20.1是向0x64端口写入命令0xd1，意思是向8042的P2端口写数据。seta20.2是向0x60端口写数据0xdf，将8042的P2端口设置为1。两段代码都要先读0x64端口的第2位，保证input buffer空闲。

### 2. 如何初始化GDT表

>用lgdt指令把GDT的加载地址和大小放在GDTR寄存器中。一共48位。低16位是大小，高32位是GDT的起始地址。目前GDT大小为0x17+1一共24字节。每个段描述符8字节，因此现在有3个表项。第0个表项不可用，因此置0。第1个表项为代码段的描述符，第2个表项为数据段的描述符。
>
>```asm
>//bootasm.S
># Bootstrap GDT
>.p2align 2                                          # force 4 byte alignment
>gdt:
>    SEG_NULLASM                                     # null seg
>    SEG_ASM(STA_X|STA_R, 0x0, 0xffffffff)           # code seg for bootloader and kernel
>    SEG_ASM(STA_W, 0x0, 0xffffffff)                 # data seg for bootloader and kernel
>
>gdtdesc:
>    .word 0x17                                      # sizeof(gdt) - 1
>    .long gdt                                       # address gdt
>    
>//asm.h
>/* Normal segment */
>#define SEG_NULLASM                                             \
>    .word 0, 0;                                                 \
>    .byte 0, 0, 0, 0
>
>#define SEG_ASM(type,base,lim)                                  \
>    .word (((lim) >> 12) & 0xffff), ((base) & 0xffff);          \
>    .byte (((base) >> 16) & 0xff), (0x90 | (type)),             \
>        (0xC0 | (((lim) >> 28) & 0xf)), (((base) >> 24) & 0xff)
>
>```
>
>![Screenshot from 2020-02-14 20-39-38](/home/forty2/Pictures/Screenshot from 2020-02-14 20-39-38.png)

### 3. 如何使能和进入保护模式？

>将%cr0的第0位置1即可进入保护模式
>
>```asm
>    movl %cr0, %eax
>    orl $CR0_PE_ON, %eax
>    movl %eax, %cr0
>```

## 练习4：分析bootloader加载ELF格式的OS的过程。

### 1. bootloader如何读取硬盘扇区的？

>```asm
>/* readsect - read a single sector at @secno into @dst */
>static void
>readsect(void *dst, uint32_t secno) {
>    // wait for disk to be ready
>    //等磁盘空闲，即读0x1F7端口寄存器的第6位第7位分别为1,0时才可对磁盘进行操作
>    waitdisk();
>	
>//写入要读的磁盘扇区数，LBA的28位地址，设置device寄存器的后4位，向0x1F7写入读扇区命令
>    outb(0x1F2, 1);                         // count = 1
>    outb(0x1F3, secno & 0xFF);
>    outb(0x1F4, (secno >> 8) & 0xFF);
>    outb(0x1F5, (secno >> 16) & 0xFF);
>    outb(0x1F6, ((secno >> 24) & 0xF) | 0xE0);
>    outb(0x1F7, 0x20);                      // cmd 0x20 - read sectors
>
>    // wait for disk to be ready
>    waitdisk();
>	
>    //把0x1F0端口寄存器中的数据读出来
>    insl(0x1F0, dst, SECTSIZE / 4);
>}
>```
>
>关于硬盘的读写操作参考《操作系统真象还原》Ch3.5

### 2. bootloader是如何加载ELF格式的OS？

>先判断ELF文件头的前4个字节是否是固定魔数“0x7fELF"。如果不是，则表示这不是一个有效ELF文件。如果是，则定位到程序头表位置处，并读出程序头表中有几个表项。然后把它们加载到内存中的相应位置，最后跳转到内核的entry处开始执行内核代码。





## 练习5：实现函数调用堆栈跟踪函数 		

>```c
>    uint32_t ebp = read_ebp(), eip = read_eip();
>    int i, j;
>    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
>        cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
>        uint32_t *args = (uint32_t *)ebp + 2;
>        for (j = 0; j < 4; j ++) {
>            cprintf("0x%08x ", args[j]);
>        }
>        cprintf("\n");
>        print_debuginfo(eip-1); //其实这一句不是很明白
>        eip = ((uint32_t *)ebp)[1];
>        ebp = ((uint32_t *)ebp)[0];
>    }
>```
>
>![image-20200217203905884](/home/forty2/.config/Typora/typora-user-images/image-20200217203905884.png)
>
>函数调用栈是这样的，先压入参数，再压入返回地址（即调用结束后下一条指令的地址），再压入ebp，然后把esp的值赋给ebp，再进行局部变量的压栈。
>
>执行`make  qemu`命令后截图如下：
>
>![image-20200217204321307](/home/forty2/.config/Typora/typora-user-images/image-20200217204321307.png)
>
>gdb在*0x7c00和bootmain函数入口处打断点得到的调试截图，可以发现，0x00007d72这个地址即为call函数的地址。而上面图里0x00007d74就是调用函数的下一条指令地址，不过我们已经要跳到kern_init函数里了，因为这里调用函数不会返回，所以其实0x00007d74这个地方的指令永远不会执行了。一般来说，args存放的4个dword是对应4个输入参数的值。但这里比较特殊，由于bootmain函数调用kern_init并没传递任何输入参数，并且栈顶的位置恰好在boot loader第一条指令存放的地址的上面，而args恰好是kern_int的ebp寄存器指向的栈顶往上第2~5个单元，因此args存放的就是boot loader指令的前16个字节。
>
>```asm
>    # Set up the stack pointer and call into C. The stack region is from 0--			# start(0x7c00)
>    //在bootasm.S文件中设置了%esp和%ebp的初始值
>    movl $0x0, %ebp
>    movl $start, %esp
>    call bootmain
>    //由于call函数使得%ebp改变为0x7bf8
>```
>
>
>
>![image-20200217213500554](/home/forty2/.config/Typora/typora-user-images/image-20200217213500554.png)
>
>
>
>
>
>![image-20200217212049644](/home/forty2/.config/Typora/typora-user-images/image-20200217212049644.png)
>
>





## Some notes

- .global关键字用来让一个符号对链接器可见，可以供其他链接对象模块使用，告诉编译器后面跟的是一个全局可见的名字。.global \_start让\_start成为可见的标识符，这样链接器就知道跳转到程序的什么地方开始执行。