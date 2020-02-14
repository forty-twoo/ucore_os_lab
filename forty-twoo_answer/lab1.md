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

第511和第512个字节的内容为`0x55`和`0xaa`







## 练习2：使用qemu执行并调试lab1中的软件。



## 练习3：分析bootloader进入保护模式的过程。

- 为何开启A20，如何开启A20？

  >进入保护模式以后，我们的地址线有32条，因此不需要实模式下的地址回绕，即第20根及以后的地址线都可用。因此需要打开A20地址线开关。
  >
  >开启A20地址线要用到i8042这个键盘控制器芯片。seta20.1是向0x64端口写入命令0xd1，意思是向8042的P2端口写数据。seta20.2是向0x60端口写数据0xdf，将8042的P2端口设置为1。两段代码都要先读0x64端口的第2位，保证input buffer空闲。

- 如何初始化GDT表

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

- 如何使能和进入保护模式？

   >将%cr0的第0位置1即可进入保护模式
   >
   >```asm
   >    movl %cr0, %eax
   >    orl $CR0_PE_ON, %eax
   >    movl %eax, %cr0
   >```

## 练习4：分析bootloader加载ELF格式的OS的过程。

- bootloader如何读取硬盘扇区的？



## Some notes

- .global关键字用来让一个符号对链接器可见，可以供其他链接对象模块使用，告诉编译器后面跟的是一个全局可见的名字。.global \_start让\_start成为可见的标识符，这样链接器就知道跳转到程序的什么地方开始执行。