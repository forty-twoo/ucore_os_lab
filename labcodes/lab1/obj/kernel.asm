
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  10000b:	2d 16 fa 10 00       	sub    $0x10fa16,%eax
  100010:	89 44 24 08          	mov    %eax,0x8(%esp)
  100014:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001b:	00 
  10001c:	c7 04 24 16 fa 10 00 	movl   $0x10fa16,(%esp)
  100023:	e8 63 30 00 00       	call   10308b <memset>

    cons_init();                // init the console
  100028:	e8 9c 14 00 00       	call   1014c9 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002d:	c7 45 f4 20 32 10 00 	movl   $0x103220,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100034:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100037:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003b:	c7 04 24 3c 32 10 00 	movl   $0x10323c,(%esp)
  100042:	e8 c6 02 00 00       	call   10030d <cprintf>

    print_kerninfo();
  100047:	e8 d8 07 00 00       	call   100824 <print_kerninfo>

    grade_backtrace();
  10004c:	e8 89 00 00 00       	call   1000da <grade_backtrace>

    pmm_init();                 // init physical memory management
  100051:	e8 a0 26 00 00       	call   1026f6 <pmm_init>

    pic_init();                 // init interrupt controller
  100056:	e8 bf 15 00 00       	call   10161a <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005b:	e8 1f 17 00 00       	call   10177f <idt_init>

    clock_init();               // init clock interrupt
  100060:	e8 25 0c 00 00       	call   100c8a <clock_init>
    intr_enable();              // enable irq interrupt
  100065:	e8 12 15 00 00       	call   10157c <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006a:	eb fe                	jmp    10006a <kern_init+0x6a>

0010006c <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  10006c:	55                   	push   %ebp
  10006d:	89 e5                	mov    %esp,%ebp
  10006f:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100072:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100079:	00 
  10007a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100081:	00 
  100082:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100089:	e8 1b 0b 00 00       	call   100ba9 <mon_backtrace>
}
  10008e:	90                   	nop
  10008f:	c9                   	leave  
  100090:	c3                   	ret    

00100091 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100091:	55                   	push   %ebp
  100092:	89 e5                	mov    %esp,%ebp
  100094:	53                   	push   %ebx
  100095:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  100098:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  10009b:	8b 55 0c             	mov    0xc(%ebp),%edx
  10009e:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a4:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000a8:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000ac:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000b0:	89 04 24             	mov    %eax,(%esp)
  1000b3:	e8 b4 ff ff ff       	call   10006c <grade_backtrace2>
}
  1000b8:	90                   	nop
  1000b9:	83 c4 14             	add    $0x14,%esp
  1000bc:	5b                   	pop    %ebx
  1000bd:	5d                   	pop    %ebp
  1000be:	c3                   	ret    

001000bf <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000bf:	55                   	push   %ebp
  1000c0:	89 e5                	mov    %esp,%ebp
  1000c2:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000c5:	8b 45 10             	mov    0x10(%ebp),%eax
  1000c8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000cc:	8b 45 08             	mov    0x8(%ebp),%eax
  1000cf:	89 04 24             	mov    %eax,(%esp)
  1000d2:	e8 ba ff ff ff       	call   100091 <grade_backtrace1>
}
  1000d7:	90                   	nop
  1000d8:	c9                   	leave  
  1000d9:	c3                   	ret    

001000da <grade_backtrace>:

void
grade_backtrace(void) {
  1000da:	55                   	push   %ebp
  1000db:	89 e5                	mov    %esp,%ebp
  1000dd:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e0:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000e5:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000ec:	ff 
  1000ed:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000f8:	e8 c2 ff ff ff       	call   1000bf <grade_backtrace0>
}
  1000fd:	90                   	nop
  1000fe:	c9                   	leave  
  1000ff:	c3                   	ret    

00100100 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100100:	55                   	push   %ebp
  100101:	89 e5                	mov    %esp,%ebp
  100103:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100106:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100109:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10010c:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10010f:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100112:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100116:	83 e0 03             	and    $0x3,%eax
  100119:	89 c2                	mov    %eax,%edx
  10011b:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100120:	89 54 24 08          	mov    %edx,0x8(%esp)
  100124:	89 44 24 04          	mov    %eax,0x4(%esp)
  100128:	c7 04 24 41 32 10 00 	movl   $0x103241,(%esp)
  10012f:	e8 d9 01 00 00       	call   10030d <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100134:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100138:	89 c2                	mov    %eax,%edx
  10013a:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10013f:	89 54 24 08          	mov    %edx,0x8(%esp)
  100143:	89 44 24 04          	mov    %eax,0x4(%esp)
  100147:	c7 04 24 4f 32 10 00 	movl   $0x10324f,(%esp)
  10014e:	e8 ba 01 00 00       	call   10030d <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100153:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100157:	89 c2                	mov    %eax,%edx
  100159:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10015e:	89 54 24 08          	mov    %edx,0x8(%esp)
  100162:	89 44 24 04          	mov    %eax,0x4(%esp)
  100166:	c7 04 24 5d 32 10 00 	movl   $0x10325d,(%esp)
  10016d:	e8 9b 01 00 00       	call   10030d <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100172:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100176:	89 c2                	mov    %eax,%edx
  100178:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10017d:	89 54 24 08          	mov    %edx,0x8(%esp)
  100181:	89 44 24 04          	mov    %eax,0x4(%esp)
  100185:	c7 04 24 6b 32 10 00 	movl   $0x10326b,(%esp)
  10018c:	e8 7c 01 00 00       	call   10030d <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  100191:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  100195:	89 c2                	mov    %eax,%edx
  100197:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10019c:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001a4:	c7 04 24 79 32 10 00 	movl   $0x103279,(%esp)
  1001ab:	e8 5d 01 00 00       	call   10030d <cprintf>
    round ++;
  1001b0:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001b5:	40                   	inc    %eax
  1001b6:	a3 20 fa 10 00       	mov    %eax,0x10fa20
}
  1001bb:	90                   	nop
  1001bc:	c9                   	leave  
  1001bd:	c3                   	ret    

001001be <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001be:	55                   	push   %ebp
  1001bf:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001c1:	90                   	nop
  1001c2:	5d                   	pop    %ebp
  1001c3:	c3                   	ret    

001001c4 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001c4:	55                   	push   %ebp
  1001c5:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001c7:	90                   	nop
  1001c8:	5d                   	pop    %ebp
  1001c9:	c3                   	ret    

001001ca <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001ca:	55                   	push   %ebp
  1001cb:	89 e5                	mov    %esp,%ebp
  1001cd:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001d0:	e8 2b ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001d5:	c7 04 24 88 32 10 00 	movl   $0x103288,(%esp)
  1001dc:	e8 2c 01 00 00       	call   10030d <cprintf>
    lab1_switch_to_user();
  1001e1:	e8 d8 ff ff ff       	call   1001be <lab1_switch_to_user>
    lab1_print_cur_status();
  1001e6:	e8 15 ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001eb:	c7 04 24 a8 32 10 00 	movl   $0x1032a8,(%esp)
  1001f2:	e8 16 01 00 00       	call   10030d <cprintf>
    lab1_switch_to_kernel();
  1001f7:	e8 c8 ff ff ff       	call   1001c4 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  1001fc:	e8 ff fe ff ff       	call   100100 <lab1_print_cur_status>
}
  100201:	90                   	nop
  100202:	c9                   	leave  
  100203:	c3                   	ret    

00100204 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100204:	55                   	push   %ebp
  100205:	89 e5                	mov    %esp,%ebp
  100207:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  10020a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10020e:	74 13                	je     100223 <readline+0x1f>
        cprintf("%s", prompt);
  100210:	8b 45 08             	mov    0x8(%ebp),%eax
  100213:	89 44 24 04          	mov    %eax,0x4(%esp)
  100217:	c7 04 24 c7 32 10 00 	movl   $0x1032c7,(%esp)
  10021e:	e8 ea 00 00 00       	call   10030d <cprintf>
    }
    int i = 0, c;
  100223:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  10022a:	e8 67 01 00 00       	call   100396 <getchar>
  10022f:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100232:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100236:	79 07                	jns    10023f <readline+0x3b>
            return NULL;
  100238:	b8 00 00 00 00       	mov    $0x0,%eax
  10023d:	eb 78                	jmp    1002b7 <readline+0xb3>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  10023f:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100243:	7e 28                	jle    10026d <readline+0x69>
  100245:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  10024c:	7f 1f                	jg     10026d <readline+0x69>
            cputchar(c);
  10024e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100251:	89 04 24             	mov    %eax,(%esp)
  100254:	e8 da 00 00 00       	call   100333 <cputchar>
            buf[i ++] = c;
  100259:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10025c:	8d 50 01             	lea    0x1(%eax),%edx
  10025f:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100262:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100265:	88 90 40 fa 10 00    	mov    %dl,0x10fa40(%eax)
  10026b:	eb 45                	jmp    1002b2 <readline+0xae>
        }
        else if (c == '\b' && i > 0) {
  10026d:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100271:	75 16                	jne    100289 <readline+0x85>
  100273:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100277:	7e 10                	jle    100289 <readline+0x85>
            cputchar(c);
  100279:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10027c:	89 04 24             	mov    %eax,(%esp)
  10027f:	e8 af 00 00 00       	call   100333 <cputchar>
            i --;
  100284:	ff 4d f4             	decl   -0xc(%ebp)
  100287:	eb 29                	jmp    1002b2 <readline+0xae>
        }
        else if (c == '\n' || c == '\r') {
  100289:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  10028d:	74 06                	je     100295 <readline+0x91>
  10028f:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  100293:	75 95                	jne    10022a <readline+0x26>
            cputchar(c);
  100295:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100298:	89 04 24             	mov    %eax,(%esp)
  10029b:	e8 93 00 00 00       	call   100333 <cputchar>
            buf[i] = '\0';
  1002a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002a3:	05 40 fa 10 00       	add    $0x10fa40,%eax
  1002a8:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002ab:	b8 40 fa 10 00       	mov    $0x10fa40,%eax
  1002b0:	eb 05                	jmp    1002b7 <readline+0xb3>
        c = getchar();
  1002b2:	e9 73 ff ff ff       	jmp    10022a <readline+0x26>
        }
    }
}
  1002b7:	c9                   	leave  
  1002b8:	c3                   	ret    

001002b9 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002b9:	55                   	push   %ebp
  1002ba:	89 e5                	mov    %esp,%ebp
  1002bc:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002bf:	8b 45 08             	mov    0x8(%ebp),%eax
  1002c2:	89 04 24             	mov    %eax,(%esp)
  1002c5:	e8 2c 12 00 00       	call   1014f6 <cons_putc>
    (*cnt) ++;
  1002ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002cd:	8b 00                	mov    (%eax),%eax
  1002cf:	8d 50 01             	lea    0x1(%eax),%edx
  1002d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002d5:	89 10                	mov    %edx,(%eax)
}
  1002d7:	90                   	nop
  1002d8:	c9                   	leave  
  1002d9:	c3                   	ret    

001002da <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002da:	55                   	push   %ebp
  1002db:	89 e5                	mov    %esp,%ebp
  1002dd:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002ea:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1002ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1002f1:	89 44 24 08          	mov    %eax,0x8(%esp)
  1002f5:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1002f8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1002fc:	c7 04 24 b9 02 10 00 	movl   $0x1002b9,(%esp)
  100303:	e8 be 25 00 00       	call   1028c6 <vprintfmt>
    return cnt;
  100308:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10030b:	c9                   	leave  
  10030c:	c3                   	ret    

0010030d <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10030d:	55                   	push   %ebp
  10030e:	89 e5                	mov    %esp,%ebp
  100310:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100313:	8d 45 0c             	lea    0xc(%ebp),%eax
  100316:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100319:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10031c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100320:	8b 45 08             	mov    0x8(%ebp),%eax
  100323:	89 04 24             	mov    %eax,(%esp)
  100326:	e8 af ff ff ff       	call   1002da <vcprintf>
  10032b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10032e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100331:	c9                   	leave  
  100332:	c3                   	ret    

00100333 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100333:	55                   	push   %ebp
  100334:	89 e5                	mov    %esp,%ebp
  100336:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100339:	8b 45 08             	mov    0x8(%ebp),%eax
  10033c:	89 04 24             	mov    %eax,(%esp)
  10033f:	e8 b2 11 00 00       	call   1014f6 <cons_putc>
}
  100344:	90                   	nop
  100345:	c9                   	leave  
  100346:	c3                   	ret    

00100347 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  100347:	55                   	push   %ebp
  100348:	89 e5                	mov    %esp,%ebp
  10034a:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10034d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100354:	eb 13                	jmp    100369 <cputs+0x22>
        cputch(c, &cnt);
  100356:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10035a:	8d 55 f0             	lea    -0x10(%ebp),%edx
  10035d:	89 54 24 04          	mov    %edx,0x4(%esp)
  100361:	89 04 24             	mov    %eax,(%esp)
  100364:	e8 50 ff ff ff       	call   1002b9 <cputch>
    while ((c = *str ++) != '\0') {
  100369:	8b 45 08             	mov    0x8(%ebp),%eax
  10036c:	8d 50 01             	lea    0x1(%eax),%edx
  10036f:	89 55 08             	mov    %edx,0x8(%ebp)
  100372:	0f b6 00             	movzbl (%eax),%eax
  100375:	88 45 f7             	mov    %al,-0x9(%ebp)
  100378:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  10037c:	75 d8                	jne    100356 <cputs+0xf>
    }
    cputch('\n', &cnt);
  10037e:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100381:	89 44 24 04          	mov    %eax,0x4(%esp)
  100385:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  10038c:	e8 28 ff ff ff       	call   1002b9 <cputch>
    return cnt;
  100391:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100394:	c9                   	leave  
  100395:	c3                   	ret    

00100396 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  100396:	55                   	push   %ebp
  100397:	89 e5                	mov    %esp,%ebp
  100399:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  10039c:	90                   	nop
  10039d:	e8 7e 11 00 00       	call   101520 <cons_getc>
  1003a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003a5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003a9:	74 f2                	je     10039d <getchar+0x7>
        /* do nothing */;
    return c;
  1003ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003ae:	c9                   	leave  
  1003af:	c3                   	ret    

001003b0 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003b0:	55                   	push   %ebp
  1003b1:	89 e5                	mov    %esp,%ebp
  1003b3:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003b9:	8b 00                	mov    (%eax),%eax
  1003bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003be:	8b 45 10             	mov    0x10(%ebp),%eax
  1003c1:	8b 00                	mov    (%eax),%eax
  1003c3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003c6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003cd:	e9 ca 00 00 00       	jmp    10049c <stab_binsearch+0xec>
        int true_m = (l + r) / 2, m = true_m;
  1003d2:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003d8:	01 d0                	add    %edx,%eax
  1003da:	89 c2                	mov    %eax,%edx
  1003dc:	c1 ea 1f             	shr    $0x1f,%edx
  1003df:	01 d0                	add    %edx,%eax
  1003e1:	d1 f8                	sar    %eax
  1003e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1003e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1003e9:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003ec:	eb 03                	jmp    1003f1 <stab_binsearch+0x41>
            m --;
  1003ee:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  1003f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003f4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1003f7:	7c 1f                	jl     100418 <stab_binsearch+0x68>
  1003f9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1003fc:	89 d0                	mov    %edx,%eax
  1003fe:	01 c0                	add    %eax,%eax
  100400:	01 d0                	add    %edx,%eax
  100402:	c1 e0 02             	shl    $0x2,%eax
  100405:	89 c2                	mov    %eax,%edx
  100407:	8b 45 08             	mov    0x8(%ebp),%eax
  10040a:	01 d0                	add    %edx,%eax
  10040c:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100410:	0f b6 c0             	movzbl %al,%eax
  100413:	39 45 14             	cmp    %eax,0x14(%ebp)
  100416:	75 d6                	jne    1003ee <stab_binsearch+0x3e>
        }
        if (m < l) {    // no match in [l, m]
  100418:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10041b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10041e:	7d 09                	jge    100429 <stab_binsearch+0x79>
            l = true_m + 1;
  100420:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100423:	40                   	inc    %eax
  100424:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100427:	eb 73                	jmp    10049c <stab_binsearch+0xec>
        }

        // actual binary search
        any_matches = 1;
  100429:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100430:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100433:	89 d0                	mov    %edx,%eax
  100435:	01 c0                	add    %eax,%eax
  100437:	01 d0                	add    %edx,%eax
  100439:	c1 e0 02             	shl    $0x2,%eax
  10043c:	89 c2                	mov    %eax,%edx
  10043e:	8b 45 08             	mov    0x8(%ebp),%eax
  100441:	01 d0                	add    %edx,%eax
  100443:	8b 40 08             	mov    0x8(%eax),%eax
  100446:	39 45 18             	cmp    %eax,0x18(%ebp)
  100449:	76 11                	jbe    10045c <stab_binsearch+0xac>
            *region_left = m;
  10044b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10044e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100451:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100453:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100456:	40                   	inc    %eax
  100457:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10045a:	eb 40                	jmp    10049c <stab_binsearch+0xec>
        } else if (stabs[m].n_value > addr) {
  10045c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10045f:	89 d0                	mov    %edx,%eax
  100461:	01 c0                	add    %eax,%eax
  100463:	01 d0                	add    %edx,%eax
  100465:	c1 e0 02             	shl    $0x2,%eax
  100468:	89 c2                	mov    %eax,%edx
  10046a:	8b 45 08             	mov    0x8(%ebp),%eax
  10046d:	01 d0                	add    %edx,%eax
  10046f:	8b 40 08             	mov    0x8(%eax),%eax
  100472:	39 45 18             	cmp    %eax,0x18(%ebp)
  100475:	73 14                	jae    10048b <stab_binsearch+0xdb>
            *region_right = m - 1;
  100477:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10047a:	8d 50 ff             	lea    -0x1(%eax),%edx
  10047d:	8b 45 10             	mov    0x10(%ebp),%eax
  100480:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100482:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100485:	48                   	dec    %eax
  100486:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100489:	eb 11                	jmp    10049c <stab_binsearch+0xec>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  10048b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10048e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100491:	89 10                	mov    %edx,(%eax)
            l = m;
  100493:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100496:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  100499:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  10049c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10049f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004a2:	0f 8e 2a ff ff ff    	jle    1003d2 <stab_binsearch+0x22>
        }
    }

    if (!any_matches) {
  1004a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004ac:	75 0f                	jne    1004bd <stab_binsearch+0x10d>
        *region_right = *region_left - 1;
  1004ae:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004b1:	8b 00                	mov    (%eax),%eax
  1004b3:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004b6:	8b 45 10             	mov    0x10(%ebp),%eax
  1004b9:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1004bb:	eb 3e                	jmp    1004fb <stab_binsearch+0x14b>
        l = *region_right;
  1004bd:	8b 45 10             	mov    0x10(%ebp),%eax
  1004c0:	8b 00                	mov    (%eax),%eax
  1004c2:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004c5:	eb 03                	jmp    1004ca <stab_binsearch+0x11a>
  1004c7:	ff 4d fc             	decl   -0x4(%ebp)
  1004ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004cd:	8b 00                	mov    (%eax),%eax
  1004cf:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1004d2:	7e 1f                	jle    1004f3 <stab_binsearch+0x143>
  1004d4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004d7:	89 d0                	mov    %edx,%eax
  1004d9:	01 c0                	add    %eax,%eax
  1004db:	01 d0                	add    %edx,%eax
  1004dd:	c1 e0 02             	shl    $0x2,%eax
  1004e0:	89 c2                	mov    %eax,%edx
  1004e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1004e5:	01 d0                	add    %edx,%eax
  1004e7:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004eb:	0f b6 c0             	movzbl %al,%eax
  1004ee:	39 45 14             	cmp    %eax,0x14(%ebp)
  1004f1:	75 d4                	jne    1004c7 <stab_binsearch+0x117>
        *region_left = l;
  1004f3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004f6:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004f9:	89 10                	mov    %edx,(%eax)
}
  1004fb:	90                   	nop
  1004fc:	c9                   	leave  
  1004fd:	c3                   	ret    

001004fe <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1004fe:	55                   	push   %ebp
  1004ff:	89 e5                	mov    %esp,%ebp
  100501:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100504:	8b 45 0c             	mov    0xc(%ebp),%eax
  100507:	c7 00 cc 32 10 00    	movl   $0x1032cc,(%eax)
    info->eip_line = 0;
  10050d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100510:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100517:	8b 45 0c             	mov    0xc(%ebp),%eax
  10051a:	c7 40 08 cc 32 10 00 	movl   $0x1032cc,0x8(%eax)
    info->eip_fn_namelen = 9;
  100521:	8b 45 0c             	mov    0xc(%ebp),%eax
  100524:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10052b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052e:	8b 55 08             	mov    0x8(%ebp),%edx
  100531:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100534:	8b 45 0c             	mov    0xc(%ebp),%eax
  100537:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  10053e:	c7 45 f4 0c 3b 10 00 	movl   $0x103b0c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100545:	c7 45 f0 24 c5 10 00 	movl   $0x10c524,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10054c:	c7 45 ec 25 c5 10 00 	movl   $0x10c525,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100553:	c7 45 e8 f2 e5 10 00 	movl   $0x10e5f2,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10055a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10055d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100560:	76 0b                	jbe    10056d <debuginfo_eip+0x6f>
  100562:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100565:	48                   	dec    %eax
  100566:	0f b6 00             	movzbl (%eax),%eax
  100569:	84 c0                	test   %al,%al
  10056b:	74 0a                	je     100577 <debuginfo_eip+0x79>
        return -1;
  10056d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100572:	e9 ab 02 00 00       	jmp    100822 <debuginfo_eip+0x324>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100577:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10057e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100581:	2b 45 f4             	sub    -0xc(%ebp),%eax
  100584:	c1 f8 02             	sar    $0x2,%eax
  100587:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10058d:	48                   	dec    %eax
  10058e:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100591:	8b 45 08             	mov    0x8(%ebp),%eax
  100594:	89 44 24 10          	mov    %eax,0x10(%esp)
  100598:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  10059f:	00 
  1005a0:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005a3:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005a7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005aa:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005b1:	89 04 24             	mov    %eax,(%esp)
  1005b4:	e8 f7 fd ff ff       	call   1003b0 <stab_binsearch>
    if (lfile == 0)
  1005b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005bc:	85 c0                	test   %eax,%eax
  1005be:	75 0a                	jne    1005ca <debuginfo_eip+0xcc>
        return -1;
  1005c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005c5:	e9 58 02 00 00       	jmp    100822 <debuginfo_eip+0x324>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005cd:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005d0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005d3:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1005d9:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005dd:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1005e4:	00 
  1005e5:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1005e8:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ec:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1005ef:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005f6:	89 04 24             	mov    %eax,(%esp)
  1005f9:	e8 b2 fd ff ff       	call   1003b0 <stab_binsearch>

    if (lfun <= rfun) {
  1005fe:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100601:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100604:	39 c2                	cmp    %eax,%edx
  100606:	7f 78                	jg     100680 <debuginfo_eip+0x182>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  100608:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10060b:	89 c2                	mov    %eax,%edx
  10060d:	89 d0                	mov    %edx,%eax
  10060f:	01 c0                	add    %eax,%eax
  100611:	01 d0                	add    %edx,%eax
  100613:	c1 e0 02             	shl    $0x2,%eax
  100616:	89 c2                	mov    %eax,%edx
  100618:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10061b:	01 d0                	add    %edx,%eax
  10061d:	8b 10                	mov    (%eax),%edx
  10061f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100622:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100625:	39 c2                	cmp    %eax,%edx
  100627:	73 22                	jae    10064b <debuginfo_eip+0x14d>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100629:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10062c:	89 c2                	mov    %eax,%edx
  10062e:	89 d0                	mov    %edx,%eax
  100630:	01 c0                	add    %eax,%eax
  100632:	01 d0                	add    %edx,%eax
  100634:	c1 e0 02             	shl    $0x2,%eax
  100637:	89 c2                	mov    %eax,%edx
  100639:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10063c:	01 d0                	add    %edx,%eax
  10063e:	8b 10                	mov    (%eax),%edx
  100640:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100643:	01 c2                	add    %eax,%edx
  100645:	8b 45 0c             	mov    0xc(%ebp),%eax
  100648:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  10064b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10064e:	89 c2                	mov    %eax,%edx
  100650:	89 d0                	mov    %edx,%eax
  100652:	01 c0                	add    %eax,%eax
  100654:	01 d0                	add    %edx,%eax
  100656:	c1 e0 02             	shl    $0x2,%eax
  100659:	89 c2                	mov    %eax,%edx
  10065b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10065e:	01 d0                	add    %edx,%eax
  100660:	8b 50 08             	mov    0x8(%eax),%edx
  100663:	8b 45 0c             	mov    0xc(%ebp),%eax
  100666:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100669:	8b 45 0c             	mov    0xc(%ebp),%eax
  10066c:	8b 40 10             	mov    0x10(%eax),%eax
  10066f:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100672:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100675:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100678:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10067b:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10067e:	eb 15                	jmp    100695 <debuginfo_eip+0x197>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100680:	8b 45 0c             	mov    0xc(%ebp),%eax
  100683:	8b 55 08             	mov    0x8(%ebp),%edx
  100686:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100689:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10068c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  10068f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100692:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  100695:	8b 45 0c             	mov    0xc(%ebp),%eax
  100698:	8b 40 08             	mov    0x8(%eax),%eax
  10069b:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006a2:	00 
  1006a3:	89 04 24             	mov    %eax,(%esp)
  1006a6:	e8 5c 28 00 00       	call   102f07 <strfind>
  1006ab:	8b 55 0c             	mov    0xc(%ebp),%edx
  1006ae:	8b 52 08             	mov    0x8(%edx),%edx
  1006b1:	29 d0                	sub    %edx,%eax
  1006b3:	89 c2                	mov    %eax,%edx
  1006b5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006b8:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1006be:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006c2:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006c9:	00 
  1006ca:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006cd:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006d1:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006d4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006db:	89 04 24             	mov    %eax,(%esp)
  1006de:	e8 cd fc ff ff       	call   1003b0 <stab_binsearch>
    if (lline <= rline) {
  1006e3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1006e6:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1006e9:	39 c2                	cmp    %eax,%edx
  1006eb:	7f 23                	jg     100710 <debuginfo_eip+0x212>
        info->eip_line = stabs[rline].n_desc;
  1006ed:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1006f0:	89 c2                	mov    %eax,%edx
  1006f2:	89 d0                	mov    %edx,%eax
  1006f4:	01 c0                	add    %eax,%eax
  1006f6:	01 d0                	add    %edx,%eax
  1006f8:	c1 e0 02             	shl    $0x2,%eax
  1006fb:	89 c2                	mov    %eax,%edx
  1006fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100700:	01 d0                	add    %edx,%eax
  100702:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100706:	89 c2                	mov    %eax,%edx
  100708:	8b 45 0c             	mov    0xc(%ebp),%eax
  10070b:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10070e:	eb 11                	jmp    100721 <debuginfo_eip+0x223>
        return -1;
  100710:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100715:	e9 08 01 00 00       	jmp    100822 <debuginfo_eip+0x324>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  10071a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10071d:	48                   	dec    %eax
  10071e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100721:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100724:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100727:	39 c2                	cmp    %eax,%edx
  100729:	7c 56                	jl     100781 <debuginfo_eip+0x283>
           && stabs[lline].n_type != N_SOL
  10072b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10072e:	89 c2                	mov    %eax,%edx
  100730:	89 d0                	mov    %edx,%eax
  100732:	01 c0                	add    %eax,%eax
  100734:	01 d0                	add    %edx,%eax
  100736:	c1 e0 02             	shl    $0x2,%eax
  100739:	89 c2                	mov    %eax,%edx
  10073b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10073e:	01 d0                	add    %edx,%eax
  100740:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100744:	3c 84                	cmp    $0x84,%al
  100746:	74 39                	je     100781 <debuginfo_eip+0x283>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100748:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10074b:	89 c2                	mov    %eax,%edx
  10074d:	89 d0                	mov    %edx,%eax
  10074f:	01 c0                	add    %eax,%eax
  100751:	01 d0                	add    %edx,%eax
  100753:	c1 e0 02             	shl    $0x2,%eax
  100756:	89 c2                	mov    %eax,%edx
  100758:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10075b:	01 d0                	add    %edx,%eax
  10075d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100761:	3c 64                	cmp    $0x64,%al
  100763:	75 b5                	jne    10071a <debuginfo_eip+0x21c>
  100765:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100768:	89 c2                	mov    %eax,%edx
  10076a:	89 d0                	mov    %edx,%eax
  10076c:	01 c0                	add    %eax,%eax
  10076e:	01 d0                	add    %edx,%eax
  100770:	c1 e0 02             	shl    $0x2,%eax
  100773:	89 c2                	mov    %eax,%edx
  100775:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100778:	01 d0                	add    %edx,%eax
  10077a:	8b 40 08             	mov    0x8(%eax),%eax
  10077d:	85 c0                	test   %eax,%eax
  10077f:	74 99                	je     10071a <debuginfo_eip+0x21c>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  100781:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100784:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100787:	39 c2                	cmp    %eax,%edx
  100789:	7c 42                	jl     1007cd <debuginfo_eip+0x2cf>
  10078b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10078e:	89 c2                	mov    %eax,%edx
  100790:	89 d0                	mov    %edx,%eax
  100792:	01 c0                	add    %eax,%eax
  100794:	01 d0                	add    %edx,%eax
  100796:	c1 e0 02             	shl    $0x2,%eax
  100799:	89 c2                	mov    %eax,%edx
  10079b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10079e:	01 d0                	add    %edx,%eax
  1007a0:	8b 10                	mov    (%eax),%edx
  1007a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1007a5:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1007a8:	39 c2                	cmp    %eax,%edx
  1007aa:	73 21                	jae    1007cd <debuginfo_eip+0x2cf>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007ac:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007af:	89 c2                	mov    %eax,%edx
  1007b1:	89 d0                	mov    %edx,%eax
  1007b3:	01 c0                	add    %eax,%eax
  1007b5:	01 d0                	add    %edx,%eax
  1007b7:	c1 e0 02             	shl    $0x2,%eax
  1007ba:	89 c2                	mov    %eax,%edx
  1007bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007bf:	01 d0                	add    %edx,%eax
  1007c1:	8b 10                	mov    (%eax),%edx
  1007c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007c6:	01 c2                	add    %eax,%edx
  1007c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007cb:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007cd:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007d0:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007d3:	39 c2                	cmp    %eax,%edx
  1007d5:	7d 46                	jge    10081d <debuginfo_eip+0x31f>
        for (lline = lfun + 1;
  1007d7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007da:	40                   	inc    %eax
  1007db:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007de:	eb 16                	jmp    1007f6 <debuginfo_eip+0x2f8>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1007e0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007e3:	8b 40 14             	mov    0x14(%eax),%eax
  1007e6:	8d 50 01             	lea    0x1(%eax),%edx
  1007e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007ec:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  1007ef:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007f2:	40                   	inc    %eax
  1007f3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1007f6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007f9:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  1007fc:	39 c2                	cmp    %eax,%edx
  1007fe:	7d 1d                	jge    10081d <debuginfo_eip+0x31f>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100800:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100803:	89 c2                	mov    %eax,%edx
  100805:	89 d0                	mov    %edx,%eax
  100807:	01 c0                	add    %eax,%eax
  100809:	01 d0                	add    %edx,%eax
  10080b:	c1 e0 02             	shl    $0x2,%eax
  10080e:	89 c2                	mov    %eax,%edx
  100810:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100813:	01 d0                	add    %edx,%eax
  100815:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100819:	3c a0                	cmp    $0xa0,%al
  10081b:	74 c3                	je     1007e0 <debuginfo_eip+0x2e2>
        }
    }
    return 0;
  10081d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100822:	c9                   	leave  
  100823:	c3                   	ret    

00100824 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100824:	55                   	push   %ebp
  100825:	89 e5                	mov    %esp,%ebp
  100827:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  10082a:	c7 04 24 d6 32 10 00 	movl   $0x1032d6,(%esp)
  100831:	e8 d7 fa ff ff       	call   10030d <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100836:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10083d:	00 
  10083e:	c7 04 24 ef 32 10 00 	movl   $0x1032ef,(%esp)
  100845:	e8 c3 fa ff ff       	call   10030d <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  10084a:	c7 44 24 04 12 32 10 	movl   $0x103212,0x4(%esp)
  100851:	00 
  100852:	c7 04 24 07 33 10 00 	movl   $0x103307,(%esp)
  100859:	e8 af fa ff ff       	call   10030d <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  10085e:	c7 44 24 04 16 fa 10 	movl   $0x10fa16,0x4(%esp)
  100865:	00 
  100866:	c7 04 24 1f 33 10 00 	movl   $0x10331f,(%esp)
  10086d:	e8 9b fa ff ff       	call   10030d <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100872:	c7 44 24 04 20 0d 11 	movl   $0x110d20,0x4(%esp)
  100879:	00 
  10087a:	c7 04 24 37 33 10 00 	movl   $0x103337,(%esp)
  100881:	e8 87 fa ff ff       	call   10030d <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100886:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  10088b:	2d 00 00 10 00       	sub    $0x100000,%eax
  100890:	05 ff 03 00 00       	add    $0x3ff,%eax
  100895:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10089b:	85 c0                	test   %eax,%eax
  10089d:	0f 48 c2             	cmovs  %edx,%eax
  1008a0:	c1 f8 0a             	sar    $0xa,%eax
  1008a3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008a7:	c7 04 24 50 33 10 00 	movl   $0x103350,(%esp)
  1008ae:	e8 5a fa ff ff       	call   10030d <cprintf>
}
  1008b3:	90                   	nop
  1008b4:	c9                   	leave  
  1008b5:	c3                   	ret    

001008b6 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008b6:	55                   	push   %ebp
  1008b7:	89 e5                	mov    %esp,%ebp
  1008b9:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008bf:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008c2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1008c9:	89 04 24             	mov    %eax,(%esp)
  1008cc:	e8 2d fc ff ff       	call   1004fe <debuginfo_eip>
  1008d1:	85 c0                	test   %eax,%eax
  1008d3:	74 15                	je     1008ea <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1008d8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008dc:	c7 04 24 7a 33 10 00 	movl   $0x10337a,(%esp)
  1008e3:	e8 25 fa ff ff       	call   10030d <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  1008e8:	eb 6c                	jmp    100956 <print_debuginfo+0xa0>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1008ea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1008f1:	eb 1b                	jmp    10090e <print_debuginfo+0x58>
            fnname[j] = info.eip_fn_name[j];
  1008f3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1008f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008f9:	01 d0                	add    %edx,%eax
  1008fb:	0f b6 10             	movzbl (%eax),%edx
  1008fe:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100904:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100907:	01 c8                	add    %ecx,%eax
  100909:	88 10                	mov    %dl,(%eax)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  10090b:	ff 45 f4             	incl   -0xc(%ebp)
  10090e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100911:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100914:	7c dd                	jl     1008f3 <print_debuginfo+0x3d>
        fnname[j] = '\0';
  100916:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  10091c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10091f:	01 d0                	add    %edx,%eax
  100921:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100924:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100927:	8b 55 08             	mov    0x8(%ebp),%edx
  10092a:	89 d1                	mov    %edx,%ecx
  10092c:	29 c1                	sub    %eax,%ecx
  10092e:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100931:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100934:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100938:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10093e:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100942:	89 54 24 08          	mov    %edx,0x8(%esp)
  100946:	89 44 24 04          	mov    %eax,0x4(%esp)
  10094a:	c7 04 24 96 33 10 00 	movl   $0x103396,(%esp)
  100951:	e8 b7 f9 ff ff       	call   10030d <cprintf>
}
  100956:	90                   	nop
  100957:	c9                   	leave  
  100958:	c3                   	ret    

00100959 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100959:	55                   	push   %ebp
  10095a:	89 e5                	mov    %esp,%ebp
  10095c:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  10095f:	8b 45 04             	mov    0x4(%ebp),%eax
  100962:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100965:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100968:	c9                   	leave  
  100969:	c3                   	ret    

0010096a <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  10096a:	55                   	push   %ebp
  10096b:	89 e5                	mov    %esp,%ebp
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
}
  10096d:	90                   	nop
  10096e:	5d                   	pop    %ebp
  10096f:	c3                   	ret    

00100970 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100970:	55                   	push   %ebp
  100971:	89 e5                	mov    %esp,%ebp
  100973:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100976:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  10097d:	eb 0c                	jmp    10098b <parse+0x1b>
            *buf ++ = '\0';
  10097f:	8b 45 08             	mov    0x8(%ebp),%eax
  100982:	8d 50 01             	lea    0x1(%eax),%edx
  100985:	89 55 08             	mov    %edx,0x8(%ebp)
  100988:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  10098b:	8b 45 08             	mov    0x8(%ebp),%eax
  10098e:	0f b6 00             	movzbl (%eax),%eax
  100991:	84 c0                	test   %al,%al
  100993:	74 1d                	je     1009b2 <parse+0x42>
  100995:	8b 45 08             	mov    0x8(%ebp),%eax
  100998:	0f b6 00             	movzbl (%eax),%eax
  10099b:	0f be c0             	movsbl %al,%eax
  10099e:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009a2:	c7 04 24 28 34 10 00 	movl   $0x103428,(%esp)
  1009a9:	e8 27 25 00 00       	call   102ed5 <strchr>
  1009ae:	85 c0                	test   %eax,%eax
  1009b0:	75 cd                	jne    10097f <parse+0xf>
        }
        if (*buf == '\0') {
  1009b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1009b5:	0f b6 00             	movzbl (%eax),%eax
  1009b8:	84 c0                	test   %al,%al
  1009ba:	74 65                	je     100a21 <parse+0xb1>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  1009bc:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  1009c0:	75 14                	jne    1009d6 <parse+0x66>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  1009c2:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  1009c9:	00 
  1009ca:	c7 04 24 2d 34 10 00 	movl   $0x10342d,(%esp)
  1009d1:	e8 37 f9 ff ff       	call   10030d <cprintf>
        }
        argv[argc ++] = buf;
  1009d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009d9:	8d 50 01             	lea    0x1(%eax),%edx
  1009dc:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1009df:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  1009e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1009e9:	01 c2                	add    %eax,%edx
  1009eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1009ee:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  1009f0:	eb 03                	jmp    1009f5 <parse+0x85>
            buf ++;
  1009f2:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  1009f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1009f8:	0f b6 00             	movzbl (%eax),%eax
  1009fb:	84 c0                	test   %al,%al
  1009fd:	74 8c                	je     10098b <parse+0x1b>
  1009ff:	8b 45 08             	mov    0x8(%ebp),%eax
  100a02:	0f b6 00             	movzbl (%eax),%eax
  100a05:	0f be c0             	movsbl %al,%eax
  100a08:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a0c:	c7 04 24 28 34 10 00 	movl   $0x103428,(%esp)
  100a13:	e8 bd 24 00 00       	call   102ed5 <strchr>
  100a18:	85 c0                	test   %eax,%eax
  100a1a:	74 d6                	je     1009f2 <parse+0x82>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a1c:	e9 6a ff ff ff       	jmp    10098b <parse+0x1b>
            break;
  100a21:	90                   	nop
        }
    }
    return argc;
  100a22:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100a25:	c9                   	leave  
  100a26:	c3                   	ret    

00100a27 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100a27:	55                   	push   %ebp
  100a28:	89 e5                	mov    %esp,%ebp
  100a2a:	53                   	push   %ebx
  100a2b:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100a2e:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100a31:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a35:	8b 45 08             	mov    0x8(%ebp),%eax
  100a38:	89 04 24             	mov    %eax,(%esp)
  100a3b:	e8 30 ff ff ff       	call   100970 <parse>
  100a40:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100a43:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100a47:	75 0a                	jne    100a53 <runcmd+0x2c>
        return 0;
  100a49:	b8 00 00 00 00       	mov    $0x0,%eax
  100a4e:	e9 83 00 00 00       	jmp    100ad6 <runcmd+0xaf>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100a53:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100a5a:	eb 5a                	jmp    100ab6 <runcmd+0x8f>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100a5c:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100a5f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a62:	89 d0                	mov    %edx,%eax
  100a64:	01 c0                	add    %eax,%eax
  100a66:	01 d0                	add    %edx,%eax
  100a68:	c1 e0 02             	shl    $0x2,%eax
  100a6b:	05 00 f0 10 00       	add    $0x10f000,%eax
  100a70:	8b 00                	mov    (%eax),%eax
  100a72:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100a76:	89 04 24             	mov    %eax,(%esp)
  100a79:	e8 bb 23 00 00       	call   102e39 <strcmp>
  100a7e:	85 c0                	test   %eax,%eax
  100a80:	75 31                	jne    100ab3 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100a82:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a85:	89 d0                	mov    %edx,%eax
  100a87:	01 c0                	add    %eax,%eax
  100a89:	01 d0                	add    %edx,%eax
  100a8b:	c1 e0 02             	shl    $0x2,%eax
  100a8e:	05 08 f0 10 00       	add    $0x10f008,%eax
  100a93:	8b 10                	mov    (%eax),%edx
  100a95:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100a98:	83 c0 04             	add    $0x4,%eax
  100a9b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100a9e:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100aa1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100aa4:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100aa8:	89 44 24 04          	mov    %eax,0x4(%esp)
  100aac:	89 1c 24             	mov    %ebx,(%esp)
  100aaf:	ff d2                	call   *%edx
  100ab1:	eb 23                	jmp    100ad6 <runcmd+0xaf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100ab3:	ff 45 f4             	incl   -0xc(%ebp)
  100ab6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ab9:	83 f8 02             	cmp    $0x2,%eax
  100abc:	76 9e                	jbe    100a5c <runcmd+0x35>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100abe:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100ac1:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ac5:	c7 04 24 4b 34 10 00 	movl   $0x10344b,(%esp)
  100acc:	e8 3c f8 ff ff       	call   10030d <cprintf>
    return 0;
  100ad1:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100ad6:	83 c4 64             	add    $0x64,%esp
  100ad9:	5b                   	pop    %ebx
  100ada:	5d                   	pop    %ebp
  100adb:	c3                   	ret    

00100adc <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100adc:	55                   	push   %ebp
  100add:	89 e5                	mov    %esp,%ebp
  100adf:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100ae2:	c7 04 24 64 34 10 00 	movl   $0x103464,(%esp)
  100ae9:	e8 1f f8 ff ff       	call   10030d <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100aee:	c7 04 24 8c 34 10 00 	movl   $0x10348c,(%esp)
  100af5:	e8 13 f8 ff ff       	call   10030d <cprintf>

    if (tf != NULL) {
  100afa:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100afe:	74 0b                	je     100b0b <kmonitor+0x2f>
        print_trapframe(tf);
  100b00:	8b 45 08             	mov    0x8(%ebp),%eax
  100b03:	89 04 24             	mov    %eax,(%esp)
  100b06:	e8 c0 0c 00 00       	call   1017cb <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100b0b:	c7 04 24 b1 34 10 00 	movl   $0x1034b1,(%esp)
  100b12:	e8 ed f6 ff ff       	call   100204 <readline>
  100b17:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100b1a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100b1e:	74 eb                	je     100b0b <kmonitor+0x2f>
            if (runcmd(buf, tf) < 0) {
  100b20:	8b 45 08             	mov    0x8(%ebp),%eax
  100b23:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b27:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b2a:	89 04 24             	mov    %eax,(%esp)
  100b2d:	e8 f5 fe ff ff       	call   100a27 <runcmd>
  100b32:	85 c0                	test   %eax,%eax
  100b34:	78 02                	js     100b38 <kmonitor+0x5c>
        if ((buf = readline("K> ")) != NULL) {
  100b36:	eb d3                	jmp    100b0b <kmonitor+0x2f>
                break;
  100b38:	90                   	nop
            }
        }
    }
}
  100b39:	90                   	nop
  100b3a:	c9                   	leave  
  100b3b:	c3                   	ret    

00100b3c <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100b3c:	55                   	push   %ebp
  100b3d:	89 e5                	mov    %esp,%ebp
  100b3f:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b42:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b49:	eb 3d                	jmp    100b88 <mon_help+0x4c>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100b4b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b4e:	89 d0                	mov    %edx,%eax
  100b50:	01 c0                	add    %eax,%eax
  100b52:	01 d0                	add    %edx,%eax
  100b54:	c1 e0 02             	shl    $0x2,%eax
  100b57:	05 04 f0 10 00       	add    $0x10f004,%eax
  100b5c:	8b 08                	mov    (%eax),%ecx
  100b5e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b61:	89 d0                	mov    %edx,%eax
  100b63:	01 c0                	add    %eax,%eax
  100b65:	01 d0                	add    %edx,%eax
  100b67:	c1 e0 02             	shl    $0x2,%eax
  100b6a:	05 00 f0 10 00       	add    $0x10f000,%eax
  100b6f:	8b 00                	mov    (%eax),%eax
  100b71:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100b75:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b79:	c7 04 24 b5 34 10 00 	movl   $0x1034b5,(%esp)
  100b80:	e8 88 f7 ff ff       	call   10030d <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100b85:	ff 45 f4             	incl   -0xc(%ebp)
  100b88:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b8b:	83 f8 02             	cmp    $0x2,%eax
  100b8e:	76 bb                	jbe    100b4b <mon_help+0xf>
    }
    return 0;
  100b90:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100b95:	c9                   	leave  
  100b96:	c3                   	ret    

00100b97 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100b97:	55                   	push   %ebp
  100b98:	89 e5                	mov    %esp,%ebp
  100b9a:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100b9d:	e8 82 fc ff ff       	call   100824 <print_kerninfo>
    return 0;
  100ba2:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100ba7:	c9                   	leave  
  100ba8:	c3                   	ret    

00100ba9 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100ba9:	55                   	push   %ebp
  100baa:	89 e5                	mov    %esp,%ebp
  100bac:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100baf:	e8 b6 fd ff ff       	call   10096a <print_stackframe>
    return 0;
  100bb4:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100bb9:	c9                   	leave  
  100bba:	c3                   	ret    

00100bbb <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100bbb:	55                   	push   %ebp
  100bbc:	89 e5                	mov    %esp,%ebp
  100bbe:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100bc1:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  100bc6:	85 c0                	test   %eax,%eax
  100bc8:	75 5b                	jne    100c25 <__panic+0x6a>
        goto panic_dead;
    }
    is_panic = 1;
  100bca:	c7 05 40 fe 10 00 01 	movl   $0x1,0x10fe40
  100bd1:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100bd4:	8d 45 14             	lea    0x14(%ebp),%eax
  100bd7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100bda:	8b 45 0c             	mov    0xc(%ebp),%eax
  100bdd:	89 44 24 08          	mov    %eax,0x8(%esp)
  100be1:	8b 45 08             	mov    0x8(%ebp),%eax
  100be4:	89 44 24 04          	mov    %eax,0x4(%esp)
  100be8:	c7 04 24 be 34 10 00 	movl   $0x1034be,(%esp)
  100bef:	e8 19 f7 ff ff       	call   10030d <cprintf>
    vcprintf(fmt, ap);
  100bf4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bf7:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bfb:	8b 45 10             	mov    0x10(%ebp),%eax
  100bfe:	89 04 24             	mov    %eax,(%esp)
  100c01:	e8 d4 f6 ff ff       	call   1002da <vcprintf>
    cprintf("\n");
  100c06:	c7 04 24 da 34 10 00 	movl   $0x1034da,(%esp)
  100c0d:	e8 fb f6 ff ff       	call   10030d <cprintf>
    
    cprintf("stack trackback:\n");
  100c12:	c7 04 24 dc 34 10 00 	movl   $0x1034dc,(%esp)
  100c19:	e8 ef f6 ff ff       	call   10030d <cprintf>
    print_stackframe();
  100c1e:	e8 47 fd ff ff       	call   10096a <print_stackframe>
  100c23:	eb 01                	jmp    100c26 <__panic+0x6b>
        goto panic_dead;
  100c25:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  100c26:	e8 59 09 00 00       	call   101584 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100c2b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100c32:	e8 a5 fe ff ff       	call   100adc <kmonitor>
  100c37:	eb f2                	jmp    100c2b <__panic+0x70>

00100c39 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100c39:	55                   	push   %ebp
  100c3a:	89 e5                	mov    %esp,%ebp
  100c3c:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100c3f:	8d 45 14             	lea    0x14(%ebp),%eax
  100c42:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100c45:	8b 45 0c             	mov    0xc(%ebp),%eax
  100c48:	89 44 24 08          	mov    %eax,0x8(%esp)
  100c4c:	8b 45 08             	mov    0x8(%ebp),%eax
  100c4f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c53:	c7 04 24 ee 34 10 00 	movl   $0x1034ee,(%esp)
  100c5a:	e8 ae f6 ff ff       	call   10030d <cprintf>
    vcprintf(fmt, ap);
  100c5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c62:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c66:	8b 45 10             	mov    0x10(%ebp),%eax
  100c69:	89 04 24             	mov    %eax,(%esp)
  100c6c:	e8 69 f6 ff ff       	call   1002da <vcprintf>
    cprintf("\n");
  100c71:	c7 04 24 da 34 10 00 	movl   $0x1034da,(%esp)
  100c78:	e8 90 f6 ff ff       	call   10030d <cprintf>
    va_end(ap);
}
  100c7d:	90                   	nop
  100c7e:	c9                   	leave  
  100c7f:	c3                   	ret    

00100c80 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100c80:	55                   	push   %ebp
  100c81:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100c83:	a1 40 fe 10 00       	mov    0x10fe40,%eax
}
  100c88:	5d                   	pop    %ebp
  100c89:	c3                   	ret    

00100c8a <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100c8a:	55                   	push   %ebp
  100c8b:	89 e5                	mov    %esp,%ebp
  100c8d:	83 ec 28             	sub    $0x28,%esp
  100c90:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100c96:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100c9a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100c9e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100ca2:	ee                   	out    %al,(%dx)
}
  100ca3:	90                   	nop
  100ca4:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100caa:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100cae:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100cb2:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100cb6:	ee                   	out    %al,(%dx)
}
  100cb7:	90                   	nop
  100cb8:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100cbe:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100cc2:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100cc6:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100cca:	ee                   	out    %al,(%dx)
}
  100ccb:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100ccc:	c7 05 08 09 11 00 00 	movl   $0x0,0x110908
  100cd3:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100cd6:	c7 04 24 0c 35 10 00 	movl   $0x10350c,(%esp)
  100cdd:	e8 2b f6 ff ff       	call   10030d <cprintf>
    pic_enable(IRQ_TIMER);
  100ce2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100ce9:	e8 f9 08 00 00       	call   1015e7 <pic_enable>
}
  100cee:	90                   	nop
  100cef:	c9                   	leave  
  100cf0:	c3                   	ret    

00100cf1 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100cf1:	55                   	push   %ebp
  100cf2:	89 e5                	mov    %esp,%ebp
  100cf4:	83 ec 10             	sub    $0x10,%esp
  100cf7:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100cfd:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100d01:	89 c2                	mov    %eax,%edx
  100d03:	ec                   	in     (%dx),%al
  100d04:	88 45 f1             	mov    %al,-0xf(%ebp)
  100d07:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100d0d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100d11:	89 c2                	mov    %eax,%edx
  100d13:	ec                   	in     (%dx),%al
  100d14:	88 45 f5             	mov    %al,-0xb(%ebp)
  100d17:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100d1d:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100d21:	89 c2                	mov    %eax,%edx
  100d23:	ec                   	in     (%dx),%al
  100d24:	88 45 f9             	mov    %al,-0x7(%ebp)
  100d27:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100d2d:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100d31:	89 c2                	mov    %eax,%edx
  100d33:	ec                   	in     (%dx),%al
  100d34:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100d37:	90                   	nop
  100d38:	c9                   	leave  
  100d39:	c3                   	ret    

00100d3a <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100d3a:	55                   	push   %ebp
  100d3b:	89 e5                	mov    %esp,%ebp
  100d3d:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100d40:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100d47:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100d4a:	0f b7 00             	movzwl (%eax),%eax
  100d4d:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100d51:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100d54:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100d59:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100d5c:	0f b7 00             	movzwl (%eax),%eax
  100d5f:	0f b7 c0             	movzwl %ax,%eax
  100d62:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100d67:	74 12                	je     100d7b <cga_init+0x41>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100d69:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100d70:	66 c7 05 66 fe 10 00 	movw   $0x3b4,0x10fe66
  100d77:	b4 03 
  100d79:	eb 13                	jmp    100d8e <cga_init+0x54>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100d7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100d7e:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100d82:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100d85:	66 c7 05 66 fe 10 00 	movw   $0x3d4,0x10fe66
  100d8c:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100d8e:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100d95:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100d99:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d9d:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100da1:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100da5:	ee                   	out    %al,(%dx)
}
  100da6:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100da7:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100dae:	40                   	inc    %eax
  100daf:	0f b7 c0             	movzwl %ax,%eax
  100db2:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100db6:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100dba:	89 c2                	mov    %eax,%edx
  100dbc:	ec                   	in     (%dx),%al
  100dbd:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100dc0:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100dc4:	0f b6 c0             	movzbl %al,%eax
  100dc7:	c1 e0 08             	shl    $0x8,%eax
  100dca:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100dcd:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100dd4:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100dd8:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ddc:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100de0:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100de4:	ee                   	out    %al,(%dx)
}
  100de5:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100de6:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ded:	40                   	inc    %eax
  100dee:	0f b7 c0             	movzwl %ax,%eax
  100df1:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100df5:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100df9:	89 c2                	mov    %eax,%edx
  100dfb:	ec                   	in     (%dx),%al
  100dfc:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100dff:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100e03:	0f b6 c0             	movzbl %al,%eax
  100e06:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100e09:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e0c:	a3 60 fe 10 00       	mov    %eax,0x10fe60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100e11:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e14:	0f b7 c0             	movzwl %ax,%eax
  100e17:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
}
  100e1d:	90                   	nop
  100e1e:	c9                   	leave  
  100e1f:	c3                   	ret    

00100e20 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100e20:	55                   	push   %ebp
  100e21:	89 e5                	mov    %esp,%ebp
  100e23:	83 ec 48             	sub    $0x48,%esp
  100e26:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100e2c:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e30:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100e34:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100e38:	ee                   	out    %al,(%dx)
}
  100e39:	90                   	nop
  100e3a:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100e40:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e44:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100e48:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100e4c:	ee                   	out    %al,(%dx)
}
  100e4d:	90                   	nop
  100e4e:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100e54:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e58:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100e5c:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100e60:	ee                   	out    %al,(%dx)
}
  100e61:	90                   	nop
  100e62:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100e68:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e6c:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100e70:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100e74:	ee                   	out    %al,(%dx)
}
  100e75:	90                   	nop
  100e76:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100e7c:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e80:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100e84:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100e88:	ee                   	out    %al,(%dx)
}
  100e89:	90                   	nop
  100e8a:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100e90:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e94:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100e98:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100e9c:	ee                   	out    %al,(%dx)
}
  100e9d:	90                   	nop
  100e9e:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100ea4:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ea8:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100eac:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100eb0:	ee                   	out    %al,(%dx)
}
  100eb1:	90                   	nop
  100eb2:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100eb8:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100ebc:	89 c2                	mov    %eax,%edx
  100ebe:	ec                   	in     (%dx),%al
  100ebf:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100ec2:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100ec6:	3c ff                	cmp    $0xff,%al
  100ec8:	0f 95 c0             	setne  %al
  100ecb:	0f b6 c0             	movzbl %al,%eax
  100ece:	a3 68 fe 10 00       	mov    %eax,0x10fe68
  100ed3:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ed9:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100edd:	89 c2                	mov    %eax,%edx
  100edf:	ec                   	in     (%dx),%al
  100ee0:	88 45 f1             	mov    %al,-0xf(%ebp)
  100ee3:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  100ee9:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100eed:	89 c2                	mov    %eax,%edx
  100eef:	ec                   	in     (%dx),%al
  100ef0:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100ef3:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  100ef8:	85 c0                	test   %eax,%eax
  100efa:	74 0c                	je     100f08 <serial_init+0xe8>
        pic_enable(IRQ_COM1);
  100efc:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100f03:	e8 df 06 00 00       	call   1015e7 <pic_enable>
    }
}
  100f08:	90                   	nop
  100f09:	c9                   	leave  
  100f0a:	c3                   	ret    

00100f0b <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100f0b:	55                   	push   %ebp
  100f0c:	89 e5                	mov    %esp,%ebp
  100f0e:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100f11:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100f18:	eb 08                	jmp    100f22 <lpt_putc_sub+0x17>
        delay();
  100f1a:	e8 d2 fd ff ff       	call   100cf1 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100f1f:	ff 45 fc             	incl   -0x4(%ebp)
  100f22:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100f28:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100f2c:	89 c2                	mov    %eax,%edx
  100f2e:	ec                   	in     (%dx),%al
  100f2f:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100f32:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  100f36:	84 c0                	test   %al,%al
  100f38:	78 09                	js     100f43 <lpt_putc_sub+0x38>
  100f3a:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100f41:	7e d7                	jle    100f1a <lpt_putc_sub+0xf>
    }
    outb(LPTPORT + 0, c);
  100f43:	8b 45 08             	mov    0x8(%ebp),%eax
  100f46:	0f b6 c0             	movzbl %al,%eax
  100f49:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  100f4f:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f52:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f56:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f5a:	ee                   	out    %al,(%dx)
}
  100f5b:	90                   	nop
  100f5c:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  100f62:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f66:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f6a:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f6e:	ee                   	out    %al,(%dx)
}
  100f6f:	90                   	nop
  100f70:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  100f76:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f7a:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100f7e:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f82:	ee                   	out    %al,(%dx)
}
  100f83:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  100f84:	90                   	nop
  100f85:	c9                   	leave  
  100f86:	c3                   	ret    

00100f87 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  100f87:	55                   	push   %ebp
  100f88:	89 e5                	mov    %esp,%ebp
  100f8a:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  100f8d:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  100f91:	74 0d                	je     100fa0 <lpt_putc+0x19>
        lpt_putc_sub(c);
  100f93:	8b 45 08             	mov    0x8(%ebp),%eax
  100f96:	89 04 24             	mov    %eax,(%esp)
  100f99:	e8 6d ff ff ff       	call   100f0b <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  100f9e:	eb 24                	jmp    100fc4 <lpt_putc+0x3d>
        lpt_putc_sub('\b');
  100fa0:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  100fa7:	e8 5f ff ff ff       	call   100f0b <lpt_putc_sub>
        lpt_putc_sub(' ');
  100fac:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  100fb3:	e8 53 ff ff ff       	call   100f0b <lpt_putc_sub>
        lpt_putc_sub('\b');
  100fb8:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  100fbf:	e8 47 ff ff ff       	call   100f0b <lpt_putc_sub>
}
  100fc4:	90                   	nop
  100fc5:	c9                   	leave  
  100fc6:	c3                   	ret    

00100fc7 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  100fc7:	55                   	push   %ebp
  100fc8:	89 e5                	mov    %esp,%ebp
  100fca:	53                   	push   %ebx
  100fcb:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  100fce:	8b 45 08             	mov    0x8(%ebp),%eax
  100fd1:	25 00 ff ff ff       	and    $0xffffff00,%eax
  100fd6:	85 c0                	test   %eax,%eax
  100fd8:	75 07                	jne    100fe1 <cga_putc+0x1a>
        c |= 0x0700;
  100fda:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  100fe1:	8b 45 08             	mov    0x8(%ebp),%eax
  100fe4:	0f b6 c0             	movzbl %al,%eax
  100fe7:	83 f8 0d             	cmp    $0xd,%eax
  100fea:	74 72                	je     10105e <cga_putc+0x97>
  100fec:	83 f8 0d             	cmp    $0xd,%eax
  100fef:	0f 8f a3 00 00 00    	jg     101098 <cga_putc+0xd1>
  100ff5:	83 f8 08             	cmp    $0x8,%eax
  100ff8:	74 0a                	je     101004 <cga_putc+0x3d>
  100ffa:	83 f8 0a             	cmp    $0xa,%eax
  100ffd:	74 4c                	je     10104b <cga_putc+0x84>
  100fff:	e9 94 00 00 00       	jmp    101098 <cga_putc+0xd1>
    case '\b':
        if (crt_pos > 0) {
  101004:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10100b:	85 c0                	test   %eax,%eax
  10100d:	0f 84 af 00 00 00    	je     1010c2 <cga_putc+0xfb>
            crt_pos --;
  101013:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10101a:	48                   	dec    %eax
  10101b:	0f b7 c0             	movzwl %ax,%eax
  10101e:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  101024:	8b 45 08             	mov    0x8(%ebp),%eax
  101027:	98                   	cwtl   
  101028:	25 00 ff ff ff       	and    $0xffffff00,%eax
  10102d:	98                   	cwtl   
  10102e:	83 c8 20             	or     $0x20,%eax
  101031:	98                   	cwtl   
  101032:	8b 15 60 fe 10 00    	mov    0x10fe60,%edx
  101038:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  10103f:	01 c9                	add    %ecx,%ecx
  101041:	01 ca                	add    %ecx,%edx
  101043:	0f b7 c0             	movzwl %ax,%eax
  101046:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101049:	eb 77                	jmp    1010c2 <cga_putc+0xfb>
    case '\n':
        crt_pos += CRT_COLS;
  10104b:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101052:	83 c0 50             	add    $0x50,%eax
  101055:	0f b7 c0             	movzwl %ax,%eax
  101058:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  10105e:	0f b7 1d 64 fe 10 00 	movzwl 0x10fe64,%ebx
  101065:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  10106c:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  101071:	89 c8                	mov    %ecx,%eax
  101073:	f7 e2                	mul    %edx
  101075:	c1 ea 06             	shr    $0x6,%edx
  101078:	89 d0                	mov    %edx,%eax
  10107a:	c1 e0 02             	shl    $0x2,%eax
  10107d:	01 d0                	add    %edx,%eax
  10107f:	c1 e0 04             	shl    $0x4,%eax
  101082:	29 c1                	sub    %eax,%ecx
  101084:	89 c8                	mov    %ecx,%eax
  101086:	0f b7 c0             	movzwl %ax,%eax
  101089:	29 c3                	sub    %eax,%ebx
  10108b:	89 d8                	mov    %ebx,%eax
  10108d:	0f b7 c0             	movzwl %ax,%eax
  101090:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
        break;
  101096:	eb 2b                	jmp    1010c3 <cga_putc+0xfc>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101098:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  10109e:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1010a5:	8d 50 01             	lea    0x1(%eax),%edx
  1010a8:	0f b7 d2             	movzwl %dx,%edx
  1010ab:	66 89 15 64 fe 10 00 	mov    %dx,0x10fe64
  1010b2:	01 c0                	add    %eax,%eax
  1010b4:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  1010b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1010ba:	0f b7 c0             	movzwl %ax,%eax
  1010bd:	66 89 02             	mov    %ax,(%edx)
        break;
  1010c0:	eb 01                	jmp    1010c3 <cga_putc+0xfc>
        break;
  1010c2:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  1010c3:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1010ca:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  1010cf:	76 5d                	jbe    10112e <cga_putc+0x167>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  1010d1:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  1010d6:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1010dc:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  1010e1:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  1010e8:	00 
  1010e9:	89 54 24 04          	mov    %edx,0x4(%esp)
  1010ed:	89 04 24             	mov    %eax,(%esp)
  1010f0:	e8 d5 1f 00 00       	call   1030ca <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1010f5:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1010fc:	eb 14                	jmp    101112 <cga_putc+0x14b>
            crt_buf[i] = 0x0700 | ' ';
  1010fe:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101103:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101106:	01 d2                	add    %edx,%edx
  101108:	01 d0                	add    %edx,%eax
  10110a:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10110f:	ff 45 f4             	incl   -0xc(%ebp)
  101112:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101119:	7e e3                	jle    1010fe <cga_putc+0x137>
        }
        crt_pos -= CRT_COLS;
  10111b:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101122:	83 e8 50             	sub    $0x50,%eax
  101125:	0f b7 c0             	movzwl %ax,%eax
  101128:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  10112e:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  101135:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101139:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10113d:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101141:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101145:	ee                   	out    %al,(%dx)
}
  101146:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  101147:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10114e:	c1 e8 08             	shr    $0x8,%eax
  101151:	0f b7 c0             	movzwl %ax,%eax
  101154:	0f b6 c0             	movzbl %al,%eax
  101157:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  10115e:	42                   	inc    %edx
  10115f:	0f b7 d2             	movzwl %dx,%edx
  101162:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  101166:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101169:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10116d:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101171:	ee                   	out    %al,(%dx)
}
  101172:	90                   	nop
    outb(addr_6845, 15);
  101173:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  10117a:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  10117e:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101182:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101186:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10118a:	ee                   	out    %al,(%dx)
}
  10118b:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  10118c:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101193:	0f b6 c0             	movzbl %al,%eax
  101196:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  10119d:	42                   	inc    %edx
  10119e:	0f b7 d2             	movzwl %dx,%edx
  1011a1:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  1011a5:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1011a8:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1011ac:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011b0:	ee                   	out    %al,(%dx)
}
  1011b1:	90                   	nop
}
  1011b2:	90                   	nop
  1011b3:	83 c4 34             	add    $0x34,%esp
  1011b6:	5b                   	pop    %ebx
  1011b7:	5d                   	pop    %ebp
  1011b8:	c3                   	ret    

001011b9 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  1011b9:	55                   	push   %ebp
  1011ba:	89 e5                	mov    %esp,%ebp
  1011bc:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1011bf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1011c6:	eb 08                	jmp    1011d0 <serial_putc_sub+0x17>
        delay();
  1011c8:	e8 24 fb ff ff       	call   100cf1 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1011cd:	ff 45 fc             	incl   -0x4(%ebp)
  1011d0:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1011d6:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1011da:	89 c2                	mov    %eax,%edx
  1011dc:	ec                   	in     (%dx),%al
  1011dd:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1011e0:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1011e4:	0f b6 c0             	movzbl %al,%eax
  1011e7:	83 e0 20             	and    $0x20,%eax
  1011ea:	85 c0                	test   %eax,%eax
  1011ec:	75 09                	jne    1011f7 <serial_putc_sub+0x3e>
  1011ee:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1011f5:	7e d1                	jle    1011c8 <serial_putc_sub+0xf>
    }
    outb(COM1 + COM_TX, c);
  1011f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1011fa:	0f b6 c0             	movzbl %al,%eax
  1011fd:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101203:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101206:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10120a:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10120e:	ee                   	out    %al,(%dx)
}
  10120f:	90                   	nop
}
  101210:	90                   	nop
  101211:	c9                   	leave  
  101212:	c3                   	ret    

00101213 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101213:	55                   	push   %ebp
  101214:	89 e5                	mov    %esp,%ebp
  101216:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101219:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10121d:	74 0d                	je     10122c <serial_putc+0x19>
        serial_putc_sub(c);
  10121f:	8b 45 08             	mov    0x8(%ebp),%eax
  101222:	89 04 24             	mov    %eax,(%esp)
  101225:	e8 8f ff ff ff       	call   1011b9 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  10122a:	eb 24                	jmp    101250 <serial_putc+0x3d>
        serial_putc_sub('\b');
  10122c:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101233:	e8 81 ff ff ff       	call   1011b9 <serial_putc_sub>
        serial_putc_sub(' ');
  101238:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10123f:	e8 75 ff ff ff       	call   1011b9 <serial_putc_sub>
        serial_putc_sub('\b');
  101244:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10124b:	e8 69 ff ff ff       	call   1011b9 <serial_putc_sub>
}
  101250:	90                   	nop
  101251:	c9                   	leave  
  101252:	c3                   	ret    

00101253 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101253:	55                   	push   %ebp
  101254:	89 e5                	mov    %esp,%ebp
  101256:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101259:	eb 33                	jmp    10128e <cons_intr+0x3b>
        if (c != 0) {
  10125b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10125f:	74 2d                	je     10128e <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101261:	a1 84 00 11 00       	mov    0x110084,%eax
  101266:	8d 50 01             	lea    0x1(%eax),%edx
  101269:	89 15 84 00 11 00    	mov    %edx,0x110084
  10126f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101272:	88 90 80 fe 10 00    	mov    %dl,0x10fe80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101278:	a1 84 00 11 00       	mov    0x110084,%eax
  10127d:	3d 00 02 00 00       	cmp    $0x200,%eax
  101282:	75 0a                	jne    10128e <cons_intr+0x3b>
                cons.wpos = 0;
  101284:	c7 05 84 00 11 00 00 	movl   $0x0,0x110084
  10128b:	00 00 00 
    while ((c = (*proc)()) != -1) {
  10128e:	8b 45 08             	mov    0x8(%ebp),%eax
  101291:	ff d0                	call   *%eax
  101293:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101296:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10129a:	75 bf                	jne    10125b <cons_intr+0x8>
            }
        }
    }
}
  10129c:	90                   	nop
  10129d:	90                   	nop
  10129e:	c9                   	leave  
  10129f:	c3                   	ret    

001012a0 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1012a0:	55                   	push   %ebp
  1012a1:	89 e5                	mov    %esp,%ebp
  1012a3:	83 ec 10             	sub    $0x10,%esp
  1012a6:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012ac:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1012b0:	89 c2                	mov    %eax,%edx
  1012b2:	ec                   	in     (%dx),%al
  1012b3:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1012b6:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  1012ba:	0f b6 c0             	movzbl %al,%eax
  1012bd:	83 e0 01             	and    $0x1,%eax
  1012c0:	85 c0                	test   %eax,%eax
  1012c2:	75 07                	jne    1012cb <serial_proc_data+0x2b>
        return -1;
  1012c4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1012c9:	eb 2a                	jmp    1012f5 <serial_proc_data+0x55>
  1012cb:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012d1:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1012d5:	89 c2                	mov    %eax,%edx
  1012d7:	ec                   	in     (%dx),%al
  1012d8:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  1012db:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  1012df:	0f b6 c0             	movzbl %al,%eax
  1012e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  1012e5:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  1012e9:	75 07                	jne    1012f2 <serial_proc_data+0x52>
        c = '\b';
  1012eb:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  1012f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1012f5:	c9                   	leave  
  1012f6:	c3                   	ret    

001012f7 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1012f7:	55                   	push   %ebp
  1012f8:	89 e5                	mov    %esp,%ebp
  1012fa:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1012fd:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101302:	85 c0                	test   %eax,%eax
  101304:	74 0c                	je     101312 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  101306:	c7 04 24 a0 12 10 00 	movl   $0x1012a0,(%esp)
  10130d:	e8 41 ff ff ff       	call   101253 <cons_intr>
    }
}
  101312:	90                   	nop
  101313:	c9                   	leave  
  101314:	c3                   	ret    

00101315 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101315:	55                   	push   %ebp
  101316:	89 e5                	mov    %esp,%ebp
  101318:	83 ec 38             	sub    $0x38,%esp
  10131b:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101321:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101324:	89 c2                	mov    %eax,%edx
  101326:	ec                   	in     (%dx),%al
  101327:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  10132a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  10132e:	0f b6 c0             	movzbl %al,%eax
  101331:	83 e0 01             	and    $0x1,%eax
  101334:	85 c0                	test   %eax,%eax
  101336:	75 0a                	jne    101342 <kbd_proc_data+0x2d>
        return -1;
  101338:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10133d:	e9 56 01 00 00       	jmp    101498 <kbd_proc_data+0x183>
  101342:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101348:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10134b:	89 c2                	mov    %eax,%edx
  10134d:	ec                   	in     (%dx),%al
  10134e:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  101351:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  101355:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  101358:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  10135c:	75 17                	jne    101375 <kbd_proc_data+0x60>
        // E0 escape character
        shift |= E0ESC;
  10135e:	a1 88 00 11 00       	mov    0x110088,%eax
  101363:	83 c8 40             	or     $0x40,%eax
  101366:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  10136b:	b8 00 00 00 00       	mov    $0x0,%eax
  101370:	e9 23 01 00 00       	jmp    101498 <kbd_proc_data+0x183>
    } else if (data & 0x80) {
  101375:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101379:	84 c0                	test   %al,%al
  10137b:	79 45                	jns    1013c2 <kbd_proc_data+0xad>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  10137d:	a1 88 00 11 00       	mov    0x110088,%eax
  101382:	83 e0 40             	and    $0x40,%eax
  101385:	85 c0                	test   %eax,%eax
  101387:	75 08                	jne    101391 <kbd_proc_data+0x7c>
  101389:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10138d:	24 7f                	and    $0x7f,%al
  10138f:	eb 04                	jmp    101395 <kbd_proc_data+0x80>
  101391:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101395:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101398:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10139c:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  1013a3:	0c 40                	or     $0x40,%al
  1013a5:	0f b6 c0             	movzbl %al,%eax
  1013a8:	f7 d0                	not    %eax
  1013aa:	89 c2                	mov    %eax,%edx
  1013ac:	a1 88 00 11 00       	mov    0x110088,%eax
  1013b1:	21 d0                	and    %edx,%eax
  1013b3:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  1013b8:	b8 00 00 00 00       	mov    $0x0,%eax
  1013bd:	e9 d6 00 00 00       	jmp    101498 <kbd_proc_data+0x183>
    } else if (shift & E0ESC) {
  1013c2:	a1 88 00 11 00       	mov    0x110088,%eax
  1013c7:	83 e0 40             	and    $0x40,%eax
  1013ca:	85 c0                	test   %eax,%eax
  1013cc:	74 11                	je     1013df <kbd_proc_data+0xca>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  1013ce:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  1013d2:	a1 88 00 11 00       	mov    0x110088,%eax
  1013d7:	83 e0 bf             	and    $0xffffffbf,%eax
  1013da:	a3 88 00 11 00       	mov    %eax,0x110088
    }

    shift |= shiftcode[data];
  1013df:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013e3:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  1013ea:	0f b6 d0             	movzbl %al,%edx
  1013ed:	a1 88 00 11 00       	mov    0x110088,%eax
  1013f2:	09 d0                	or     %edx,%eax
  1013f4:	a3 88 00 11 00       	mov    %eax,0x110088
    shift ^= togglecode[data];
  1013f9:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013fd:	0f b6 80 40 f1 10 00 	movzbl 0x10f140(%eax),%eax
  101404:	0f b6 d0             	movzbl %al,%edx
  101407:	a1 88 00 11 00       	mov    0x110088,%eax
  10140c:	31 d0                	xor    %edx,%eax
  10140e:	a3 88 00 11 00       	mov    %eax,0x110088

    c = charcode[shift & (CTL | SHIFT)][data];
  101413:	a1 88 00 11 00       	mov    0x110088,%eax
  101418:	83 e0 03             	and    $0x3,%eax
  10141b:	8b 14 85 40 f5 10 00 	mov    0x10f540(,%eax,4),%edx
  101422:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101426:	01 d0                	add    %edx,%eax
  101428:	0f b6 00             	movzbl (%eax),%eax
  10142b:	0f b6 c0             	movzbl %al,%eax
  10142e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101431:	a1 88 00 11 00       	mov    0x110088,%eax
  101436:	83 e0 08             	and    $0x8,%eax
  101439:	85 c0                	test   %eax,%eax
  10143b:	74 22                	je     10145f <kbd_proc_data+0x14a>
        if ('a' <= c && c <= 'z')
  10143d:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  101441:	7e 0c                	jle    10144f <kbd_proc_data+0x13a>
  101443:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  101447:	7f 06                	jg     10144f <kbd_proc_data+0x13a>
            c += 'A' - 'a';
  101449:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  10144d:	eb 10                	jmp    10145f <kbd_proc_data+0x14a>
        else if ('A' <= c && c <= 'Z')
  10144f:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101453:	7e 0a                	jle    10145f <kbd_proc_data+0x14a>
  101455:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  101459:	7f 04                	jg     10145f <kbd_proc_data+0x14a>
            c += 'a' - 'A';
  10145b:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  10145f:	a1 88 00 11 00       	mov    0x110088,%eax
  101464:	f7 d0                	not    %eax
  101466:	83 e0 06             	and    $0x6,%eax
  101469:	85 c0                	test   %eax,%eax
  10146b:	75 28                	jne    101495 <kbd_proc_data+0x180>
  10146d:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101474:	75 1f                	jne    101495 <kbd_proc_data+0x180>
        cprintf("Rebooting!\n");
  101476:	c7 04 24 27 35 10 00 	movl   $0x103527,(%esp)
  10147d:	e8 8b ee ff ff       	call   10030d <cprintf>
  101482:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101488:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10148c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101490:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101493:	ee                   	out    %al,(%dx)
}
  101494:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101495:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101498:	c9                   	leave  
  101499:	c3                   	ret    

0010149a <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  10149a:	55                   	push   %ebp
  10149b:	89 e5                	mov    %esp,%ebp
  10149d:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  1014a0:	c7 04 24 15 13 10 00 	movl   $0x101315,(%esp)
  1014a7:	e8 a7 fd ff ff       	call   101253 <cons_intr>
}
  1014ac:	90                   	nop
  1014ad:	c9                   	leave  
  1014ae:	c3                   	ret    

001014af <kbd_init>:

static void
kbd_init(void) {
  1014af:	55                   	push   %ebp
  1014b0:	89 e5                	mov    %esp,%ebp
  1014b2:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  1014b5:	e8 e0 ff ff ff       	call   10149a <kbd_intr>
    pic_enable(IRQ_KBD);
  1014ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1014c1:	e8 21 01 00 00       	call   1015e7 <pic_enable>
}
  1014c6:	90                   	nop
  1014c7:	c9                   	leave  
  1014c8:	c3                   	ret    

001014c9 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  1014c9:	55                   	push   %ebp
  1014ca:	89 e5                	mov    %esp,%ebp
  1014cc:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  1014cf:	e8 66 f8 ff ff       	call   100d3a <cga_init>
    serial_init();
  1014d4:	e8 47 f9 ff ff       	call   100e20 <serial_init>
    kbd_init();
  1014d9:	e8 d1 ff ff ff       	call   1014af <kbd_init>
    if (!serial_exists) {
  1014de:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  1014e3:	85 c0                	test   %eax,%eax
  1014e5:	75 0c                	jne    1014f3 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  1014e7:	c7 04 24 33 35 10 00 	movl   $0x103533,(%esp)
  1014ee:	e8 1a ee ff ff       	call   10030d <cprintf>
    }
}
  1014f3:	90                   	nop
  1014f4:	c9                   	leave  
  1014f5:	c3                   	ret    

001014f6 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1014f6:	55                   	push   %ebp
  1014f7:	89 e5                	mov    %esp,%ebp
  1014f9:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  1014fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1014ff:	89 04 24             	mov    %eax,(%esp)
  101502:	e8 80 fa ff ff       	call   100f87 <lpt_putc>
    cga_putc(c);
  101507:	8b 45 08             	mov    0x8(%ebp),%eax
  10150a:	89 04 24             	mov    %eax,(%esp)
  10150d:	e8 b5 fa ff ff       	call   100fc7 <cga_putc>
    serial_putc(c);
  101512:	8b 45 08             	mov    0x8(%ebp),%eax
  101515:	89 04 24             	mov    %eax,(%esp)
  101518:	e8 f6 fc ff ff       	call   101213 <serial_putc>
}
  10151d:	90                   	nop
  10151e:	c9                   	leave  
  10151f:	c3                   	ret    

00101520 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  101520:	55                   	push   %ebp
  101521:	89 e5                	mov    %esp,%ebp
  101523:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  101526:	e8 cc fd ff ff       	call   1012f7 <serial_intr>
    kbd_intr();
  10152b:	e8 6a ff ff ff       	call   10149a <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  101530:	8b 15 80 00 11 00    	mov    0x110080,%edx
  101536:	a1 84 00 11 00       	mov    0x110084,%eax
  10153b:	39 c2                	cmp    %eax,%edx
  10153d:	74 36                	je     101575 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  10153f:	a1 80 00 11 00       	mov    0x110080,%eax
  101544:	8d 50 01             	lea    0x1(%eax),%edx
  101547:	89 15 80 00 11 00    	mov    %edx,0x110080
  10154d:	0f b6 80 80 fe 10 00 	movzbl 0x10fe80(%eax),%eax
  101554:	0f b6 c0             	movzbl %al,%eax
  101557:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  10155a:	a1 80 00 11 00       	mov    0x110080,%eax
  10155f:	3d 00 02 00 00       	cmp    $0x200,%eax
  101564:	75 0a                	jne    101570 <cons_getc+0x50>
            cons.rpos = 0;
  101566:	c7 05 80 00 11 00 00 	movl   $0x0,0x110080
  10156d:	00 00 00 
        }
        return c;
  101570:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101573:	eb 05                	jmp    10157a <cons_getc+0x5a>
    }
    return 0;
  101575:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10157a:	c9                   	leave  
  10157b:	c3                   	ret    

0010157c <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  10157c:	55                   	push   %ebp
  10157d:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  10157f:	fb                   	sti    
}
  101580:	90                   	nop
    sti();
}
  101581:	90                   	nop
  101582:	5d                   	pop    %ebp
  101583:	c3                   	ret    

00101584 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101584:	55                   	push   %ebp
  101585:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  101587:	fa                   	cli    
}
  101588:	90                   	nop
    cli();
}
  101589:	90                   	nop
  10158a:	5d                   	pop    %ebp
  10158b:	c3                   	ret    

0010158c <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  10158c:	55                   	push   %ebp
  10158d:	89 e5                	mov    %esp,%ebp
  10158f:	83 ec 14             	sub    $0x14,%esp
  101592:	8b 45 08             	mov    0x8(%ebp),%eax
  101595:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101599:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10159c:	66 a3 50 f5 10 00    	mov    %ax,0x10f550
    if (did_init) {
  1015a2:	a1 8c 00 11 00       	mov    0x11008c,%eax
  1015a7:	85 c0                	test   %eax,%eax
  1015a9:	74 39                	je     1015e4 <pic_setmask+0x58>
        outb(IO_PIC1 + 1, mask);
  1015ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1015ae:	0f b6 c0             	movzbl %al,%eax
  1015b1:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  1015b7:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1015ba:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1015be:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1015c2:	ee                   	out    %al,(%dx)
}
  1015c3:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  1015c4:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1015c8:	c1 e8 08             	shr    $0x8,%eax
  1015cb:	0f b7 c0             	movzwl %ax,%eax
  1015ce:	0f b6 c0             	movzbl %al,%eax
  1015d1:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  1015d7:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1015da:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1015de:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1015e2:	ee                   	out    %al,(%dx)
}
  1015e3:	90                   	nop
    }
}
  1015e4:	90                   	nop
  1015e5:	c9                   	leave  
  1015e6:	c3                   	ret    

001015e7 <pic_enable>:

void
pic_enable(unsigned int irq) {
  1015e7:	55                   	push   %ebp
  1015e8:	89 e5                	mov    %esp,%ebp
  1015ea:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  1015ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1015f0:	ba 01 00 00 00       	mov    $0x1,%edx
  1015f5:	88 c1                	mov    %al,%cl
  1015f7:	d3 e2                	shl    %cl,%edx
  1015f9:	89 d0                	mov    %edx,%eax
  1015fb:	98                   	cwtl   
  1015fc:	f7 d0                	not    %eax
  1015fe:	0f bf d0             	movswl %ax,%edx
  101601:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101608:	98                   	cwtl   
  101609:	21 d0                	and    %edx,%eax
  10160b:	98                   	cwtl   
  10160c:	0f b7 c0             	movzwl %ax,%eax
  10160f:	89 04 24             	mov    %eax,(%esp)
  101612:	e8 75 ff ff ff       	call   10158c <pic_setmask>
}
  101617:	90                   	nop
  101618:	c9                   	leave  
  101619:	c3                   	ret    

0010161a <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  10161a:	55                   	push   %ebp
  10161b:	89 e5                	mov    %esp,%ebp
  10161d:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  101620:	c7 05 8c 00 11 00 01 	movl   $0x1,0x11008c
  101627:	00 00 00 
  10162a:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  101630:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101634:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  101638:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  10163c:	ee                   	out    %al,(%dx)
}
  10163d:	90                   	nop
  10163e:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  101644:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101648:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  10164c:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  101650:	ee                   	out    %al,(%dx)
}
  101651:	90                   	nop
  101652:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101658:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10165c:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101660:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101664:	ee                   	out    %al,(%dx)
}
  101665:	90                   	nop
  101666:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  10166c:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101670:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101674:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101678:	ee                   	out    %al,(%dx)
}
  101679:	90                   	nop
  10167a:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  101680:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101684:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101688:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  10168c:	ee                   	out    %al,(%dx)
}
  10168d:	90                   	nop
  10168e:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  101694:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101698:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  10169c:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  1016a0:	ee                   	out    %al,(%dx)
}
  1016a1:	90                   	nop
  1016a2:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  1016a8:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016ac:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  1016b0:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  1016b4:	ee                   	out    %al,(%dx)
}
  1016b5:	90                   	nop
  1016b6:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  1016bc:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016c0:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1016c4:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1016c8:	ee                   	out    %al,(%dx)
}
  1016c9:	90                   	nop
  1016ca:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  1016d0:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016d4:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1016d8:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1016dc:	ee                   	out    %al,(%dx)
}
  1016dd:	90                   	nop
  1016de:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  1016e4:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016e8:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1016ec:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1016f0:	ee                   	out    %al,(%dx)
}
  1016f1:	90                   	nop
  1016f2:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  1016f8:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016fc:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101700:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101704:	ee                   	out    %al,(%dx)
}
  101705:	90                   	nop
  101706:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  10170c:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101710:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101714:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101718:	ee                   	out    %al,(%dx)
}
  101719:	90                   	nop
  10171a:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  101720:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101724:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101728:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10172c:	ee                   	out    %al,(%dx)
}
  10172d:	90                   	nop
  10172e:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  101734:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101738:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10173c:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101740:	ee                   	out    %al,(%dx)
}
  101741:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  101742:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101749:	3d ff ff 00 00       	cmp    $0xffff,%eax
  10174e:	74 0f                	je     10175f <pic_init+0x145>
        pic_setmask(irq_mask);
  101750:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101757:	89 04 24             	mov    %eax,(%esp)
  10175a:	e8 2d fe ff ff       	call   10158c <pic_setmask>
    }
}
  10175f:	90                   	nop
  101760:	c9                   	leave  
  101761:	c3                   	ret    

00101762 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  101762:	55                   	push   %ebp
  101763:	89 e5                	mov    %esp,%ebp
  101765:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  101768:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  10176f:	00 
  101770:	c7 04 24 60 35 10 00 	movl   $0x103560,(%esp)
  101777:	e8 91 eb ff ff       	call   10030d <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  10177c:	90                   	nop
  10177d:	c9                   	leave  
  10177e:	c3                   	ret    

0010177f <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  10177f:	55                   	push   %ebp
  101780:	89 e5                	mov    %esp,%ebp
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
}
  101782:	90                   	nop
  101783:	5d                   	pop    %ebp
  101784:	c3                   	ret    

00101785 <trapname>:

static const char *
trapname(int trapno) {
  101785:	55                   	push   %ebp
  101786:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101788:	8b 45 08             	mov    0x8(%ebp),%eax
  10178b:	83 f8 13             	cmp    $0x13,%eax
  10178e:	77 0c                	ja     10179c <trapname+0x17>
        return excnames[trapno];
  101790:	8b 45 08             	mov    0x8(%ebp),%eax
  101793:	8b 04 85 c0 38 10 00 	mov    0x1038c0(,%eax,4),%eax
  10179a:	eb 18                	jmp    1017b4 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  10179c:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1017a0:	7e 0d                	jle    1017af <trapname+0x2a>
  1017a2:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1017a6:	7f 07                	jg     1017af <trapname+0x2a>
        return "Hardware Interrupt";
  1017a8:	b8 6a 35 10 00       	mov    $0x10356a,%eax
  1017ad:	eb 05                	jmp    1017b4 <trapname+0x2f>
    }
    return "(unknown trap)";
  1017af:	b8 7d 35 10 00       	mov    $0x10357d,%eax
}
  1017b4:	5d                   	pop    %ebp
  1017b5:	c3                   	ret    

001017b6 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1017b6:	55                   	push   %ebp
  1017b7:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1017b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1017bc:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1017c0:	83 f8 08             	cmp    $0x8,%eax
  1017c3:	0f 94 c0             	sete   %al
  1017c6:	0f b6 c0             	movzbl %al,%eax
}
  1017c9:	5d                   	pop    %ebp
  1017ca:	c3                   	ret    

001017cb <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1017cb:	55                   	push   %ebp
  1017cc:	89 e5                	mov    %esp,%ebp
  1017ce:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  1017d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1017d4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1017d8:	c7 04 24 be 35 10 00 	movl   $0x1035be,(%esp)
  1017df:	e8 29 eb ff ff       	call   10030d <cprintf>
    print_regs(&tf->tf_regs);
  1017e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1017e7:	89 04 24             	mov    %eax,(%esp)
  1017ea:	e8 8d 01 00 00       	call   10197c <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  1017ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1017f2:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  1017f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1017fa:	c7 04 24 cf 35 10 00 	movl   $0x1035cf,(%esp)
  101801:	e8 07 eb ff ff       	call   10030d <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101806:	8b 45 08             	mov    0x8(%ebp),%eax
  101809:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  10180d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101811:	c7 04 24 e2 35 10 00 	movl   $0x1035e2,(%esp)
  101818:	e8 f0 ea ff ff       	call   10030d <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  10181d:	8b 45 08             	mov    0x8(%ebp),%eax
  101820:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101824:	89 44 24 04          	mov    %eax,0x4(%esp)
  101828:	c7 04 24 f5 35 10 00 	movl   $0x1035f5,(%esp)
  10182f:	e8 d9 ea ff ff       	call   10030d <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101834:	8b 45 08             	mov    0x8(%ebp),%eax
  101837:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  10183b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10183f:	c7 04 24 08 36 10 00 	movl   $0x103608,(%esp)
  101846:	e8 c2 ea ff ff       	call   10030d <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  10184b:	8b 45 08             	mov    0x8(%ebp),%eax
  10184e:	8b 40 30             	mov    0x30(%eax),%eax
  101851:	89 04 24             	mov    %eax,(%esp)
  101854:	e8 2c ff ff ff       	call   101785 <trapname>
  101859:	8b 55 08             	mov    0x8(%ebp),%edx
  10185c:	8b 52 30             	mov    0x30(%edx),%edx
  10185f:	89 44 24 08          	mov    %eax,0x8(%esp)
  101863:	89 54 24 04          	mov    %edx,0x4(%esp)
  101867:	c7 04 24 1b 36 10 00 	movl   $0x10361b,(%esp)
  10186e:	e8 9a ea ff ff       	call   10030d <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101873:	8b 45 08             	mov    0x8(%ebp),%eax
  101876:	8b 40 34             	mov    0x34(%eax),%eax
  101879:	89 44 24 04          	mov    %eax,0x4(%esp)
  10187d:	c7 04 24 2d 36 10 00 	movl   $0x10362d,(%esp)
  101884:	e8 84 ea ff ff       	call   10030d <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101889:	8b 45 08             	mov    0x8(%ebp),%eax
  10188c:	8b 40 38             	mov    0x38(%eax),%eax
  10188f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101893:	c7 04 24 3c 36 10 00 	movl   $0x10363c,(%esp)
  10189a:	e8 6e ea ff ff       	call   10030d <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  10189f:	8b 45 08             	mov    0x8(%ebp),%eax
  1018a2:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1018a6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018aa:	c7 04 24 4b 36 10 00 	movl   $0x10364b,(%esp)
  1018b1:	e8 57 ea ff ff       	call   10030d <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  1018b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1018b9:	8b 40 40             	mov    0x40(%eax),%eax
  1018bc:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018c0:	c7 04 24 5e 36 10 00 	movl   $0x10365e,(%esp)
  1018c7:	e8 41 ea ff ff       	call   10030d <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  1018cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1018d3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  1018da:	eb 3d                	jmp    101919 <print_trapframe+0x14e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  1018dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1018df:	8b 50 40             	mov    0x40(%eax),%edx
  1018e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1018e5:	21 d0                	and    %edx,%eax
  1018e7:	85 c0                	test   %eax,%eax
  1018e9:	74 28                	je     101913 <print_trapframe+0x148>
  1018eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018ee:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  1018f5:	85 c0                	test   %eax,%eax
  1018f7:	74 1a                	je     101913 <print_trapframe+0x148>
            cprintf("%s,", IA32flags[i]);
  1018f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018fc:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101903:	89 44 24 04          	mov    %eax,0x4(%esp)
  101907:	c7 04 24 6d 36 10 00 	movl   $0x10366d,(%esp)
  10190e:	e8 fa e9 ff ff       	call   10030d <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101913:	ff 45 f4             	incl   -0xc(%ebp)
  101916:	d1 65 f0             	shll   -0x10(%ebp)
  101919:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10191c:	83 f8 17             	cmp    $0x17,%eax
  10191f:	76 bb                	jbe    1018dc <print_trapframe+0x111>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101921:	8b 45 08             	mov    0x8(%ebp),%eax
  101924:	8b 40 40             	mov    0x40(%eax),%eax
  101927:	c1 e8 0c             	shr    $0xc,%eax
  10192a:	83 e0 03             	and    $0x3,%eax
  10192d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101931:	c7 04 24 71 36 10 00 	movl   $0x103671,(%esp)
  101938:	e8 d0 e9 ff ff       	call   10030d <cprintf>

    if (!trap_in_kernel(tf)) {
  10193d:	8b 45 08             	mov    0x8(%ebp),%eax
  101940:	89 04 24             	mov    %eax,(%esp)
  101943:	e8 6e fe ff ff       	call   1017b6 <trap_in_kernel>
  101948:	85 c0                	test   %eax,%eax
  10194a:	75 2d                	jne    101979 <print_trapframe+0x1ae>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  10194c:	8b 45 08             	mov    0x8(%ebp),%eax
  10194f:	8b 40 44             	mov    0x44(%eax),%eax
  101952:	89 44 24 04          	mov    %eax,0x4(%esp)
  101956:	c7 04 24 7a 36 10 00 	movl   $0x10367a,(%esp)
  10195d:	e8 ab e9 ff ff       	call   10030d <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101962:	8b 45 08             	mov    0x8(%ebp),%eax
  101965:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101969:	89 44 24 04          	mov    %eax,0x4(%esp)
  10196d:	c7 04 24 89 36 10 00 	movl   $0x103689,(%esp)
  101974:	e8 94 e9 ff ff       	call   10030d <cprintf>
    }
}
  101979:	90                   	nop
  10197a:	c9                   	leave  
  10197b:	c3                   	ret    

0010197c <print_regs>:

void
print_regs(struct pushregs *regs) {
  10197c:	55                   	push   %ebp
  10197d:	89 e5                	mov    %esp,%ebp
  10197f:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101982:	8b 45 08             	mov    0x8(%ebp),%eax
  101985:	8b 00                	mov    (%eax),%eax
  101987:	89 44 24 04          	mov    %eax,0x4(%esp)
  10198b:	c7 04 24 9c 36 10 00 	movl   $0x10369c,(%esp)
  101992:	e8 76 e9 ff ff       	call   10030d <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101997:	8b 45 08             	mov    0x8(%ebp),%eax
  10199a:	8b 40 04             	mov    0x4(%eax),%eax
  10199d:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019a1:	c7 04 24 ab 36 10 00 	movl   $0x1036ab,(%esp)
  1019a8:	e8 60 e9 ff ff       	call   10030d <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  1019ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1019b0:	8b 40 08             	mov    0x8(%eax),%eax
  1019b3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019b7:	c7 04 24 ba 36 10 00 	movl   $0x1036ba,(%esp)
  1019be:	e8 4a e9 ff ff       	call   10030d <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  1019c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1019c6:	8b 40 0c             	mov    0xc(%eax),%eax
  1019c9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019cd:	c7 04 24 c9 36 10 00 	movl   $0x1036c9,(%esp)
  1019d4:	e8 34 e9 ff ff       	call   10030d <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  1019d9:	8b 45 08             	mov    0x8(%ebp),%eax
  1019dc:	8b 40 10             	mov    0x10(%eax),%eax
  1019df:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019e3:	c7 04 24 d8 36 10 00 	movl   $0x1036d8,(%esp)
  1019ea:	e8 1e e9 ff ff       	call   10030d <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  1019ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f2:	8b 40 14             	mov    0x14(%eax),%eax
  1019f5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019f9:	c7 04 24 e7 36 10 00 	movl   $0x1036e7,(%esp)
  101a00:	e8 08 e9 ff ff       	call   10030d <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101a05:	8b 45 08             	mov    0x8(%ebp),%eax
  101a08:	8b 40 18             	mov    0x18(%eax),%eax
  101a0b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a0f:	c7 04 24 f6 36 10 00 	movl   $0x1036f6,(%esp)
  101a16:	e8 f2 e8 ff ff       	call   10030d <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101a1b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a1e:	8b 40 1c             	mov    0x1c(%eax),%eax
  101a21:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a25:	c7 04 24 05 37 10 00 	movl   $0x103705,(%esp)
  101a2c:	e8 dc e8 ff ff       	call   10030d <cprintf>
}
  101a31:	90                   	nop
  101a32:	c9                   	leave  
  101a33:	c3                   	ret    

00101a34 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101a34:	55                   	push   %ebp
  101a35:	89 e5                	mov    %esp,%ebp
  101a37:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101a3a:	8b 45 08             	mov    0x8(%ebp),%eax
  101a3d:	8b 40 30             	mov    0x30(%eax),%eax
  101a40:	83 f8 79             	cmp    $0x79,%eax
  101a43:	0f 87 99 00 00 00    	ja     101ae2 <trap_dispatch+0xae>
  101a49:	83 f8 78             	cmp    $0x78,%eax
  101a4c:	73 78                	jae    101ac6 <trap_dispatch+0x92>
  101a4e:	83 f8 2f             	cmp    $0x2f,%eax
  101a51:	0f 87 8b 00 00 00    	ja     101ae2 <trap_dispatch+0xae>
  101a57:	83 f8 2e             	cmp    $0x2e,%eax
  101a5a:	0f 83 b7 00 00 00    	jae    101b17 <trap_dispatch+0xe3>
  101a60:	83 f8 24             	cmp    $0x24,%eax
  101a63:	74 15                	je     101a7a <trap_dispatch+0x46>
  101a65:	83 f8 24             	cmp    $0x24,%eax
  101a68:	77 78                	ja     101ae2 <trap_dispatch+0xae>
  101a6a:	83 f8 20             	cmp    $0x20,%eax
  101a6d:	0f 84 a7 00 00 00    	je     101b1a <trap_dispatch+0xe6>
  101a73:	83 f8 21             	cmp    $0x21,%eax
  101a76:	74 28                	je     101aa0 <trap_dispatch+0x6c>
  101a78:	eb 68                	jmp    101ae2 <trap_dispatch+0xae>
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101a7a:	e8 a1 fa ff ff       	call   101520 <cons_getc>
  101a7f:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101a82:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101a86:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101a8a:	89 54 24 08          	mov    %edx,0x8(%esp)
  101a8e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a92:	c7 04 24 14 37 10 00 	movl   $0x103714,(%esp)
  101a99:	e8 6f e8 ff ff       	call   10030d <cprintf>
        break;
  101a9e:	eb 7b                	jmp    101b1b <trap_dispatch+0xe7>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101aa0:	e8 7b fa ff ff       	call   101520 <cons_getc>
  101aa5:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101aa8:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101aac:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101ab0:	89 54 24 08          	mov    %edx,0x8(%esp)
  101ab4:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ab8:	c7 04 24 26 37 10 00 	movl   $0x103726,(%esp)
  101abf:	e8 49 e8 ff ff       	call   10030d <cprintf>
        break;
  101ac4:	eb 55                	jmp    101b1b <trap_dispatch+0xe7>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101ac6:	c7 44 24 08 35 37 10 	movl   $0x103735,0x8(%esp)
  101acd:	00 
  101ace:	c7 44 24 04 a2 00 00 	movl   $0xa2,0x4(%esp)
  101ad5:	00 
  101ad6:	c7 04 24 45 37 10 00 	movl   $0x103745,(%esp)
  101add:	e8 d9 f0 ff ff       	call   100bbb <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101ae2:	8b 45 08             	mov    0x8(%ebp),%eax
  101ae5:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ae9:	83 e0 03             	and    $0x3,%eax
  101aec:	85 c0                	test   %eax,%eax
  101aee:	75 2b                	jne    101b1b <trap_dispatch+0xe7>
            print_trapframe(tf);
  101af0:	8b 45 08             	mov    0x8(%ebp),%eax
  101af3:	89 04 24             	mov    %eax,(%esp)
  101af6:	e8 d0 fc ff ff       	call   1017cb <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101afb:	c7 44 24 08 56 37 10 	movl   $0x103756,0x8(%esp)
  101b02:	00 
  101b03:	c7 44 24 04 ac 00 00 	movl   $0xac,0x4(%esp)
  101b0a:	00 
  101b0b:	c7 04 24 45 37 10 00 	movl   $0x103745,(%esp)
  101b12:	e8 a4 f0 ff ff       	call   100bbb <__panic>
        break;
  101b17:	90                   	nop
  101b18:	eb 01                	jmp    101b1b <trap_dispatch+0xe7>
        break;
  101b1a:	90                   	nop
        }
    }
}
  101b1b:	90                   	nop
  101b1c:	c9                   	leave  
  101b1d:	c3                   	ret    

00101b1e <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101b1e:	55                   	push   %ebp
  101b1f:	89 e5                	mov    %esp,%ebp
  101b21:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101b24:	8b 45 08             	mov    0x8(%ebp),%eax
  101b27:	89 04 24             	mov    %eax,(%esp)
  101b2a:	e8 05 ff ff ff       	call   101a34 <trap_dispatch>
}
  101b2f:	90                   	nop
  101b30:	c9                   	leave  
  101b31:	c3                   	ret    

00101b32 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101b32:	1e                   	push   %ds
    pushl %es
  101b33:	06                   	push   %es
    pushl %fs
  101b34:	0f a0                	push   %fs
    pushl %gs
  101b36:	0f a8                	push   %gs
    pushal
  101b38:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101b39:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101b3e:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101b40:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101b42:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101b43:	e8 d6 ff ff ff       	call   101b1e <trap>

    # pop the pushed stack pointer
    popl %esp
  101b48:	5c                   	pop    %esp

00101b49 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101b49:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101b4a:	0f a9                	pop    %gs
    popl %fs
  101b4c:	0f a1                	pop    %fs
    popl %es
  101b4e:	07                   	pop    %es
    popl %ds
  101b4f:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101b50:	83 c4 08             	add    $0x8,%esp
    iret
  101b53:	cf                   	iret   

00101b54 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101b54:	6a 00                	push   $0x0
  pushl $0
  101b56:	6a 00                	push   $0x0
  jmp __alltraps
  101b58:	e9 d5 ff ff ff       	jmp    101b32 <__alltraps>

00101b5d <vector1>:
.globl vector1
vector1:
  pushl $0
  101b5d:	6a 00                	push   $0x0
  pushl $1
  101b5f:	6a 01                	push   $0x1
  jmp __alltraps
  101b61:	e9 cc ff ff ff       	jmp    101b32 <__alltraps>

00101b66 <vector2>:
.globl vector2
vector2:
  pushl $0
  101b66:	6a 00                	push   $0x0
  pushl $2
  101b68:	6a 02                	push   $0x2
  jmp __alltraps
  101b6a:	e9 c3 ff ff ff       	jmp    101b32 <__alltraps>

00101b6f <vector3>:
.globl vector3
vector3:
  pushl $0
  101b6f:	6a 00                	push   $0x0
  pushl $3
  101b71:	6a 03                	push   $0x3
  jmp __alltraps
  101b73:	e9 ba ff ff ff       	jmp    101b32 <__alltraps>

00101b78 <vector4>:
.globl vector4
vector4:
  pushl $0
  101b78:	6a 00                	push   $0x0
  pushl $4
  101b7a:	6a 04                	push   $0x4
  jmp __alltraps
  101b7c:	e9 b1 ff ff ff       	jmp    101b32 <__alltraps>

00101b81 <vector5>:
.globl vector5
vector5:
  pushl $0
  101b81:	6a 00                	push   $0x0
  pushl $5
  101b83:	6a 05                	push   $0x5
  jmp __alltraps
  101b85:	e9 a8 ff ff ff       	jmp    101b32 <__alltraps>

00101b8a <vector6>:
.globl vector6
vector6:
  pushl $0
  101b8a:	6a 00                	push   $0x0
  pushl $6
  101b8c:	6a 06                	push   $0x6
  jmp __alltraps
  101b8e:	e9 9f ff ff ff       	jmp    101b32 <__alltraps>

00101b93 <vector7>:
.globl vector7
vector7:
  pushl $0
  101b93:	6a 00                	push   $0x0
  pushl $7
  101b95:	6a 07                	push   $0x7
  jmp __alltraps
  101b97:	e9 96 ff ff ff       	jmp    101b32 <__alltraps>

00101b9c <vector8>:
.globl vector8
vector8:
  pushl $8
  101b9c:	6a 08                	push   $0x8
  jmp __alltraps
  101b9e:	e9 8f ff ff ff       	jmp    101b32 <__alltraps>

00101ba3 <vector9>:
.globl vector9
vector9:
  pushl $0
  101ba3:	6a 00                	push   $0x0
  pushl $9
  101ba5:	6a 09                	push   $0x9
  jmp __alltraps
  101ba7:	e9 86 ff ff ff       	jmp    101b32 <__alltraps>

00101bac <vector10>:
.globl vector10
vector10:
  pushl $10
  101bac:	6a 0a                	push   $0xa
  jmp __alltraps
  101bae:	e9 7f ff ff ff       	jmp    101b32 <__alltraps>

00101bb3 <vector11>:
.globl vector11
vector11:
  pushl $11
  101bb3:	6a 0b                	push   $0xb
  jmp __alltraps
  101bb5:	e9 78 ff ff ff       	jmp    101b32 <__alltraps>

00101bba <vector12>:
.globl vector12
vector12:
  pushl $12
  101bba:	6a 0c                	push   $0xc
  jmp __alltraps
  101bbc:	e9 71 ff ff ff       	jmp    101b32 <__alltraps>

00101bc1 <vector13>:
.globl vector13
vector13:
  pushl $13
  101bc1:	6a 0d                	push   $0xd
  jmp __alltraps
  101bc3:	e9 6a ff ff ff       	jmp    101b32 <__alltraps>

00101bc8 <vector14>:
.globl vector14
vector14:
  pushl $14
  101bc8:	6a 0e                	push   $0xe
  jmp __alltraps
  101bca:	e9 63 ff ff ff       	jmp    101b32 <__alltraps>

00101bcf <vector15>:
.globl vector15
vector15:
  pushl $0
  101bcf:	6a 00                	push   $0x0
  pushl $15
  101bd1:	6a 0f                	push   $0xf
  jmp __alltraps
  101bd3:	e9 5a ff ff ff       	jmp    101b32 <__alltraps>

00101bd8 <vector16>:
.globl vector16
vector16:
  pushl $0
  101bd8:	6a 00                	push   $0x0
  pushl $16
  101bda:	6a 10                	push   $0x10
  jmp __alltraps
  101bdc:	e9 51 ff ff ff       	jmp    101b32 <__alltraps>

00101be1 <vector17>:
.globl vector17
vector17:
  pushl $17
  101be1:	6a 11                	push   $0x11
  jmp __alltraps
  101be3:	e9 4a ff ff ff       	jmp    101b32 <__alltraps>

00101be8 <vector18>:
.globl vector18
vector18:
  pushl $0
  101be8:	6a 00                	push   $0x0
  pushl $18
  101bea:	6a 12                	push   $0x12
  jmp __alltraps
  101bec:	e9 41 ff ff ff       	jmp    101b32 <__alltraps>

00101bf1 <vector19>:
.globl vector19
vector19:
  pushl $0
  101bf1:	6a 00                	push   $0x0
  pushl $19
  101bf3:	6a 13                	push   $0x13
  jmp __alltraps
  101bf5:	e9 38 ff ff ff       	jmp    101b32 <__alltraps>

00101bfa <vector20>:
.globl vector20
vector20:
  pushl $0
  101bfa:	6a 00                	push   $0x0
  pushl $20
  101bfc:	6a 14                	push   $0x14
  jmp __alltraps
  101bfe:	e9 2f ff ff ff       	jmp    101b32 <__alltraps>

00101c03 <vector21>:
.globl vector21
vector21:
  pushl $0
  101c03:	6a 00                	push   $0x0
  pushl $21
  101c05:	6a 15                	push   $0x15
  jmp __alltraps
  101c07:	e9 26 ff ff ff       	jmp    101b32 <__alltraps>

00101c0c <vector22>:
.globl vector22
vector22:
  pushl $0
  101c0c:	6a 00                	push   $0x0
  pushl $22
  101c0e:	6a 16                	push   $0x16
  jmp __alltraps
  101c10:	e9 1d ff ff ff       	jmp    101b32 <__alltraps>

00101c15 <vector23>:
.globl vector23
vector23:
  pushl $0
  101c15:	6a 00                	push   $0x0
  pushl $23
  101c17:	6a 17                	push   $0x17
  jmp __alltraps
  101c19:	e9 14 ff ff ff       	jmp    101b32 <__alltraps>

00101c1e <vector24>:
.globl vector24
vector24:
  pushl $0
  101c1e:	6a 00                	push   $0x0
  pushl $24
  101c20:	6a 18                	push   $0x18
  jmp __alltraps
  101c22:	e9 0b ff ff ff       	jmp    101b32 <__alltraps>

00101c27 <vector25>:
.globl vector25
vector25:
  pushl $0
  101c27:	6a 00                	push   $0x0
  pushl $25
  101c29:	6a 19                	push   $0x19
  jmp __alltraps
  101c2b:	e9 02 ff ff ff       	jmp    101b32 <__alltraps>

00101c30 <vector26>:
.globl vector26
vector26:
  pushl $0
  101c30:	6a 00                	push   $0x0
  pushl $26
  101c32:	6a 1a                	push   $0x1a
  jmp __alltraps
  101c34:	e9 f9 fe ff ff       	jmp    101b32 <__alltraps>

00101c39 <vector27>:
.globl vector27
vector27:
  pushl $0
  101c39:	6a 00                	push   $0x0
  pushl $27
  101c3b:	6a 1b                	push   $0x1b
  jmp __alltraps
  101c3d:	e9 f0 fe ff ff       	jmp    101b32 <__alltraps>

00101c42 <vector28>:
.globl vector28
vector28:
  pushl $0
  101c42:	6a 00                	push   $0x0
  pushl $28
  101c44:	6a 1c                	push   $0x1c
  jmp __alltraps
  101c46:	e9 e7 fe ff ff       	jmp    101b32 <__alltraps>

00101c4b <vector29>:
.globl vector29
vector29:
  pushl $0
  101c4b:	6a 00                	push   $0x0
  pushl $29
  101c4d:	6a 1d                	push   $0x1d
  jmp __alltraps
  101c4f:	e9 de fe ff ff       	jmp    101b32 <__alltraps>

00101c54 <vector30>:
.globl vector30
vector30:
  pushl $0
  101c54:	6a 00                	push   $0x0
  pushl $30
  101c56:	6a 1e                	push   $0x1e
  jmp __alltraps
  101c58:	e9 d5 fe ff ff       	jmp    101b32 <__alltraps>

00101c5d <vector31>:
.globl vector31
vector31:
  pushl $0
  101c5d:	6a 00                	push   $0x0
  pushl $31
  101c5f:	6a 1f                	push   $0x1f
  jmp __alltraps
  101c61:	e9 cc fe ff ff       	jmp    101b32 <__alltraps>

00101c66 <vector32>:
.globl vector32
vector32:
  pushl $0
  101c66:	6a 00                	push   $0x0
  pushl $32
  101c68:	6a 20                	push   $0x20
  jmp __alltraps
  101c6a:	e9 c3 fe ff ff       	jmp    101b32 <__alltraps>

00101c6f <vector33>:
.globl vector33
vector33:
  pushl $0
  101c6f:	6a 00                	push   $0x0
  pushl $33
  101c71:	6a 21                	push   $0x21
  jmp __alltraps
  101c73:	e9 ba fe ff ff       	jmp    101b32 <__alltraps>

00101c78 <vector34>:
.globl vector34
vector34:
  pushl $0
  101c78:	6a 00                	push   $0x0
  pushl $34
  101c7a:	6a 22                	push   $0x22
  jmp __alltraps
  101c7c:	e9 b1 fe ff ff       	jmp    101b32 <__alltraps>

00101c81 <vector35>:
.globl vector35
vector35:
  pushl $0
  101c81:	6a 00                	push   $0x0
  pushl $35
  101c83:	6a 23                	push   $0x23
  jmp __alltraps
  101c85:	e9 a8 fe ff ff       	jmp    101b32 <__alltraps>

00101c8a <vector36>:
.globl vector36
vector36:
  pushl $0
  101c8a:	6a 00                	push   $0x0
  pushl $36
  101c8c:	6a 24                	push   $0x24
  jmp __alltraps
  101c8e:	e9 9f fe ff ff       	jmp    101b32 <__alltraps>

00101c93 <vector37>:
.globl vector37
vector37:
  pushl $0
  101c93:	6a 00                	push   $0x0
  pushl $37
  101c95:	6a 25                	push   $0x25
  jmp __alltraps
  101c97:	e9 96 fe ff ff       	jmp    101b32 <__alltraps>

00101c9c <vector38>:
.globl vector38
vector38:
  pushl $0
  101c9c:	6a 00                	push   $0x0
  pushl $38
  101c9e:	6a 26                	push   $0x26
  jmp __alltraps
  101ca0:	e9 8d fe ff ff       	jmp    101b32 <__alltraps>

00101ca5 <vector39>:
.globl vector39
vector39:
  pushl $0
  101ca5:	6a 00                	push   $0x0
  pushl $39
  101ca7:	6a 27                	push   $0x27
  jmp __alltraps
  101ca9:	e9 84 fe ff ff       	jmp    101b32 <__alltraps>

00101cae <vector40>:
.globl vector40
vector40:
  pushl $0
  101cae:	6a 00                	push   $0x0
  pushl $40
  101cb0:	6a 28                	push   $0x28
  jmp __alltraps
  101cb2:	e9 7b fe ff ff       	jmp    101b32 <__alltraps>

00101cb7 <vector41>:
.globl vector41
vector41:
  pushl $0
  101cb7:	6a 00                	push   $0x0
  pushl $41
  101cb9:	6a 29                	push   $0x29
  jmp __alltraps
  101cbb:	e9 72 fe ff ff       	jmp    101b32 <__alltraps>

00101cc0 <vector42>:
.globl vector42
vector42:
  pushl $0
  101cc0:	6a 00                	push   $0x0
  pushl $42
  101cc2:	6a 2a                	push   $0x2a
  jmp __alltraps
  101cc4:	e9 69 fe ff ff       	jmp    101b32 <__alltraps>

00101cc9 <vector43>:
.globl vector43
vector43:
  pushl $0
  101cc9:	6a 00                	push   $0x0
  pushl $43
  101ccb:	6a 2b                	push   $0x2b
  jmp __alltraps
  101ccd:	e9 60 fe ff ff       	jmp    101b32 <__alltraps>

00101cd2 <vector44>:
.globl vector44
vector44:
  pushl $0
  101cd2:	6a 00                	push   $0x0
  pushl $44
  101cd4:	6a 2c                	push   $0x2c
  jmp __alltraps
  101cd6:	e9 57 fe ff ff       	jmp    101b32 <__alltraps>

00101cdb <vector45>:
.globl vector45
vector45:
  pushl $0
  101cdb:	6a 00                	push   $0x0
  pushl $45
  101cdd:	6a 2d                	push   $0x2d
  jmp __alltraps
  101cdf:	e9 4e fe ff ff       	jmp    101b32 <__alltraps>

00101ce4 <vector46>:
.globl vector46
vector46:
  pushl $0
  101ce4:	6a 00                	push   $0x0
  pushl $46
  101ce6:	6a 2e                	push   $0x2e
  jmp __alltraps
  101ce8:	e9 45 fe ff ff       	jmp    101b32 <__alltraps>

00101ced <vector47>:
.globl vector47
vector47:
  pushl $0
  101ced:	6a 00                	push   $0x0
  pushl $47
  101cef:	6a 2f                	push   $0x2f
  jmp __alltraps
  101cf1:	e9 3c fe ff ff       	jmp    101b32 <__alltraps>

00101cf6 <vector48>:
.globl vector48
vector48:
  pushl $0
  101cf6:	6a 00                	push   $0x0
  pushl $48
  101cf8:	6a 30                	push   $0x30
  jmp __alltraps
  101cfa:	e9 33 fe ff ff       	jmp    101b32 <__alltraps>

00101cff <vector49>:
.globl vector49
vector49:
  pushl $0
  101cff:	6a 00                	push   $0x0
  pushl $49
  101d01:	6a 31                	push   $0x31
  jmp __alltraps
  101d03:	e9 2a fe ff ff       	jmp    101b32 <__alltraps>

00101d08 <vector50>:
.globl vector50
vector50:
  pushl $0
  101d08:	6a 00                	push   $0x0
  pushl $50
  101d0a:	6a 32                	push   $0x32
  jmp __alltraps
  101d0c:	e9 21 fe ff ff       	jmp    101b32 <__alltraps>

00101d11 <vector51>:
.globl vector51
vector51:
  pushl $0
  101d11:	6a 00                	push   $0x0
  pushl $51
  101d13:	6a 33                	push   $0x33
  jmp __alltraps
  101d15:	e9 18 fe ff ff       	jmp    101b32 <__alltraps>

00101d1a <vector52>:
.globl vector52
vector52:
  pushl $0
  101d1a:	6a 00                	push   $0x0
  pushl $52
  101d1c:	6a 34                	push   $0x34
  jmp __alltraps
  101d1e:	e9 0f fe ff ff       	jmp    101b32 <__alltraps>

00101d23 <vector53>:
.globl vector53
vector53:
  pushl $0
  101d23:	6a 00                	push   $0x0
  pushl $53
  101d25:	6a 35                	push   $0x35
  jmp __alltraps
  101d27:	e9 06 fe ff ff       	jmp    101b32 <__alltraps>

00101d2c <vector54>:
.globl vector54
vector54:
  pushl $0
  101d2c:	6a 00                	push   $0x0
  pushl $54
  101d2e:	6a 36                	push   $0x36
  jmp __alltraps
  101d30:	e9 fd fd ff ff       	jmp    101b32 <__alltraps>

00101d35 <vector55>:
.globl vector55
vector55:
  pushl $0
  101d35:	6a 00                	push   $0x0
  pushl $55
  101d37:	6a 37                	push   $0x37
  jmp __alltraps
  101d39:	e9 f4 fd ff ff       	jmp    101b32 <__alltraps>

00101d3e <vector56>:
.globl vector56
vector56:
  pushl $0
  101d3e:	6a 00                	push   $0x0
  pushl $56
  101d40:	6a 38                	push   $0x38
  jmp __alltraps
  101d42:	e9 eb fd ff ff       	jmp    101b32 <__alltraps>

00101d47 <vector57>:
.globl vector57
vector57:
  pushl $0
  101d47:	6a 00                	push   $0x0
  pushl $57
  101d49:	6a 39                	push   $0x39
  jmp __alltraps
  101d4b:	e9 e2 fd ff ff       	jmp    101b32 <__alltraps>

00101d50 <vector58>:
.globl vector58
vector58:
  pushl $0
  101d50:	6a 00                	push   $0x0
  pushl $58
  101d52:	6a 3a                	push   $0x3a
  jmp __alltraps
  101d54:	e9 d9 fd ff ff       	jmp    101b32 <__alltraps>

00101d59 <vector59>:
.globl vector59
vector59:
  pushl $0
  101d59:	6a 00                	push   $0x0
  pushl $59
  101d5b:	6a 3b                	push   $0x3b
  jmp __alltraps
  101d5d:	e9 d0 fd ff ff       	jmp    101b32 <__alltraps>

00101d62 <vector60>:
.globl vector60
vector60:
  pushl $0
  101d62:	6a 00                	push   $0x0
  pushl $60
  101d64:	6a 3c                	push   $0x3c
  jmp __alltraps
  101d66:	e9 c7 fd ff ff       	jmp    101b32 <__alltraps>

00101d6b <vector61>:
.globl vector61
vector61:
  pushl $0
  101d6b:	6a 00                	push   $0x0
  pushl $61
  101d6d:	6a 3d                	push   $0x3d
  jmp __alltraps
  101d6f:	e9 be fd ff ff       	jmp    101b32 <__alltraps>

00101d74 <vector62>:
.globl vector62
vector62:
  pushl $0
  101d74:	6a 00                	push   $0x0
  pushl $62
  101d76:	6a 3e                	push   $0x3e
  jmp __alltraps
  101d78:	e9 b5 fd ff ff       	jmp    101b32 <__alltraps>

00101d7d <vector63>:
.globl vector63
vector63:
  pushl $0
  101d7d:	6a 00                	push   $0x0
  pushl $63
  101d7f:	6a 3f                	push   $0x3f
  jmp __alltraps
  101d81:	e9 ac fd ff ff       	jmp    101b32 <__alltraps>

00101d86 <vector64>:
.globl vector64
vector64:
  pushl $0
  101d86:	6a 00                	push   $0x0
  pushl $64
  101d88:	6a 40                	push   $0x40
  jmp __alltraps
  101d8a:	e9 a3 fd ff ff       	jmp    101b32 <__alltraps>

00101d8f <vector65>:
.globl vector65
vector65:
  pushl $0
  101d8f:	6a 00                	push   $0x0
  pushl $65
  101d91:	6a 41                	push   $0x41
  jmp __alltraps
  101d93:	e9 9a fd ff ff       	jmp    101b32 <__alltraps>

00101d98 <vector66>:
.globl vector66
vector66:
  pushl $0
  101d98:	6a 00                	push   $0x0
  pushl $66
  101d9a:	6a 42                	push   $0x42
  jmp __alltraps
  101d9c:	e9 91 fd ff ff       	jmp    101b32 <__alltraps>

00101da1 <vector67>:
.globl vector67
vector67:
  pushl $0
  101da1:	6a 00                	push   $0x0
  pushl $67
  101da3:	6a 43                	push   $0x43
  jmp __alltraps
  101da5:	e9 88 fd ff ff       	jmp    101b32 <__alltraps>

00101daa <vector68>:
.globl vector68
vector68:
  pushl $0
  101daa:	6a 00                	push   $0x0
  pushl $68
  101dac:	6a 44                	push   $0x44
  jmp __alltraps
  101dae:	e9 7f fd ff ff       	jmp    101b32 <__alltraps>

00101db3 <vector69>:
.globl vector69
vector69:
  pushl $0
  101db3:	6a 00                	push   $0x0
  pushl $69
  101db5:	6a 45                	push   $0x45
  jmp __alltraps
  101db7:	e9 76 fd ff ff       	jmp    101b32 <__alltraps>

00101dbc <vector70>:
.globl vector70
vector70:
  pushl $0
  101dbc:	6a 00                	push   $0x0
  pushl $70
  101dbe:	6a 46                	push   $0x46
  jmp __alltraps
  101dc0:	e9 6d fd ff ff       	jmp    101b32 <__alltraps>

00101dc5 <vector71>:
.globl vector71
vector71:
  pushl $0
  101dc5:	6a 00                	push   $0x0
  pushl $71
  101dc7:	6a 47                	push   $0x47
  jmp __alltraps
  101dc9:	e9 64 fd ff ff       	jmp    101b32 <__alltraps>

00101dce <vector72>:
.globl vector72
vector72:
  pushl $0
  101dce:	6a 00                	push   $0x0
  pushl $72
  101dd0:	6a 48                	push   $0x48
  jmp __alltraps
  101dd2:	e9 5b fd ff ff       	jmp    101b32 <__alltraps>

00101dd7 <vector73>:
.globl vector73
vector73:
  pushl $0
  101dd7:	6a 00                	push   $0x0
  pushl $73
  101dd9:	6a 49                	push   $0x49
  jmp __alltraps
  101ddb:	e9 52 fd ff ff       	jmp    101b32 <__alltraps>

00101de0 <vector74>:
.globl vector74
vector74:
  pushl $0
  101de0:	6a 00                	push   $0x0
  pushl $74
  101de2:	6a 4a                	push   $0x4a
  jmp __alltraps
  101de4:	e9 49 fd ff ff       	jmp    101b32 <__alltraps>

00101de9 <vector75>:
.globl vector75
vector75:
  pushl $0
  101de9:	6a 00                	push   $0x0
  pushl $75
  101deb:	6a 4b                	push   $0x4b
  jmp __alltraps
  101ded:	e9 40 fd ff ff       	jmp    101b32 <__alltraps>

00101df2 <vector76>:
.globl vector76
vector76:
  pushl $0
  101df2:	6a 00                	push   $0x0
  pushl $76
  101df4:	6a 4c                	push   $0x4c
  jmp __alltraps
  101df6:	e9 37 fd ff ff       	jmp    101b32 <__alltraps>

00101dfb <vector77>:
.globl vector77
vector77:
  pushl $0
  101dfb:	6a 00                	push   $0x0
  pushl $77
  101dfd:	6a 4d                	push   $0x4d
  jmp __alltraps
  101dff:	e9 2e fd ff ff       	jmp    101b32 <__alltraps>

00101e04 <vector78>:
.globl vector78
vector78:
  pushl $0
  101e04:	6a 00                	push   $0x0
  pushl $78
  101e06:	6a 4e                	push   $0x4e
  jmp __alltraps
  101e08:	e9 25 fd ff ff       	jmp    101b32 <__alltraps>

00101e0d <vector79>:
.globl vector79
vector79:
  pushl $0
  101e0d:	6a 00                	push   $0x0
  pushl $79
  101e0f:	6a 4f                	push   $0x4f
  jmp __alltraps
  101e11:	e9 1c fd ff ff       	jmp    101b32 <__alltraps>

00101e16 <vector80>:
.globl vector80
vector80:
  pushl $0
  101e16:	6a 00                	push   $0x0
  pushl $80
  101e18:	6a 50                	push   $0x50
  jmp __alltraps
  101e1a:	e9 13 fd ff ff       	jmp    101b32 <__alltraps>

00101e1f <vector81>:
.globl vector81
vector81:
  pushl $0
  101e1f:	6a 00                	push   $0x0
  pushl $81
  101e21:	6a 51                	push   $0x51
  jmp __alltraps
  101e23:	e9 0a fd ff ff       	jmp    101b32 <__alltraps>

00101e28 <vector82>:
.globl vector82
vector82:
  pushl $0
  101e28:	6a 00                	push   $0x0
  pushl $82
  101e2a:	6a 52                	push   $0x52
  jmp __alltraps
  101e2c:	e9 01 fd ff ff       	jmp    101b32 <__alltraps>

00101e31 <vector83>:
.globl vector83
vector83:
  pushl $0
  101e31:	6a 00                	push   $0x0
  pushl $83
  101e33:	6a 53                	push   $0x53
  jmp __alltraps
  101e35:	e9 f8 fc ff ff       	jmp    101b32 <__alltraps>

00101e3a <vector84>:
.globl vector84
vector84:
  pushl $0
  101e3a:	6a 00                	push   $0x0
  pushl $84
  101e3c:	6a 54                	push   $0x54
  jmp __alltraps
  101e3e:	e9 ef fc ff ff       	jmp    101b32 <__alltraps>

00101e43 <vector85>:
.globl vector85
vector85:
  pushl $0
  101e43:	6a 00                	push   $0x0
  pushl $85
  101e45:	6a 55                	push   $0x55
  jmp __alltraps
  101e47:	e9 e6 fc ff ff       	jmp    101b32 <__alltraps>

00101e4c <vector86>:
.globl vector86
vector86:
  pushl $0
  101e4c:	6a 00                	push   $0x0
  pushl $86
  101e4e:	6a 56                	push   $0x56
  jmp __alltraps
  101e50:	e9 dd fc ff ff       	jmp    101b32 <__alltraps>

00101e55 <vector87>:
.globl vector87
vector87:
  pushl $0
  101e55:	6a 00                	push   $0x0
  pushl $87
  101e57:	6a 57                	push   $0x57
  jmp __alltraps
  101e59:	e9 d4 fc ff ff       	jmp    101b32 <__alltraps>

00101e5e <vector88>:
.globl vector88
vector88:
  pushl $0
  101e5e:	6a 00                	push   $0x0
  pushl $88
  101e60:	6a 58                	push   $0x58
  jmp __alltraps
  101e62:	e9 cb fc ff ff       	jmp    101b32 <__alltraps>

00101e67 <vector89>:
.globl vector89
vector89:
  pushl $0
  101e67:	6a 00                	push   $0x0
  pushl $89
  101e69:	6a 59                	push   $0x59
  jmp __alltraps
  101e6b:	e9 c2 fc ff ff       	jmp    101b32 <__alltraps>

00101e70 <vector90>:
.globl vector90
vector90:
  pushl $0
  101e70:	6a 00                	push   $0x0
  pushl $90
  101e72:	6a 5a                	push   $0x5a
  jmp __alltraps
  101e74:	e9 b9 fc ff ff       	jmp    101b32 <__alltraps>

00101e79 <vector91>:
.globl vector91
vector91:
  pushl $0
  101e79:	6a 00                	push   $0x0
  pushl $91
  101e7b:	6a 5b                	push   $0x5b
  jmp __alltraps
  101e7d:	e9 b0 fc ff ff       	jmp    101b32 <__alltraps>

00101e82 <vector92>:
.globl vector92
vector92:
  pushl $0
  101e82:	6a 00                	push   $0x0
  pushl $92
  101e84:	6a 5c                	push   $0x5c
  jmp __alltraps
  101e86:	e9 a7 fc ff ff       	jmp    101b32 <__alltraps>

00101e8b <vector93>:
.globl vector93
vector93:
  pushl $0
  101e8b:	6a 00                	push   $0x0
  pushl $93
  101e8d:	6a 5d                	push   $0x5d
  jmp __alltraps
  101e8f:	e9 9e fc ff ff       	jmp    101b32 <__alltraps>

00101e94 <vector94>:
.globl vector94
vector94:
  pushl $0
  101e94:	6a 00                	push   $0x0
  pushl $94
  101e96:	6a 5e                	push   $0x5e
  jmp __alltraps
  101e98:	e9 95 fc ff ff       	jmp    101b32 <__alltraps>

00101e9d <vector95>:
.globl vector95
vector95:
  pushl $0
  101e9d:	6a 00                	push   $0x0
  pushl $95
  101e9f:	6a 5f                	push   $0x5f
  jmp __alltraps
  101ea1:	e9 8c fc ff ff       	jmp    101b32 <__alltraps>

00101ea6 <vector96>:
.globl vector96
vector96:
  pushl $0
  101ea6:	6a 00                	push   $0x0
  pushl $96
  101ea8:	6a 60                	push   $0x60
  jmp __alltraps
  101eaa:	e9 83 fc ff ff       	jmp    101b32 <__alltraps>

00101eaf <vector97>:
.globl vector97
vector97:
  pushl $0
  101eaf:	6a 00                	push   $0x0
  pushl $97
  101eb1:	6a 61                	push   $0x61
  jmp __alltraps
  101eb3:	e9 7a fc ff ff       	jmp    101b32 <__alltraps>

00101eb8 <vector98>:
.globl vector98
vector98:
  pushl $0
  101eb8:	6a 00                	push   $0x0
  pushl $98
  101eba:	6a 62                	push   $0x62
  jmp __alltraps
  101ebc:	e9 71 fc ff ff       	jmp    101b32 <__alltraps>

00101ec1 <vector99>:
.globl vector99
vector99:
  pushl $0
  101ec1:	6a 00                	push   $0x0
  pushl $99
  101ec3:	6a 63                	push   $0x63
  jmp __alltraps
  101ec5:	e9 68 fc ff ff       	jmp    101b32 <__alltraps>

00101eca <vector100>:
.globl vector100
vector100:
  pushl $0
  101eca:	6a 00                	push   $0x0
  pushl $100
  101ecc:	6a 64                	push   $0x64
  jmp __alltraps
  101ece:	e9 5f fc ff ff       	jmp    101b32 <__alltraps>

00101ed3 <vector101>:
.globl vector101
vector101:
  pushl $0
  101ed3:	6a 00                	push   $0x0
  pushl $101
  101ed5:	6a 65                	push   $0x65
  jmp __alltraps
  101ed7:	e9 56 fc ff ff       	jmp    101b32 <__alltraps>

00101edc <vector102>:
.globl vector102
vector102:
  pushl $0
  101edc:	6a 00                	push   $0x0
  pushl $102
  101ede:	6a 66                	push   $0x66
  jmp __alltraps
  101ee0:	e9 4d fc ff ff       	jmp    101b32 <__alltraps>

00101ee5 <vector103>:
.globl vector103
vector103:
  pushl $0
  101ee5:	6a 00                	push   $0x0
  pushl $103
  101ee7:	6a 67                	push   $0x67
  jmp __alltraps
  101ee9:	e9 44 fc ff ff       	jmp    101b32 <__alltraps>

00101eee <vector104>:
.globl vector104
vector104:
  pushl $0
  101eee:	6a 00                	push   $0x0
  pushl $104
  101ef0:	6a 68                	push   $0x68
  jmp __alltraps
  101ef2:	e9 3b fc ff ff       	jmp    101b32 <__alltraps>

00101ef7 <vector105>:
.globl vector105
vector105:
  pushl $0
  101ef7:	6a 00                	push   $0x0
  pushl $105
  101ef9:	6a 69                	push   $0x69
  jmp __alltraps
  101efb:	e9 32 fc ff ff       	jmp    101b32 <__alltraps>

00101f00 <vector106>:
.globl vector106
vector106:
  pushl $0
  101f00:	6a 00                	push   $0x0
  pushl $106
  101f02:	6a 6a                	push   $0x6a
  jmp __alltraps
  101f04:	e9 29 fc ff ff       	jmp    101b32 <__alltraps>

00101f09 <vector107>:
.globl vector107
vector107:
  pushl $0
  101f09:	6a 00                	push   $0x0
  pushl $107
  101f0b:	6a 6b                	push   $0x6b
  jmp __alltraps
  101f0d:	e9 20 fc ff ff       	jmp    101b32 <__alltraps>

00101f12 <vector108>:
.globl vector108
vector108:
  pushl $0
  101f12:	6a 00                	push   $0x0
  pushl $108
  101f14:	6a 6c                	push   $0x6c
  jmp __alltraps
  101f16:	e9 17 fc ff ff       	jmp    101b32 <__alltraps>

00101f1b <vector109>:
.globl vector109
vector109:
  pushl $0
  101f1b:	6a 00                	push   $0x0
  pushl $109
  101f1d:	6a 6d                	push   $0x6d
  jmp __alltraps
  101f1f:	e9 0e fc ff ff       	jmp    101b32 <__alltraps>

00101f24 <vector110>:
.globl vector110
vector110:
  pushl $0
  101f24:	6a 00                	push   $0x0
  pushl $110
  101f26:	6a 6e                	push   $0x6e
  jmp __alltraps
  101f28:	e9 05 fc ff ff       	jmp    101b32 <__alltraps>

00101f2d <vector111>:
.globl vector111
vector111:
  pushl $0
  101f2d:	6a 00                	push   $0x0
  pushl $111
  101f2f:	6a 6f                	push   $0x6f
  jmp __alltraps
  101f31:	e9 fc fb ff ff       	jmp    101b32 <__alltraps>

00101f36 <vector112>:
.globl vector112
vector112:
  pushl $0
  101f36:	6a 00                	push   $0x0
  pushl $112
  101f38:	6a 70                	push   $0x70
  jmp __alltraps
  101f3a:	e9 f3 fb ff ff       	jmp    101b32 <__alltraps>

00101f3f <vector113>:
.globl vector113
vector113:
  pushl $0
  101f3f:	6a 00                	push   $0x0
  pushl $113
  101f41:	6a 71                	push   $0x71
  jmp __alltraps
  101f43:	e9 ea fb ff ff       	jmp    101b32 <__alltraps>

00101f48 <vector114>:
.globl vector114
vector114:
  pushl $0
  101f48:	6a 00                	push   $0x0
  pushl $114
  101f4a:	6a 72                	push   $0x72
  jmp __alltraps
  101f4c:	e9 e1 fb ff ff       	jmp    101b32 <__alltraps>

00101f51 <vector115>:
.globl vector115
vector115:
  pushl $0
  101f51:	6a 00                	push   $0x0
  pushl $115
  101f53:	6a 73                	push   $0x73
  jmp __alltraps
  101f55:	e9 d8 fb ff ff       	jmp    101b32 <__alltraps>

00101f5a <vector116>:
.globl vector116
vector116:
  pushl $0
  101f5a:	6a 00                	push   $0x0
  pushl $116
  101f5c:	6a 74                	push   $0x74
  jmp __alltraps
  101f5e:	e9 cf fb ff ff       	jmp    101b32 <__alltraps>

00101f63 <vector117>:
.globl vector117
vector117:
  pushl $0
  101f63:	6a 00                	push   $0x0
  pushl $117
  101f65:	6a 75                	push   $0x75
  jmp __alltraps
  101f67:	e9 c6 fb ff ff       	jmp    101b32 <__alltraps>

00101f6c <vector118>:
.globl vector118
vector118:
  pushl $0
  101f6c:	6a 00                	push   $0x0
  pushl $118
  101f6e:	6a 76                	push   $0x76
  jmp __alltraps
  101f70:	e9 bd fb ff ff       	jmp    101b32 <__alltraps>

00101f75 <vector119>:
.globl vector119
vector119:
  pushl $0
  101f75:	6a 00                	push   $0x0
  pushl $119
  101f77:	6a 77                	push   $0x77
  jmp __alltraps
  101f79:	e9 b4 fb ff ff       	jmp    101b32 <__alltraps>

00101f7e <vector120>:
.globl vector120
vector120:
  pushl $0
  101f7e:	6a 00                	push   $0x0
  pushl $120
  101f80:	6a 78                	push   $0x78
  jmp __alltraps
  101f82:	e9 ab fb ff ff       	jmp    101b32 <__alltraps>

00101f87 <vector121>:
.globl vector121
vector121:
  pushl $0
  101f87:	6a 00                	push   $0x0
  pushl $121
  101f89:	6a 79                	push   $0x79
  jmp __alltraps
  101f8b:	e9 a2 fb ff ff       	jmp    101b32 <__alltraps>

00101f90 <vector122>:
.globl vector122
vector122:
  pushl $0
  101f90:	6a 00                	push   $0x0
  pushl $122
  101f92:	6a 7a                	push   $0x7a
  jmp __alltraps
  101f94:	e9 99 fb ff ff       	jmp    101b32 <__alltraps>

00101f99 <vector123>:
.globl vector123
vector123:
  pushl $0
  101f99:	6a 00                	push   $0x0
  pushl $123
  101f9b:	6a 7b                	push   $0x7b
  jmp __alltraps
  101f9d:	e9 90 fb ff ff       	jmp    101b32 <__alltraps>

00101fa2 <vector124>:
.globl vector124
vector124:
  pushl $0
  101fa2:	6a 00                	push   $0x0
  pushl $124
  101fa4:	6a 7c                	push   $0x7c
  jmp __alltraps
  101fa6:	e9 87 fb ff ff       	jmp    101b32 <__alltraps>

00101fab <vector125>:
.globl vector125
vector125:
  pushl $0
  101fab:	6a 00                	push   $0x0
  pushl $125
  101fad:	6a 7d                	push   $0x7d
  jmp __alltraps
  101faf:	e9 7e fb ff ff       	jmp    101b32 <__alltraps>

00101fb4 <vector126>:
.globl vector126
vector126:
  pushl $0
  101fb4:	6a 00                	push   $0x0
  pushl $126
  101fb6:	6a 7e                	push   $0x7e
  jmp __alltraps
  101fb8:	e9 75 fb ff ff       	jmp    101b32 <__alltraps>

00101fbd <vector127>:
.globl vector127
vector127:
  pushl $0
  101fbd:	6a 00                	push   $0x0
  pushl $127
  101fbf:	6a 7f                	push   $0x7f
  jmp __alltraps
  101fc1:	e9 6c fb ff ff       	jmp    101b32 <__alltraps>

00101fc6 <vector128>:
.globl vector128
vector128:
  pushl $0
  101fc6:	6a 00                	push   $0x0
  pushl $128
  101fc8:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  101fcd:	e9 60 fb ff ff       	jmp    101b32 <__alltraps>

00101fd2 <vector129>:
.globl vector129
vector129:
  pushl $0
  101fd2:	6a 00                	push   $0x0
  pushl $129
  101fd4:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  101fd9:	e9 54 fb ff ff       	jmp    101b32 <__alltraps>

00101fde <vector130>:
.globl vector130
vector130:
  pushl $0
  101fde:	6a 00                	push   $0x0
  pushl $130
  101fe0:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  101fe5:	e9 48 fb ff ff       	jmp    101b32 <__alltraps>

00101fea <vector131>:
.globl vector131
vector131:
  pushl $0
  101fea:	6a 00                	push   $0x0
  pushl $131
  101fec:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  101ff1:	e9 3c fb ff ff       	jmp    101b32 <__alltraps>

00101ff6 <vector132>:
.globl vector132
vector132:
  pushl $0
  101ff6:	6a 00                	push   $0x0
  pushl $132
  101ff8:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  101ffd:	e9 30 fb ff ff       	jmp    101b32 <__alltraps>

00102002 <vector133>:
.globl vector133
vector133:
  pushl $0
  102002:	6a 00                	push   $0x0
  pushl $133
  102004:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102009:	e9 24 fb ff ff       	jmp    101b32 <__alltraps>

0010200e <vector134>:
.globl vector134
vector134:
  pushl $0
  10200e:	6a 00                	push   $0x0
  pushl $134
  102010:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102015:	e9 18 fb ff ff       	jmp    101b32 <__alltraps>

0010201a <vector135>:
.globl vector135
vector135:
  pushl $0
  10201a:	6a 00                	push   $0x0
  pushl $135
  10201c:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102021:	e9 0c fb ff ff       	jmp    101b32 <__alltraps>

00102026 <vector136>:
.globl vector136
vector136:
  pushl $0
  102026:	6a 00                	push   $0x0
  pushl $136
  102028:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10202d:	e9 00 fb ff ff       	jmp    101b32 <__alltraps>

00102032 <vector137>:
.globl vector137
vector137:
  pushl $0
  102032:	6a 00                	push   $0x0
  pushl $137
  102034:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  102039:	e9 f4 fa ff ff       	jmp    101b32 <__alltraps>

0010203e <vector138>:
.globl vector138
vector138:
  pushl $0
  10203e:	6a 00                	push   $0x0
  pushl $138
  102040:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102045:	e9 e8 fa ff ff       	jmp    101b32 <__alltraps>

0010204a <vector139>:
.globl vector139
vector139:
  pushl $0
  10204a:	6a 00                	push   $0x0
  pushl $139
  10204c:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102051:	e9 dc fa ff ff       	jmp    101b32 <__alltraps>

00102056 <vector140>:
.globl vector140
vector140:
  pushl $0
  102056:	6a 00                	push   $0x0
  pushl $140
  102058:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  10205d:	e9 d0 fa ff ff       	jmp    101b32 <__alltraps>

00102062 <vector141>:
.globl vector141
vector141:
  pushl $0
  102062:	6a 00                	push   $0x0
  pushl $141
  102064:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  102069:	e9 c4 fa ff ff       	jmp    101b32 <__alltraps>

0010206e <vector142>:
.globl vector142
vector142:
  pushl $0
  10206e:	6a 00                	push   $0x0
  pushl $142
  102070:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102075:	e9 b8 fa ff ff       	jmp    101b32 <__alltraps>

0010207a <vector143>:
.globl vector143
vector143:
  pushl $0
  10207a:	6a 00                	push   $0x0
  pushl $143
  10207c:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102081:	e9 ac fa ff ff       	jmp    101b32 <__alltraps>

00102086 <vector144>:
.globl vector144
vector144:
  pushl $0
  102086:	6a 00                	push   $0x0
  pushl $144
  102088:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  10208d:	e9 a0 fa ff ff       	jmp    101b32 <__alltraps>

00102092 <vector145>:
.globl vector145
vector145:
  pushl $0
  102092:	6a 00                	push   $0x0
  pushl $145
  102094:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102099:	e9 94 fa ff ff       	jmp    101b32 <__alltraps>

0010209e <vector146>:
.globl vector146
vector146:
  pushl $0
  10209e:	6a 00                	push   $0x0
  pushl $146
  1020a0:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1020a5:	e9 88 fa ff ff       	jmp    101b32 <__alltraps>

001020aa <vector147>:
.globl vector147
vector147:
  pushl $0
  1020aa:	6a 00                	push   $0x0
  pushl $147
  1020ac:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1020b1:	e9 7c fa ff ff       	jmp    101b32 <__alltraps>

001020b6 <vector148>:
.globl vector148
vector148:
  pushl $0
  1020b6:	6a 00                	push   $0x0
  pushl $148
  1020b8:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  1020bd:	e9 70 fa ff ff       	jmp    101b32 <__alltraps>

001020c2 <vector149>:
.globl vector149
vector149:
  pushl $0
  1020c2:	6a 00                	push   $0x0
  pushl $149
  1020c4:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  1020c9:	e9 64 fa ff ff       	jmp    101b32 <__alltraps>

001020ce <vector150>:
.globl vector150
vector150:
  pushl $0
  1020ce:	6a 00                	push   $0x0
  pushl $150
  1020d0:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  1020d5:	e9 58 fa ff ff       	jmp    101b32 <__alltraps>

001020da <vector151>:
.globl vector151
vector151:
  pushl $0
  1020da:	6a 00                	push   $0x0
  pushl $151
  1020dc:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  1020e1:	e9 4c fa ff ff       	jmp    101b32 <__alltraps>

001020e6 <vector152>:
.globl vector152
vector152:
  pushl $0
  1020e6:	6a 00                	push   $0x0
  pushl $152
  1020e8:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  1020ed:	e9 40 fa ff ff       	jmp    101b32 <__alltraps>

001020f2 <vector153>:
.globl vector153
vector153:
  pushl $0
  1020f2:	6a 00                	push   $0x0
  pushl $153
  1020f4:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  1020f9:	e9 34 fa ff ff       	jmp    101b32 <__alltraps>

001020fe <vector154>:
.globl vector154
vector154:
  pushl $0
  1020fe:	6a 00                	push   $0x0
  pushl $154
  102100:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102105:	e9 28 fa ff ff       	jmp    101b32 <__alltraps>

0010210a <vector155>:
.globl vector155
vector155:
  pushl $0
  10210a:	6a 00                	push   $0x0
  pushl $155
  10210c:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102111:	e9 1c fa ff ff       	jmp    101b32 <__alltraps>

00102116 <vector156>:
.globl vector156
vector156:
  pushl $0
  102116:	6a 00                	push   $0x0
  pushl $156
  102118:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10211d:	e9 10 fa ff ff       	jmp    101b32 <__alltraps>

00102122 <vector157>:
.globl vector157
vector157:
  pushl $0
  102122:	6a 00                	push   $0x0
  pushl $157
  102124:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102129:	e9 04 fa ff ff       	jmp    101b32 <__alltraps>

0010212e <vector158>:
.globl vector158
vector158:
  pushl $0
  10212e:	6a 00                	push   $0x0
  pushl $158
  102130:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102135:	e9 f8 f9 ff ff       	jmp    101b32 <__alltraps>

0010213a <vector159>:
.globl vector159
vector159:
  pushl $0
  10213a:	6a 00                	push   $0x0
  pushl $159
  10213c:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102141:	e9 ec f9 ff ff       	jmp    101b32 <__alltraps>

00102146 <vector160>:
.globl vector160
vector160:
  pushl $0
  102146:	6a 00                	push   $0x0
  pushl $160
  102148:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  10214d:	e9 e0 f9 ff ff       	jmp    101b32 <__alltraps>

00102152 <vector161>:
.globl vector161
vector161:
  pushl $0
  102152:	6a 00                	push   $0x0
  pushl $161
  102154:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  102159:	e9 d4 f9 ff ff       	jmp    101b32 <__alltraps>

0010215e <vector162>:
.globl vector162
vector162:
  pushl $0
  10215e:	6a 00                	push   $0x0
  pushl $162
  102160:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102165:	e9 c8 f9 ff ff       	jmp    101b32 <__alltraps>

0010216a <vector163>:
.globl vector163
vector163:
  pushl $0
  10216a:	6a 00                	push   $0x0
  pushl $163
  10216c:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102171:	e9 bc f9 ff ff       	jmp    101b32 <__alltraps>

00102176 <vector164>:
.globl vector164
vector164:
  pushl $0
  102176:	6a 00                	push   $0x0
  pushl $164
  102178:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  10217d:	e9 b0 f9 ff ff       	jmp    101b32 <__alltraps>

00102182 <vector165>:
.globl vector165
vector165:
  pushl $0
  102182:	6a 00                	push   $0x0
  pushl $165
  102184:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  102189:	e9 a4 f9 ff ff       	jmp    101b32 <__alltraps>

0010218e <vector166>:
.globl vector166
vector166:
  pushl $0
  10218e:	6a 00                	push   $0x0
  pushl $166
  102190:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102195:	e9 98 f9 ff ff       	jmp    101b32 <__alltraps>

0010219a <vector167>:
.globl vector167
vector167:
  pushl $0
  10219a:	6a 00                	push   $0x0
  pushl $167
  10219c:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1021a1:	e9 8c f9 ff ff       	jmp    101b32 <__alltraps>

001021a6 <vector168>:
.globl vector168
vector168:
  pushl $0
  1021a6:	6a 00                	push   $0x0
  pushl $168
  1021a8:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1021ad:	e9 80 f9 ff ff       	jmp    101b32 <__alltraps>

001021b2 <vector169>:
.globl vector169
vector169:
  pushl $0
  1021b2:	6a 00                	push   $0x0
  pushl $169
  1021b4:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  1021b9:	e9 74 f9 ff ff       	jmp    101b32 <__alltraps>

001021be <vector170>:
.globl vector170
vector170:
  pushl $0
  1021be:	6a 00                	push   $0x0
  pushl $170
  1021c0:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  1021c5:	e9 68 f9 ff ff       	jmp    101b32 <__alltraps>

001021ca <vector171>:
.globl vector171
vector171:
  pushl $0
  1021ca:	6a 00                	push   $0x0
  pushl $171
  1021cc:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  1021d1:	e9 5c f9 ff ff       	jmp    101b32 <__alltraps>

001021d6 <vector172>:
.globl vector172
vector172:
  pushl $0
  1021d6:	6a 00                	push   $0x0
  pushl $172
  1021d8:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  1021dd:	e9 50 f9 ff ff       	jmp    101b32 <__alltraps>

001021e2 <vector173>:
.globl vector173
vector173:
  pushl $0
  1021e2:	6a 00                	push   $0x0
  pushl $173
  1021e4:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  1021e9:	e9 44 f9 ff ff       	jmp    101b32 <__alltraps>

001021ee <vector174>:
.globl vector174
vector174:
  pushl $0
  1021ee:	6a 00                	push   $0x0
  pushl $174
  1021f0:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  1021f5:	e9 38 f9 ff ff       	jmp    101b32 <__alltraps>

001021fa <vector175>:
.globl vector175
vector175:
  pushl $0
  1021fa:	6a 00                	push   $0x0
  pushl $175
  1021fc:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102201:	e9 2c f9 ff ff       	jmp    101b32 <__alltraps>

00102206 <vector176>:
.globl vector176
vector176:
  pushl $0
  102206:	6a 00                	push   $0x0
  pushl $176
  102208:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  10220d:	e9 20 f9 ff ff       	jmp    101b32 <__alltraps>

00102212 <vector177>:
.globl vector177
vector177:
  pushl $0
  102212:	6a 00                	push   $0x0
  pushl $177
  102214:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102219:	e9 14 f9 ff ff       	jmp    101b32 <__alltraps>

0010221e <vector178>:
.globl vector178
vector178:
  pushl $0
  10221e:	6a 00                	push   $0x0
  pushl $178
  102220:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102225:	e9 08 f9 ff ff       	jmp    101b32 <__alltraps>

0010222a <vector179>:
.globl vector179
vector179:
  pushl $0
  10222a:	6a 00                	push   $0x0
  pushl $179
  10222c:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102231:	e9 fc f8 ff ff       	jmp    101b32 <__alltraps>

00102236 <vector180>:
.globl vector180
vector180:
  pushl $0
  102236:	6a 00                	push   $0x0
  pushl $180
  102238:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  10223d:	e9 f0 f8 ff ff       	jmp    101b32 <__alltraps>

00102242 <vector181>:
.globl vector181
vector181:
  pushl $0
  102242:	6a 00                	push   $0x0
  pushl $181
  102244:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102249:	e9 e4 f8 ff ff       	jmp    101b32 <__alltraps>

0010224e <vector182>:
.globl vector182
vector182:
  pushl $0
  10224e:	6a 00                	push   $0x0
  pushl $182
  102250:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102255:	e9 d8 f8 ff ff       	jmp    101b32 <__alltraps>

0010225a <vector183>:
.globl vector183
vector183:
  pushl $0
  10225a:	6a 00                	push   $0x0
  pushl $183
  10225c:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102261:	e9 cc f8 ff ff       	jmp    101b32 <__alltraps>

00102266 <vector184>:
.globl vector184
vector184:
  pushl $0
  102266:	6a 00                	push   $0x0
  pushl $184
  102268:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  10226d:	e9 c0 f8 ff ff       	jmp    101b32 <__alltraps>

00102272 <vector185>:
.globl vector185
vector185:
  pushl $0
  102272:	6a 00                	push   $0x0
  pushl $185
  102274:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  102279:	e9 b4 f8 ff ff       	jmp    101b32 <__alltraps>

0010227e <vector186>:
.globl vector186
vector186:
  pushl $0
  10227e:	6a 00                	push   $0x0
  pushl $186
  102280:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102285:	e9 a8 f8 ff ff       	jmp    101b32 <__alltraps>

0010228a <vector187>:
.globl vector187
vector187:
  pushl $0
  10228a:	6a 00                	push   $0x0
  pushl $187
  10228c:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102291:	e9 9c f8 ff ff       	jmp    101b32 <__alltraps>

00102296 <vector188>:
.globl vector188
vector188:
  pushl $0
  102296:	6a 00                	push   $0x0
  pushl $188
  102298:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  10229d:	e9 90 f8 ff ff       	jmp    101b32 <__alltraps>

001022a2 <vector189>:
.globl vector189
vector189:
  pushl $0
  1022a2:	6a 00                	push   $0x0
  pushl $189
  1022a4:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1022a9:	e9 84 f8 ff ff       	jmp    101b32 <__alltraps>

001022ae <vector190>:
.globl vector190
vector190:
  pushl $0
  1022ae:	6a 00                	push   $0x0
  pushl $190
  1022b0:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1022b5:	e9 78 f8 ff ff       	jmp    101b32 <__alltraps>

001022ba <vector191>:
.globl vector191
vector191:
  pushl $0
  1022ba:	6a 00                	push   $0x0
  pushl $191
  1022bc:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  1022c1:	e9 6c f8 ff ff       	jmp    101b32 <__alltraps>

001022c6 <vector192>:
.globl vector192
vector192:
  pushl $0
  1022c6:	6a 00                	push   $0x0
  pushl $192
  1022c8:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  1022cd:	e9 60 f8 ff ff       	jmp    101b32 <__alltraps>

001022d2 <vector193>:
.globl vector193
vector193:
  pushl $0
  1022d2:	6a 00                	push   $0x0
  pushl $193
  1022d4:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  1022d9:	e9 54 f8 ff ff       	jmp    101b32 <__alltraps>

001022de <vector194>:
.globl vector194
vector194:
  pushl $0
  1022de:	6a 00                	push   $0x0
  pushl $194
  1022e0:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  1022e5:	e9 48 f8 ff ff       	jmp    101b32 <__alltraps>

001022ea <vector195>:
.globl vector195
vector195:
  pushl $0
  1022ea:	6a 00                	push   $0x0
  pushl $195
  1022ec:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  1022f1:	e9 3c f8 ff ff       	jmp    101b32 <__alltraps>

001022f6 <vector196>:
.globl vector196
vector196:
  pushl $0
  1022f6:	6a 00                	push   $0x0
  pushl $196
  1022f8:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1022fd:	e9 30 f8 ff ff       	jmp    101b32 <__alltraps>

00102302 <vector197>:
.globl vector197
vector197:
  pushl $0
  102302:	6a 00                	push   $0x0
  pushl $197
  102304:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102309:	e9 24 f8 ff ff       	jmp    101b32 <__alltraps>

0010230e <vector198>:
.globl vector198
vector198:
  pushl $0
  10230e:	6a 00                	push   $0x0
  pushl $198
  102310:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102315:	e9 18 f8 ff ff       	jmp    101b32 <__alltraps>

0010231a <vector199>:
.globl vector199
vector199:
  pushl $0
  10231a:	6a 00                	push   $0x0
  pushl $199
  10231c:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102321:	e9 0c f8 ff ff       	jmp    101b32 <__alltraps>

00102326 <vector200>:
.globl vector200
vector200:
  pushl $0
  102326:	6a 00                	push   $0x0
  pushl $200
  102328:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  10232d:	e9 00 f8 ff ff       	jmp    101b32 <__alltraps>

00102332 <vector201>:
.globl vector201
vector201:
  pushl $0
  102332:	6a 00                	push   $0x0
  pushl $201
  102334:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102339:	e9 f4 f7 ff ff       	jmp    101b32 <__alltraps>

0010233e <vector202>:
.globl vector202
vector202:
  pushl $0
  10233e:	6a 00                	push   $0x0
  pushl $202
  102340:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102345:	e9 e8 f7 ff ff       	jmp    101b32 <__alltraps>

0010234a <vector203>:
.globl vector203
vector203:
  pushl $0
  10234a:	6a 00                	push   $0x0
  pushl $203
  10234c:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102351:	e9 dc f7 ff ff       	jmp    101b32 <__alltraps>

00102356 <vector204>:
.globl vector204
vector204:
  pushl $0
  102356:	6a 00                	push   $0x0
  pushl $204
  102358:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  10235d:	e9 d0 f7 ff ff       	jmp    101b32 <__alltraps>

00102362 <vector205>:
.globl vector205
vector205:
  pushl $0
  102362:	6a 00                	push   $0x0
  pushl $205
  102364:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  102369:	e9 c4 f7 ff ff       	jmp    101b32 <__alltraps>

0010236e <vector206>:
.globl vector206
vector206:
  pushl $0
  10236e:	6a 00                	push   $0x0
  pushl $206
  102370:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102375:	e9 b8 f7 ff ff       	jmp    101b32 <__alltraps>

0010237a <vector207>:
.globl vector207
vector207:
  pushl $0
  10237a:	6a 00                	push   $0x0
  pushl $207
  10237c:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102381:	e9 ac f7 ff ff       	jmp    101b32 <__alltraps>

00102386 <vector208>:
.globl vector208
vector208:
  pushl $0
  102386:	6a 00                	push   $0x0
  pushl $208
  102388:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  10238d:	e9 a0 f7 ff ff       	jmp    101b32 <__alltraps>

00102392 <vector209>:
.globl vector209
vector209:
  pushl $0
  102392:	6a 00                	push   $0x0
  pushl $209
  102394:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102399:	e9 94 f7 ff ff       	jmp    101b32 <__alltraps>

0010239e <vector210>:
.globl vector210
vector210:
  pushl $0
  10239e:	6a 00                	push   $0x0
  pushl $210
  1023a0:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1023a5:	e9 88 f7 ff ff       	jmp    101b32 <__alltraps>

001023aa <vector211>:
.globl vector211
vector211:
  pushl $0
  1023aa:	6a 00                	push   $0x0
  pushl $211
  1023ac:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1023b1:	e9 7c f7 ff ff       	jmp    101b32 <__alltraps>

001023b6 <vector212>:
.globl vector212
vector212:
  pushl $0
  1023b6:	6a 00                	push   $0x0
  pushl $212
  1023b8:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  1023bd:	e9 70 f7 ff ff       	jmp    101b32 <__alltraps>

001023c2 <vector213>:
.globl vector213
vector213:
  pushl $0
  1023c2:	6a 00                	push   $0x0
  pushl $213
  1023c4:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  1023c9:	e9 64 f7 ff ff       	jmp    101b32 <__alltraps>

001023ce <vector214>:
.globl vector214
vector214:
  pushl $0
  1023ce:	6a 00                	push   $0x0
  pushl $214
  1023d0:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  1023d5:	e9 58 f7 ff ff       	jmp    101b32 <__alltraps>

001023da <vector215>:
.globl vector215
vector215:
  pushl $0
  1023da:	6a 00                	push   $0x0
  pushl $215
  1023dc:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  1023e1:	e9 4c f7 ff ff       	jmp    101b32 <__alltraps>

001023e6 <vector216>:
.globl vector216
vector216:
  pushl $0
  1023e6:	6a 00                	push   $0x0
  pushl $216
  1023e8:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  1023ed:	e9 40 f7 ff ff       	jmp    101b32 <__alltraps>

001023f2 <vector217>:
.globl vector217
vector217:
  pushl $0
  1023f2:	6a 00                	push   $0x0
  pushl $217
  1023f4:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  1023f9:	e9 34 f7 ff ff       	jmp    101b32 <__alltraps>

001023fe <vector218>:
.globl vector218
vector218:
  pushl $0
  1023fe:	6a 00                	push   $0x0
  pushl $218
  102400:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102405:	e9 28 f7 ff ff       	jmp    101b32 <__alltraps>

0010240a <vector219>:
.globl vector219
vector219:
  pushl $0
  10240a:	6a 00                	push   $0x0
  pushl $219
  10240c:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102411:	e9 1c f7 ff ff       	jmp    101b32 <__alltraps>

00102416 <vector220>:
.globl vector220
vector220:
  pushl $0
  102416:	6a 00                	push   $0x0
  pushl $220
  102418:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  10241d:	e9 10 f7 ff ff       	jmp    101b32 <__alltraps>

00102422 <vector221>:
.globl vector221
vector221:
  pushl $0
  102422:	6a 00                	push   $0x0
  pushl $221
  102424:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102429:	e9 04 f7 ff ff       	jmp    101b32 <__alltraps>

0010242e <vector222>:
.globl vector222
vector222:
  pushl $0
  10242e:	6a 00                	push   $0x0
  pushl $222
  102430:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102435:	e9 f8 f6 ff ff       	jmp    101b32 <__alltraps>

0010243a <vector223>:
.globl vector223
vector223:
  pushl $0
  10243a:	6a 00                	push   $0x0
  pushl $223
  10243c:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102441:	e9 ec f6 ff ff       	jmp    101b32 <__alltraps>

00102446 <vector224>:
.globl vector224
vector224:
  pushl $0
  102446:	6a 00                	push   $0x0
  pushl $224
  102448:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  10244d:	e9 e0 f6 ff ff       	jmp    101b32 <__alltraps>

00102452 <vector225>:
.globl vector225
vector225:
  pushl $0
  102452:	6a 00                	push   $0x0
  pushl $225
  102454:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  102459:	e9 d4 f6 ff ff       	jmp    101b32 <__alltraps>

0010245e <vector226>:
.globl vector226
vector226:
  pushl $0
  10245e:	6a 00                	push   $0x0
  pushl $226
  102460:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102465:	e9 c8 f6 ff ff       	jmp    101b32 <__alltraps>

0010246a <vector227>:
.globl vector227
vector227:
  pushl $0
  10246a:	6a 00                	push   $0x0
  pushl $227
  10246c:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102471:	e9 bc f6 ff ff       	jmp    101b32 <__alltraps>

00102476 <vector228>:
.globl vector228
vector228:
  pushl $0
  102476:	6a 00                	push   $0x0
  pushl $228
  102478:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  10247d:	e9 b0 f6 ff ff       	jmp    101b32 <__alltraps>

00102482 <vector229>:
.globl vector229
vector229:
  pushl $0
  102482:	6a 00                	push   $0x0
  pushl $229
  102484:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  102489:	e9 a4 f6 ff ff       	jmp    101b32 <__alltraps>

0010248e <vector230>:
.globl vector230
vector230:
  pushl $0
  10248e:	6a 00                	push   $0x0
  pushl $230
  102490:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102495:	e9 98 f6 ff ff       	jmp    101b32 <__alltraps>

0010249a <vector231>:
.globl vector231
vector231:
  pushl $0
  10249a:	6a 00                	push   $0x0
  pushl $231
  10249c:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1024a1:	e9 8c f6 ff ff       	jmp    101b32 <__alltraps>

001024a6 <vector232>:
.globl vector232
vector232:
  pushl $0
  1024a6:	6a 00                	push   $0x0
  pushl $232
  1024a8:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  1024ad:	e9 80 f6 ff ff       	jmp    101b32 <__alltraps>

001024b2 <vector233>:
.globl vector233
vector233:
  pushl $0
  1024b2:	6a 00                	push   $0x0
  pushl $233
  1024b4:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  1024b9:	e9 74 f6 ff ff       	jmp    101b32 <__alltraps>

001024be <vector234>:
.globl vector234
vector234:
  pushl $0
  1024be:	6a 00                	push   $0x0
  pushl $234
  1024c0:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  1024c5:	e9 68 f6 ff ff       	jmp    101b32 <__alltraps>

001024ca <vector235>:
.globl vector235
vector235:
  pushl $0
  1024ca:	6a 00                	push   $0x0
  pushl $235
  1024cc:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  1024d1:	e9 5c f6 ff ff       	jmp    101b32 <__alltraps>

001024d6 <vector236>:
.globl vector236
vector236:
  pushl $0
  1024d6:	6a 00                	push   $0x0
  pushl $236
  1024d8:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  1024dd:	e9 50 f6 ff ff       	jmp    101b32 <__alltraps>

001024e2 <vector237>:
.globl vector237
vector237:
  pushl $0
  1024e2:	6a 00                	push   $0x0
  pushl $237
  1024e4:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  1024e9:	e9 44 f6 ff ff       	jmp    101b32 <__alltraps>

001024ee <vector238>:
.globl vector238
vector238:
  pushl $0
  1024ee:	6a 00                	push   $0x0
  pushl $238
  1024f0:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  1024f5:	e9 38 f6 ff ff       	jmp    101b32 <__alltraps>

001024fa <vector239>:
.globl vector239
vector239:
  pushl $0
  1024fa:	6a 00                	push   $0x0
  pushl $239
  1024fc:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102501:	e9 2c f6 ff ff       	jmp    101b32 <__alltraps>

00102506 <vector240>:
.globl vector240
vector240:
  pushl $0
  102506:	6a 00                	push   $0x0
  pushl $240
  102508:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  10250d:	e9 20 f6 ff ff       	jmp    101b32 <__alltraps>

00102512 <vector241>:
.globl vector241
vector241:
  pushl $0
  102512:	6a 00                	push   $0x0
  pushl $241
  102514:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102519:	e9 14 f6 ff ff       	jmp    101b32 <__alltraps>

0010251e <vector242>:
.globl vector242
vector242:
  pushl $0
  10251e:	6a 00                	push   $0x0
  pushl $242
  102520:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102525:	e9 08 f6 ff ff       	jmp    101b32 <__alltraps>

0010252a <vector243>:
.globl vector243
vector243:
  pushl $0
  10252a:	6a 00                	push   $0x0
  pushl $243
  10252c:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102531:	e9 fc f5 ff ff       	jmp    101b32 <__alltraps>

00102536 <vector244>:
.globl vector244
vector244:
  pushl $0
  102536:	6a 00                	push   $0x0
  pushl $244
  102538:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  10253d:	e9 f0 f5 ff ff       	jmp    101b32 <__alltraps>

00102542 <vector245>:
.globl vector245
vector245:
  pushl $0
  102542:	6a 00                	push   $0x0
  pushl $245
  102544:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102549:	e9 e4 f5 ff ff       	jmp    101b32 <__alltraps>

0010254e <vector246>:
.globl vector246
vector246:
  pushl $0
  10254e:	6a 00                	push   $0x0
  pushl $246
  102550:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102555:	e9 d8 f5 ff ff       	jmp    101b32 <__alltraps>

0010255a <vector247>:
.globl vector247
vector247:
  pushl $0
  10255a:	6a 00                	push   $0x0
  pushl $247
  10255c:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102561:	e9 cc f5 ff ff       	jmp    101b32 <__alltraps>

00102566 <vector248>:
.globl vector248
vector248:
  pushl $0
  102566:	6a 00                	push   $0x0
  pushl $248
  102568:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  10256d:	e9 c0 f5 ff ff       	jmp    101b32 <__alltraps>

00102572 <vector249>:
.globl vector249
vector249:
  pushl $0
  102572:	6a 00                	push   $0x0
  pushl $249
  102574:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102579:	e9 b4 f5 ff ff       	jmp    101b32 <__alltraps>

0010257e <vector250>:
.globl vector250
vector250:
  pushl $0
  10257e:	6a 00                	push   $0x0
  pushl $250
  102580:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102585:	e9 a8 f5 ff ff       	jmp    101b32 <__alltraps>

0010258a <vector251>:
.globl vector251
vector251:
  pushl $0
  10258a:	6a 00                	push   $0x0
  pushl $251
  10258c:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102591:	e9 9c f5 ff ff       	jmp    101b32 <__alltraps>

00102596 <vector252>:
.globl vector252
vector252:
  pushl $0
  102596:	6a 00                	push   $0x0
  pushl $252
  102598:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  10259d:	e9 90 f5 ff ff       	jmp    101b32 <__alltraps>

001025a2 <vector253>:
.globl vector253
vector253:
  pushl $0
  1025a2:	6a 00                	push   $0x0
  pushl $253
  1025a4:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  1025a9:	e9 84 f5 ff ff       	jmp    101b32 <__alltraps>

001025ae <vector254>:
.globl vector254
vector254:
  pushl $0
  1025ae:	6a 00                	push   $0x0
  pushl $254
  1025b0:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  1025b5:	e9 78 f5 ff ff       	jmp    101b32 <__alltraps>

001025ba <vector255>:
.globl vector255
vector255:
  pushl $0
  1025ba:	6a 00                	push   $0x0
  pushl $255
  1025bc:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  1025c1:	e9 6c f5 ff ff       	jmp    101b32 <__alltraps>

001025c6 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  1025c6:	55                   	push   %ebp
  1025c7:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  1025c9:	8b 45 08             	mov    0x8(%ebp),%eax
  1025cc:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  1025cf:	b8 23 00 00 00       	mov    $0x23,%eax
  1025d4:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  1025d6:	b8 23 00 00 00       	mov    $0x23,%eax
  1025db:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  1025dd:	b8 10 00 00 00       	mov    $0x10,%eax
  1025e2:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  1025e4:	b8 10 00 00 00       	mov    $0x10,%eax
  1025e9:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  1025eb:	b8 10 00 00 00       	mov    $0x10,%eax
  1025f0:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  1025f2:	ea f9 25 10 00 08 00 	ljmp   $0x8,$0x1025f9
}
  1025f9:	90                   	nop
  1025fa:	5d                   	pop    %ebp
  1025fb:	c3                   	ret    

001025fc <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  1025fc:	55                   	push   %ebp
  1025fd:	89 e5                	mov    %esp,%ebp
  1025ff:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102602:	b8 20 09 11 00       	mov    $0x110920,%eax
  102607:	05 00 04 00 00       	add    $0x400,%eax
  10260c:	a3 a4 08 11 00       	mov    %eax,0x1108a4
    ts.ts_ss0 = KERNEL_DS;
  102611:	66 c7 05 a8 08 11 00 	movw   $0x10,0x1108a8
  102618:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  10261a:	66 c7 05 08 fa 10 00 	movw   $0x68,0x10fa08
  102621:	68 00 
  102623:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  102628:	0f b7 c0             	movzwl %ax,%eax
  10262b:	66 a3 0a fa 10 00    	mov    %ax,0x10fa0a
  102631:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  102636:	c1 e8 10             	shr    $0x10,%eax
  102639:	a2 0c fa 10 00       	mov    %al,0x10fa0c
  10263e:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102645:	24 f0                	and    $0xf0,%al
  102647:	0c 09                	or     $0x9,%al
  102649:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  10264e:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102655:	0c 10                	or     $0x10,%al
  102657:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  10265c:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102663:	24 9f                	and    $0x9f,%al
  102665:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  10266a:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102671:	0c 80                	or     $0x80,%al
  102673:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102678:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  10267f:	24 f0                	and    $0xf0,%al
  102681:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102686:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  10268d:	24 ef                	and    $0xef,%al
  10268f:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102694:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  10269b:	24 df                	and    $0xdf,%al
  10269d:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1026a2:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  1026a9:	0c 40                	or     $0x40,%al
  1026ab:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1026b0:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  1026b7:	24 7f                	and    $0x7f,%al
  1026b9:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1026be:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  1026c3:	c1 e8 18             	shr    $0x18,%eax
  1026c6:	a2 0f fa 10 00       	mov    %al,0x10fa0f
    gdt[SEG_TSS].sd_s = 0;
  1026cb:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1026d2:	24 ef                	and    $0xef,%al
  1026d4:	a2 0d fa 10 00       	mov    %al,0x10fa0d

    // reload all segment registers
    lgdt(&gdt_pd);
  1026d9:	c7 04 24 10 fa 10 00 	movl   $0x10fa10,(%esp)
  1026e0:	e8 e1 fe ff ff       	call   1025c6 <lgdt>
  1026e5:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  1026eb:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  1026ef:	0f 00 d8             	ltr    %ax
}
  1026f2:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  1026f3:	90                   	nop
  1026f4:	c9                   	leave  
  1026f5:	c3                   	ret    

001026f6 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  1026f6:	55                   	push   %ebp
  1026f7:	89 e5                	mov    %esp,%ebp
    gdt_init();
  1026f9:	e8 fe fe ff ff       	call   1025fc <gdt_init>
}
  1026fe:	90                   	nop
  1026ff:	5d                   	pop    %ebp
  102700:	c3                   	ret    

00102701 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102701:	55                   	push   %ebp
  102702:	89 e5                	mov    %esp,%ebp
  102704:	83 ec 58             	sub    $0x58,%esp
  102707:	8b 45 10             	mov    0x10(%ebp),%eax
  10270a:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10270d:	8b 45 14             	mov    0x14(%ebp),%eax
  102710:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102713:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102716:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102719:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10271c:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  10271f:	8b 45 18             	mov    0x18(%ebp),%eax
  102722:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102725:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102728:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10272b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10272e:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102731:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102734:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102737:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10273b:	74 1c                	je     102759 <printnum+0x58>
  10273d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102740:	ba 00 00 00 00       	mov    $0x0,%edx
  102745:	f7 75 e4             	divl   -0x1c(%ebp)
  102748:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10274b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10274e:	ba 00 00 00 00       	mov    $0x0,%edx
  102753:	f7 75 e4             	divl   -0x1c(%ebp)
  102756:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102759:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10275c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10275f:	f7 75 e4             	divl   -0x1c(%ebp)
  102762:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102765:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102768:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10276b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10276e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102771:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102774:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102777:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  10277a:	8b 45 18             	mov    0x18(%ebp),%eax
  10277d:	ba 00 00 00 00       	mov    $0x0,%edx
  102782:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  102785:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102788:	19 d1                	sbb    %edx,%ecx
  10278a:	72 4c                	jb     1027d8 <printnum+0xd7>
        printnum(putch, putdat, result, base, width - 1, padc);
  10278c:	8b 45 1c             	mov    0x1c(%ebp),%eax
  10278f:	8d 50 ff             	lea    -0x1(%eax),%edx
  102792:	8b 45 20             	mov    0x20(%ebp),%eax
  102795:	89 44 24 18          	mov    %eax,0x18(%esp)
  102799:	89 54 24 14          	mov    %edx,0x14(%esp)
  10279d:	8b 45 18             	mov    0x18(%ebp),%eax
  1027a0:	89 44 24 10          	mov    %eax,0x10(%esp)
  1027a4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1027a7:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1027aa:	89 44 24 08          	mov    %eax,0x8(%esp)
  1027ae:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1027b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1027b5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1027b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1027bc:	89 04 24             	mov    %eax,(%esp)
  1027bf:	e8 3d ff ff ff       	call   102701 <printnum>
  1027c4:	eb 1b                	jmp    1027e1 <printnum+0xe0>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  1027c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1027c9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1027cd:	8b 45 20             	mov    0x20(%ebp),%eax
  1027d0:	89 04 24             	mov    %eax,(%esp)
  1027d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1027d6:	ff d0                	call   *%eax
        while (-- width > 0)
  1027d8:	ff 4d 1c             	decl   0x1c(%ebp)
  1027db:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  1027df:	7f e5                	jg     1027c6 <printnum+0xc5>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  1027e1:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1027e4:	05 90 39 10 00       	add    $0x103990,%eax
  1027e9:	0f b6 00             	movzbl (%eax),%eax
  1027ec:	0f be c0             	movsbl %al,%eax
  1027ef:	8b 55 0c             	mov    0xc(%ebp),%edx
  1027f2:	89 54 24 04          	mov    %edx,0x4(%esp)
  1027f6:	89 04 24             	mov    %eax,(%esp)
  1027f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1027fc:	ff d0                	call   *%eax
}
  1027fe:	90                   	nop
  1027ff:	c9                   	leave  
  102800:	c3                   	ret    

00102801 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102801:	55                   	push   %ebp
  102802:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102804:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102808:	7e 14                	jle    10281e <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  10280a:	8b 45 08             	mov    0x8(%ebp),%eax
  10280d:	8b 00                	mov    (%eax),%eax
  10280f:	8d 48 08             	lea    0x8(%eax),%ecx
  102812:	8b 55 08             	mov    0x8(%ebp),%edx
  102815:	89 0a                	mov    %ecx,(%edx)
  102817:	8b 50 04             	mov    0x4(%eax),%edx
  10281a:	8b 00                	mov    (%eax),%eax
  10281c:	eb 30                	jmp    10284e <getuint+0x4d>
    }
    else if (lflag) {
  10281e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102822:	74 16                	je     10283a <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102824:	8b 45 08             	mov    0x8(%ebp),%eax
  102827:	8b 00                	mov    (%eax),%eax
  102829:	8d 48 04             	lea    0x4(%eax),%ecx
  10282c:	8b 55 08             	mov    0x8(%ebp),%edx
  10282f:	89 0a                	mov    %ecx,(%edx)
  102831:	8b 00                	mov    (%eax),%eax
  102833:	ba 00 00 00 00       	mov    $0x0,%edx
  102838:	eb 14                	jmp    10284e <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  10283a:	8b 45 08             	mov    0x8(%ebp),%eax
  10283d:	8b 00                	mov    (%eax),%eax
  10283f:	8d 48 04             	lea    0x4(%eax),%ecx
  102842:	8b 55 08             	mov    0x8(%ebp),%edx
  102845:	89 0a                	mov    %ecx,(%edx)
  102847:	8b 00                	mov    (%eax),%eax
  102849:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  10284e:	5d                   	pop    %ebp
  10284f:	c3                   	ret    

00102850 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102850:	55                   	push   %ebp
  102851:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102853:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102857:	7e 14                	jle    10286d <getint+0x1d>
        return va_arg(*ap, long long);
  102859:	8b 45 08             	mov    0x8(%ebp),%eax
  10285c:	8b 00                	mov    (%eax),%eax
  10285e:	8d 48 08             	lea    0x8(%eax),%ecx
  102861:	8b 55 08             	mov    0x8(%ebp),%edx
  102864:	89 0a                	mov    %ecx,(%edx)
  102866:	8b 50 04             	mov    0x4(%eax),%edx
  102869:	8b 00                	mov    (%eax),%eax
  10286b:	eb 28                	jmp    102895 <getint+0x45>
    }
    else if (lflag) {
  10286d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102871:	74 12                	je     102885 <getint+0x35>
        return va_arg(*ap, long);
  102873:	8b 45 08             	mov    0x8(%ebp),%eax
  102876:	8b 00                	mov    (%eax),%eax
  102878:	8d 48 04             	lea    0x4(%eax),%ecx
  10287b:	8b 55 08             	mov    0x8(%ebp),%edx
  10287e:	89 0a                	mov    %ecx,(%edx)
  102880:	8b 00                	mov    (%eax),%eax
  102882:	99                   	cltd   
  102883:	eb 10                	jmp    102895 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102885:	8b 45 08             	mov    0x8(%ebp),%eax
  102888:	8b 00                	mov    (%eax),%eax
  10288a:	8d 48 04             	lea    0x4(%eax),%ecx
  10288d:	8b 55 08             	mov    0x8(%ebp),%edx
  102890:	89 0a                	mov    %ecx,(%edx)
  102892:	8b 00                	mov    (%eax),%eax
  102894:	99                   	cltd   
    }
}
  102895:	5d                   	pop    %ebp
  102896:	c3                   	ret    

00102897 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102897:	55                   	push   %ebp
  102898:	89 e5                	mov    %esp,%ebp
  10289a:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  10289d:	8d 45 14             	lea    0x14(%ebp),%eax
  1028a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  1028a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1028a6:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1028aa:	8b 45 10             	mov    0x10(%ebp),%eax
  1028ad:	89 44 24 08          	mov    %eax,0x8(%esp)
  1028b1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028b4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1028b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1028bb:	89 04 24             	mov    %eax,(%esp)
  1028be:	e8 03 00 00 00       	call   1028c6 <vprintfmt>
    va_end(ap);
}
  1028c3:	90                   	nop
  1028c4:	c9                   	leave  
  1028c5:	c3                   	ret    

001028c6 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  1028c6:	55                   	push   %ebp
  1028c7:	89 e5                	mov    %esp,%ebp
  1028c9:	56                   	push   %esi
  1028ca:	53                   	push   %ebx
  1028cb:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1028ce:	eb 17                	jmp    1028e7 <vprintfmt+0x21>
            if (ch == '\0') {
  1028d0:	85 db                	test   %ebx,%ebx
  1028d2:	0f 84 bf 03 00 00    	je     102c97 <vprintfmt+0x3d1>
                return;
            }
            putch(ch, putdat);
  1028d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028db:	89 44 24 04          	mov    %eax,0x4(%esp)
  1028df:	89 1c 24             	mov    %ebx,(%esp)
  1028e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1028e5:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1028e7:	8b 45 10             	mov    0x10(%ebp),%eax
  1028ea:	8d 50 01             	lea    0x1(%eax),%edx
  1028ed:	89 55 10             	mov    %edx,0x10(%ebp)
  1028f0:	0f b6 00             	movzbl (%eax),%eax
  1028f3:	0f b6 d8             	movzbl %al,%ebx
  1028f6:	83 fb 25             	cmp    $0x25,%ebx
  1028f9:	75 d5                	jne    1028d0 <vprintfmt+0xa>
        }

        // Process a %-escape sequence
        char padc = ' ';
  1028fb:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  1028ff:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102906:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102909:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  10290c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102913:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102916:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102919:	8b 45 10             	mov    0x10(%ebp),%eax
  10291c:	8d 50 01             	lea    0x1(%eax),%edx
  10291f:	89 55 10             	mov    %edx,0x10(%ebp)
  102922:	0f b6 00             	movzbl (%eax),%eax
  102925:	0f b6 d8             	movzbl %al,%ebx
  102928:	8d 43 dd             	lea    -0x23(%ebx),%eax
  10292b:	83 f8 55             	cmp    $0x55,%eax
  10292e:	0f 87 37 03 00 00    	ja     102c6b <vprintfmt+0x3a5>
  102934:	8b 04 85 b4 39 10 00 	mov    0x1039b4(,%eax,4),%eax
  10293b:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  10293d:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102941:	eb d6                	jmp    102919 <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102943:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102947:	eb d0                	jmp    102919 <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102949:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102950:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102953:	89 d0                	mov    %edx,%eax
  102955:	c1 e0 02             	shl    $0x2,%eax
  102958:	01 d0                	add    %edx,%eax
  10295a:	01 c0                	add    %eax,%eax
  10295c:	01 d8                	add    %ebx,%eax
  10295e:	83 e8 30             	sub    $0x30,%eax
  102961:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102964:	8b 45 10             	mov    0x10(%ebp),%eax
  102967:	0f b6 00             	movzbl (%eax),%eax
  10296a:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  10296d:	83 fb 2f             	cmp    $0x2f,%ebx
  102970:	7e 38                	jle    1029aa <vprintfmt+0xe4>
  102972:	83 fb 39             	cmp    $0x39,%ebx
  102975:	7f 33                	jg     1029aa <vprintfmt+0xe4>
            for (precision = 0; ; ++ fmt) {
  102977:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  10297a:	eb d4                	jmp    102950 <vprintfmt+0x8a>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  10297c:	8b 45 14             	mov    0x14(%ebp),%eax
  10297f:	8d 50 04             	lea    0x4(%eax),%edx
  102982:	89 55 14             	mov    %edx,0x14(%ebp)
  102985:	8b 00                	mov    (%eax),%eax
  102987:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  10298a:	eb 1f                	jmp    1029ab <vprintfmt+0xe5>

        case '.':
            if (width < 0)
  10298c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102990:	79 87                	jns    102919 <vprintfmt+0x53>
                width = 0;
  102992:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102999:	e9 7b ff ff ff       	jmp    102919 <vprintfmt+0x53>

        case '#':
            altflag = 1;
  10299e:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  1029a5:	e9 6f ff ff ff       	jmp    102919 <vprintfmt+0x53>
            goto process_precision;
  1029aa:	90                   	nop

        process_precision:
            if (width < 0)
  1029ab:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1029af:	0f 89 64 ff ff ff    	jns    102919 <vprintfmt+0x53>
                width = precision, precision = -1;
  1029b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1029b8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1029bb:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  1029c2:	e9 52 ff ff ff       	jmp    102919 <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  1029c7:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  1029ca:	e9 4a ff ff ff       	jmp    102919 <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  1029cf:	8b 45 14             	mov    0x14(%ebp),%eax
  1029d2:	8d 50 04             	lea    0x4(%eax),%edx
  1029d5:	89 55 14             	mov    %edx,0x14(%ebp)
  1029d8:	8b 00                	mov    (%eax),%eax
  1029da:	8b 55 0c             	mov    0xc(%ebp),%edx
  1029dd:	89 54 24 04          	mov    %edx,0x4(%esp)
  1029e1:	89 04 24             	mov    %eax,(%esp)
  1029e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1029e7:	ff d0                	call   *%eax
            break;
  1029e9:	e9 a4 02 00 00       	jmp    102c92 <vprintfmt+0x3cc>

        // error message
        case 'e':
            err = va_arg(ap, int);
  1029ee:	8b 45 14             	mov    0x14(%ebp),%eax
  1029f1:	8d 50 04             	lea    0x4(%eax),%edx
  1029f4:	89 55 14             	mov    %edx,0x14(%ebp)
  1029f7:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  1029f9:	85 db                	test   %ebx,%ebx
  1029fb:	79 02                	jns    1029ff <vprintfmt+0x139>
                err = -err;
  1029fd:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  1029ff:	83 fb 06             	cmp    $0x6,%ebx
  102a02:	7f 0b                	jg     102a0f <vprintfmt+0x149>
  102a04:	8b 34 9d 74 39 10 00 	mov    0x103974(,%ebx,4),%esi
  102a0b:	85 f6                	test   %esi,%esi
  102a0d:	75 23                	jne    102a32 <vprintfmt+0x16c>
                printfmt(putch, putdat, "error %d", err);
  102a0f:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102a13:	c7 44 24 08 a1 39 10 	movl   $0x1039a1,0x8(%esp)
  102a1a:	00 
  102a1b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a1e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a22:	8b 45 08             	mov    0x8(%ebp),%eax
  102a25:	89 04 24             	mov    %eax,(%esp)
  102a28:	e8 6a fe ff ff       	call   102897 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102a2d:	e9 60 02 00 00       	jmp    102c92 <vprintfmt+0x3cc>
                printfmt(putch, putdat, "%s", p);
  102a32:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102a36:	c7 44 24 08 aa 39 10 	movl   $0x1039aa,0x8(%esp)
  102a3d:	00 
  102a3e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a41:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a45:	8b 45 08             	mov    0x8(%ebp),%eax
  102a48:	89 04 24             	mov    %eax,(%esp)
  102a4b:	e8 47 fe ff ff       	call   102897 <printfmt>
            break;
  102a50:	e9 3d 02 00 00       	jmp    102c92 <vprintfmt+0x3cc>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102a55:	8b 45 14             	mov    0x14(%ebp),%eax
  102a58:	8d 50 04             	lea    0x4(%eax),%edx
  102a5b:	89 55 14             	mov    %edx,0x14(%ebp)
  102a5e:	8b 30                	mov    (%eax),%esi
  102a60:	85 f6                	test   %esi,%esi
  102a62:	75 05                	jne    102a69 <vprintfmt+0x1a3>
                p = "(null)";
  102a64:	be ad 39 10 00       	mov    $0x1039ad,%esi
            }
            if (width > 0 && padc != '-') {
  102a69:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102a6d:	7e 76                	jle    102ae5 <vprintfmt+0x21f>
  102a6f:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102a73:	74 70                	je     102ae5 <vprintfmt+0x21f>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102a75:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102a78:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a7c:	89 34 24             	mov    %esi,(%esp)
  102a7f:	e8 10 03 00 00       	call   102d94 <strnlen>
  102a84:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102a87:	29 c2                	sub    %eax,%edx
  102a89:	89 d0                	mov    %edx,%eax
  102a8b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102a8e:	eb 16                	jmp    102aa6 <vprintfmt+0x1e0>
                    putch(padc, putdat);
  102a90:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102a94:	8b 55 0c             	mov    0xc(%ebp),%edx
  102a97:	89 54 24 04          	mov    %edx,0x4(%esp)
  102a9b:	89 04 24             	mov    %eax,(%esp)
  102a9e:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa1:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  102aa3:	ff 4d e8             	decl   -0x18(%ebp)
  102aa6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102aaa:	7f e4                	jg     102a90 <vprintfmt+0x1ca>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102aac:	eb 37                	jmp    102ae5 <vprintfmt+0x21f>
                if (altflag && (ch < ' ' || ch > '~')) {
  102aae:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102ab2:	74 1f                	je     102ad3 <vprintfmt+0x20d>
  102ab4:	83 fb 1f             	cmp    $0x1f,%ebx
  102ab7:	7e 05                	jle    102abe <vprintfmt+0x1f8>
  102ab9:	83 fb 7e             	cmp    $0x7e,%ebx
  102abc:	7e 15                	jle    102ad3 <vprintfmt+0x20d>
                    putch('?', putdat);
  102abe:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ac1:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ac5:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102acc:	8b 45 08             	mov    0x8(%ebp),%eax
  102acf:	ff d0                	call   *%eax
  102ad1:	eb 0f                	jmp    102ae2 <vprintfmt+0x21c>
                }
                else {
                    putch(ch, putdat);
  102ad3:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ad6:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ada:	89 1c 24             	mov    %ebx,(%esp)
  102add:	8b 45 08             	mov    0x8(%ebp),%eax
  102ae0:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102ae2:	ff 4d e8             	decl   -0x18(%ebp)
  102ae5:	89 f0                	mov    %esi,%eax
  102ae7:	8d 70 01             	lea    0x1(%eax),%esi
  102aea:	0f b6 00             	movzbl (%eax),%eax
  102aed:	0f be d8             	movsbl %al,%ebx
  102af0:	85 db                	test   %ebx,%ebx
  102af2:	74 27                	je     102b1b <vprintfmt+0x255>
  102af4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102af8:	78 b4                	js     102aae <vprintfmt+0x1e8>
  102afa:	ff 4d e4             	decl   -0x1c(%ebp)
  102afd:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102b01:	79 ab                	jns    102aae <vprintfmt+0x1e8>
                }
            }
            for (; width > 0; width --) {
  102b03:	eb 16                	jmp    102b1b <vprintfmt+0x255>
                putch(' ', putdat);
  102b05:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b08:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b0c:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102b13:	8b 45 08             	mov    0x8(%ebp),%eax
  102b16:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  102b18:	ff 4d e8             	decl   -0x18(%ebp)
  102b1b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102b1f:	7f e4                	jg     102b05 <vprintfmt+0x23f>
            }
            break;
  102b21:	e9 6c 01 00 00       	jmp    102c92 <vprintfmt+0x3cc>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102b26:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102b29:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b2d:	8d 45 14             	lea    0x14(%ebp),%eax
  102b30:	89 04 24             	mov    %eax,(%esp)
  102b33:	e8 18 fd ff ff       	call   102850 <getint>
  102b38:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102b3b:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102b3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b41:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b44:	85 d2                	test   %edx,%edx
  102b46:	79 26                	jns    102b6e <vprintfmt+0x2a8>
                putch('-', putdat);
  102b48:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b4b:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b4f:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102b56:	8b 45 08             	mov    0x8(%ebp),%eax
  102b59:	ff d0                	call   *%eax
                num = -(long long)num;
  102b5b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b5e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b61:	f7 d8                	neg    %eax
  102b63:	83 d2 00             	adc    $0x0,%edx
  102b66:	f7 da                	neg    %edx
  102b68:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102b6b:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102b6e:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102b75:	e9 a8 00 00 00       	jmp    102c22 <vprintfmt+0x35c>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102b7a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102b7d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b81:	8d 45 14             	lea    0x14(%ebp),%eax
  102b84:	89 04 24             	mov    %eax,(%esp)
  102b87:	e8 75 fc ff ff       	call   102801 <getuint>
  102b8c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102b8f:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102b92:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102b99:	e9 84 00 00 00       	jmp    102c22 <vprintfmt+0x35c>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102b9e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102ba1:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ba5:	8d 45 14             	lea    0x14(%ebp),%eax
  102ba8:	89 04 24             	mov    %eax,(%esp)
  102bab:	e8 51 fc ff ff       	call   102801 <getuint>
  102bb0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102bb3:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102bb6:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102bbd:	eb 63                	jmp    102c22 <vprintfmt+0x35c>

        // pointer
        case 'p':
            putch('0', putdat);
  102bbf:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bc2:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bc6:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102bcd:	8b 45 08             	mov    0x8(%ebp),%eax
  102bd0:	ff d0                	call   *%eax
            putch('x', putdat);
  102bd2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bd5:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bd9:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102be0:	8b 45 08             	mov    0x8(%ebp),%eax
  102be3:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102be5:	8b 45 14             	mov    0x14(%ebp),%eax
  102be8:	8d 50 04             	lea    0x4(%eax),%edx
  102beb:	89 55 14             	mov    %edx,0x14(%ebp)
  102bee:	8b 00                	mov    (%eax),%eax
  102bf0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102bf3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102bfa:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102c01:	eb 1f                	jmp    102c22 <vprintfmt+0x35c>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102c03:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c06:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c0a:	8d 45 14             	lea    0x14(%ebp),%eax
  102c0d:	89 04 24             	mov    %eax,(%esp)
  102c10:	e8 ec fb ff ff       	call   102801 <getuint>
  102c15:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c18:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102c1b:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102c22:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102c26:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102c29:	89 54 24 18          	mov    %edx,0x18(%esp)
  102c2d:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102c30:	89 54 24 14          	mov    %edx,0x14(%esp)
  102c34:	89 44 24 10          	mov    %eax,0x10(%esp)
  102c38:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c3b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102c3e:	89 44 24 08          	mov    %eax,0x8(%esp)
  102c42:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102c46:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c49:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c4d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c50:	89 04 24             	mov    %eax,(%esp)
  102c53:	e8 a9 fa ff ff       	call   102701 <printnum>
            break;
  102c58:	eb 38                	jmp    102c92 <vprintfmt+0x3cc>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102c5a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c5d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c61:	89 1c 24             	mov    %ebx,(%esp)
  102c64:	8b 45 08             	mov    0x8(%ebp),%eax
  102c67:	ff d0                	call   *%eax
            break;
  102c69:	eb 27                	jmp    102c92 <vprintfmt+0x3cc>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102c6b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c6e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c72:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  102c79:	8b 45 08             	mov    0x8(%ebp),%eax
  102c7c:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  102c7e:	ff 4d 10             	decl   0x10(%ebp)
  102c81:	eb 03                	jmp    102c86 <vprintfmt+0x3c0>
  102c83:	ff 4d 10             	decl   0x10(%ebp)
  102c86:	8b 45 10             	mov    0x10(%ebp),%eax
  102c89:	48                   	dec    %eax
  102c8a:	0f b6 00             	movzbl (%eax),%eax
  102c8d:	3c 25                	cmp    $0x25,%al
  102c8f:	75 f2                	jne    102c83 <vprintfmt+0x3bd>
                /* do nothing */;
            break;
  102c91:	90                   	nop
    while (1) {
  102c92:	e9 37 fc ff ff       	jmp    1028ce <vprintfmt+0x8>
                return;
  102c97:	90                   	nop
        }
    }
}
  102c98:	83 c4 40             	add    $0x40,%esp
  102c9b:	5b                   	pop    %ebx
  102c9c:	5e                   	pop    %esi
  102c9d:	5d                   	pop    %ebp
  102c9e:	c3                   	ret    

00102c9f <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  102c9f:	55                   	push   %ebp
  102ca0:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  102ca2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ca5:	8b 40 08             	mov    0x8(%eax),%eax
  102ca8:	8d 50 01             	lea    0x1(%eax),%edx
  102cab:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cae:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  102cb1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cb4:	8b 10                	mov    (%eax),%edx
  102cb6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cb9:	8b 40 04             	mov    0x4(%eax),%eax
  102cbc:	39 c2                	cmp    %eax,%edx
  102cbe:	73 12                	jae    102cd2 <sprintputch+0x33>
        *b->buf ++ = ch;
  102cc0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cc3:	8b 00                	mov    (%eax),%eax
  102cc5:	8d 48 01             	lea    0x1(%eax),%ecx
  102cc8:	8b 55 0c             	mov    0xc(%ebp),%edx
  102ccb:	89 0a                	mov    %ecx,(%edx)
  102ccd:	8b 55 08             	mov    0x8(%ebp),%edx
  102cd0:	88 10                	mov    %dl,(%eax)
    }
}
  102cd2:	90                   	nop
  102cd3:	5d                   	pop    %ebp
  102cd4:	c3                   	ret    

00102cd5 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  102cd5:	55                   	push   %ebp
  102cd6:	89 e5                	mov    %esp,%ebp
  102cd8:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  102cdb:	8d 45 14             	lea    0x14(%ebp),%eax
  102cde:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  102ce1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ce4:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102ce8:	8b 45 10             	mov    0x10(%ebp),%eax
  102ceb:	89 44 24 08          	mov    %eax,0x8(%esp)
  102cef:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cf2:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cf6:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf9:	89 04 24             	mov    %eax,(%esp)
  102cfc:	e8 08 00 00 00       	call   102d09 <vsnprintf>
  102d01:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  102d04:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102d07:	c9                   	leave  
  102d08:	c3                   	ret    

00102d09 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  102d09:	55                   	push   %ebp
  102d0a:	89 e5                	mov    %esp,%ebp
  102d0c:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  102d0f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d12:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102d15:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d18:	8d 50 ff             	lea    -0x1(%eax),%edx
  102d1b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d1e:	01 d0                	add    %edx,%eax
  102d20:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d23:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  102d2a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102d2e:	74 0a                	je     102d3a <vsnprintf+0x31>
  102d30:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102d33:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d36:	39 c2                	cmp    %eax,%edx
  102d38:	76 07                	jbe    102d41 <vsnprintf+0x38>
        return -E_INVAL;
  102d3a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  102d3f:	eb 2a                	jmp    102d6b <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  102d41:	8b 45 14             	mov    0x14(%ebp),%eax
  102d44:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102d48:	8b 45 10             	mov    0x10(%ebp),%eax
  102d4b:	89 44 24 08          	mov    %eax,0x8(%esp)
  102d4f:	8d 45 ec             	lea    -0x14(%ebp),%eax
  102d52:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d56:	c7 04 24 9f 2c 10 00 	movl   $0x102c9f,(%esp)
  102d5d:	e8 64 fb ff ff       	call   1028c6 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  102d62:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102d65:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  102d68:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102d6b:	c9                   	leave  
  102d6c:	c3                   	ret    

00102d6d <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102d6d:	55                   	push   %ebp
  102d6e:	89 e5                	mov    %esp,%ebp
  102d70:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102d73:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102d7a:	eb 03                	jmp    102d7f <strlen+0x12>
        cnt ++;
  102d7c:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  102d7f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d82:	8d 50 01             	lea    0x1(%eax),%edx
  102d85:	89 55 08             	mov    %edx,0x8(%ebp)
  102d88:	0f b6 00             	movzbl (%eax),%eax
  102d8b:	84 c0                	test   %al,%al
  102d8d:	75 ed                	jne    102d7c <strlen+0xf>
    }
    return cnt;
  102d8f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102d92:	c9                   	leave  
  102d93:	c3                   	ret    

00102d94 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102d94:	55                   	push   %ebp
  102d95:	89 e5                	mov    %esp,%ebp
  102d97:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102d9a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102da1:	eb 03                	jmp    102da6 <strnlen+0x12>
        cnt ++;
  102da3:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102da6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102da9:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102dac:	73 10                	jae    102dbe <strnlen+0x2a>
  102dae:	8b 45 08             	mov    0x8(%ebp),%eax
  102db1:	8d 50 01             	lea    0x1(%eax),%edx
  102db4:	89 55 08             	mov    %edx,0x8(%ebp)
  102db7:	0f b6 00             	movzbl (%eax),%eax
  102dba:	84 c0                	test   %al,%al
  102dbc:	75 e5                	jne    102da3 <strnlen+0xf>
    }
    return cnt;
  102dbe:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102dc1:	c9                   	leave  
  102dc2:	c3                   	ret    

00102dc3 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102dc3:	55                   	push   %ebp
  102dc4:	89 e5                	mov    %esp,%ebp
  102dc6:	57                   	push   %edi
  102dc7:	56                   	push   %esi
  102dc8:	83 ec 20             	sub    $0x20,%esp
  102dcb:	8b 45 08             	mov    0x8(%ebp),%eax
  102dce:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102dd1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dd4:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102dd7:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102dda:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ddd:	89 d1                	mov    %edx,%ecx
  102ddf:	89 c2                	mov    %eax,%edx
  102de1:	89 ce                	mov    %ecx,%esi
  102de3:	89 d7                	mov    %edx,%edi
  102de5:	ac                   	lods   %ds:(%esi),%al
  102de6:	aa                   	stos   %al,%es:(%edi)
  102de7:	84 c0                	test   %al,%al
  102de9:	75 fa                	jne    102de5 <strcpy+0x22>
  102deb:	89 fa                	mov    %edi,%edx
  102ded:	89 f1                	mov    %esi,%ecx
  102def:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102df2:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102df5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102df8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102dfb:	83 c4 20             	add    $0x20,%esp
  102dfe:	5e                   	pop    %esi
  102dff:	5f                   	pop    %edi
  102e00:	5d                   	pop    %ebp
  102e01:	c3                   	ret    

00102e02 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102e02:	55                   	push   %ebp
  102e03:	89 e5                	mov    %esp,%ebp
  102e05:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102e08:	8b 45 08             	mov    0x8(%ebp),%eax
  102e0b:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102e0e:	eb 1e                	jmp    102e2e <strncpy+0x2c>
        if ((*p = *src) != '\0') {
  102e10:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e13:	0f b6 10             	movzbl (%eax),%edx
  102e16:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102e19:	88 10                	mov    %dl,(%eax)
  102e1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102e1e:	0f b6 00             	movzbl (%eax),%eax
  102e21:	84 c0                	test   %al,%al
  102e23:	74 03                	je     102e28 <strncpy+0x26>
            src ++;
  102e25:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  102e28:	ff 45 fc             	incl   -0x4(%ebp)
  102e2b:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  102e2e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102e32:	75 dc                	jne    102e10 <strncpy+0xe>
    }
    return dst;
  102e34:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102e37:	c9                   	leave  
  102e38:	c3                   	ret    

00102e39 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102e39:	55                   	push   %ebp
  102e3a:	89 e5                	mov    %esp,%ebp
  102e3c:	57                   	push   %edi
  102e3d:	56                   	push   %esi
  102e3e:	83 ec 20             	sub    $0x20,%esp
  102e41:	8b 45 08             	mov    0x8(%ebp),%eax
  102e44:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e47:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e4a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  102e4d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e50:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e53:	89 d1                	mov    %edx,%ecx
  102e55:	89 c2                	mov    %eax,%edx
  102e57:	89 ce                	mov    %ecx,%esi
  102e59:	89 d7                	mov    %edx,%edi
  102e5b:	ac                   	lods   %ds:(%esi),%al
  102e5c:	ae                   	scas   %es:(%edi),%al
  102e5d:	75 08                	jne    102e67 <strcmp+0x2e>
  102e5f:	84 c0                	test   %al,%al
  102e61:	75 f8                	jne    102e5b <strcmp+0x22>
  102e63:	31 c0                	xor    %eax,%eax
  102e65:	eb 04                	jmp    102e6b <strcmp+0x32>
  102e67:	19 c0                	sbb    %eax,%eax
  102e69:	0c 01                	or     $0x1,%al
  102e6b:	89 fa                	mov    %edi,%edx
  102e6d:	89 f1                	mov    %esi,%ecx
  102e6f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102e72:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102e75:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102e78:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102e7b:	83 c4 20             	add    $0x20,%esp
  102e7e:	5e                   	pop    %esi
  102e7f:	5f                   	pop    %edi
  102e80:	5d                   	pop    %ebp
  102e81:	c3                   	ret    

00102e82 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102e82:	55                   	push   %ebp
  102e83:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102e85:	eb 09                	jmp    102e90 <strncmp+0xe>
        n --, s1 ++, s2 ++;
  102e87:	ff 4d 10             	decl   0x10(%ebp)
  102e8a:	ff 45 08             	incl   0x8(%ebp)
  102e8d:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102e90:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102e94:	74 1a                	je     102eb0 <strncmp+0x2e>
  102e96:	8b 45 08             	mov    0x8(%ebp),%eax
  102e99:	0f b6 00             	movzbl (%eax),%eax
  102e9c:	84 c0                	test   %al,%al
  102e9e:	74 10                	je     102eb0 <strncmp+0x2e>
  102ea0:	8b 45 08             	mov    0x8(%ebp),%eax
  102ea3:	0f b6 10             	movzbl (%eax),%edx
  102ea6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ea9:	0f b6 00             	movzbl (%eax),%eax
  102eac:	38 c2                	cmp    %al,%dl
  102eae:	74 d7                	je     102e87 <strncmp+0x5>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102eb0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102eb4:	74 18                	je     102ece <strncmp+0x4c>
  102eb6:	8b 45 08             	mov    0x8(%ebp),%eax
  102eb9:	0f b6 00             	movzbl (%eax),%eax
  102ebc:	0f b6 d0             	movzbl %al,%edx
  102ebf:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ec2:	0f b6 00             	movzbl (%eax),%eax
  102ec5:	0f b6 c0             	movzbl %al,%eax
  102ec8:	29 c2                	sub    %eax,%edx
  102eca:	89 d0                	mov    %edx,%eax
  102ecc:	eb 05                	jmp    102ed3 <strncmp+0x51>
  102ece:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102ed3:	5d                   	pop    %ebp
  102ed4:	c3                   	ret    

00102ed5 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102ed5:	55                   	push   %ebp
  102ed6:	89 e5                	mov    %esp,%ebp
  102ed8:	83 ec 04             	sub    $0x4,%esp
  102edb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ede:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102ee1:	eb 13                	jmp    102ef6 <strchr+0x21>
        if (*s == c) {
  102ee3:	8b 45 08             	mov    0x8(%ebp),%eax
  102ee6:	0f b6 00             	movzbl (%eax),%eax
  102ee9:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102eec:	75 05                	jne    102ef3 <strchr+0x1e>
            return (char *)s;
  102eee:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef1:	eb 12                	jmp    102f05 <strchr+0x30>
        }
        s ++;
  102ef3:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102ef6:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef9:	0f b6 00             	movzbl (%eax),%eax
  102efc:	84 c0                	test   %al,%al
  102efe:	75 e3                	jne    102ee3 <strchr+0xe>
    }
    return NULL;
  102f00:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f05:	c9                   	leave  
  102f06:	c3                   	ret    

00102f07 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102f07:	55                   	push   %ebp
  102f08:	89 e5                	mov    %esp,%ebp
  102f0a:	83 ec 04             	sub    $0x4,%esp
  102f0d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f10:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102f13:	eb 0e                	jmp    102f23 <strfind+0x1c>
        if (*s == c) {
  102f15:	8b 45 08             	mov    0x8(%ebp),%eax
  102f18:	0f b6 00             	movzbl (%eax),%eax
  102f1b:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102f1e:	74 0f                	je     102f2f <strfind+0x28>
            break;
        }
        s ++;
  102f20:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102f23:	8b 45 08             	mov    0x8(%ebp),%eax
  102f26:	0f b6 00             	movzbl (%eax),%eax
  102f29:	84 c0                	test   %al,%al
  102f2b:	75 e8                	jne    102f15 <strfind+0xe>
  102f2d:	eb 01                	jmp    102f30 <strfind+0x29>
            break;
  102f2f:	90                   	nop
    }
    return (char *)s;
  102f30:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102f33:	c9                   	leave  
  102f34:	c3                   	ret    

00102f35 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102f35:	55                   	push   %ebp
  102f36:	89 e5                	mov    %esp,%ebp
  102f38:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102f3b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102f42:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102f49:	eb 03                	jmp    102f4e <strtol+0x19>
        s ++;
  102f4b:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102f4e:	8b 45 08             	mov    0x8(%ebp),%eax
  102f51:	0f b6 00             	movzbl (%eax),%eax
  102f54:	3c 20                	cmp    $0x20,%al
  102f56:	74 f3                	je     102f4b <strtol+0x16>
  102f58:	8b 45 08             	mov    0x8(%ebp),%eax
  102f5b:	0f b6 00             	movzbl (%eax),%eax
  102f5e:	3c 09                	cmp    $0x9,%al
  102f60:	74 e9                	je     102f4b <strtol+0x16>
    }

    // plus/minus sign
    if (*s == '+') {
  102f62:	8b 45 08             	mov    0x8(%ebp),%eax
  102f65:	0f b6 00             	movzbl (%eax),%eax
  102f68:	3c 2b                	cmp    $0x2b,%al
  102f6a:	75 05                	jne    102f71 <strtol+0x3c>
        s ++;
  102f6c:	ff 45 08             	incl   0x8(%ebp)
  102f6f:	eb 14                	jmp    102f85 <strtol+0x50>
    }
    else if (*s == '-') {
  102f71:	8b 45 08             	mov    0x8(%ebp),%eax
  102f74:	0f b6 00             	movzbl (%eax),%eax
  102f77:	3c 2d                	cmp    $0x2d,%al
  102f79:	75 0a                	jne    102f85 <strtol+0x50>
        s ++, neg = 1;
  102f7b:	ff 45 08             	incl   0x8(%ebp)
  102f7e:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102f85:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102f89:	74 06                	je     102f91 <strtol+0x5c>
  102f8b:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102f8f:	75 22                	jne    102fb3 <strtol+0x7e>
  102f91:	8b 45 08             	mov    0x8(%ebp),%eax
  102f94:	0f b6 00             	movzbl (%eax),%eax
  102f97:	3c 30                	cmp    $0x30,%al
  102f99:	75 18                	jne    102fb3 <strtol+0x7e>
  102f9b:	8b 45 08             	mov    0x8(%ebp),%eax
  102f9e:	40                   	inc    %eax
  102f9f:	0f b6 00             	movzbl (%eax),%eax
  102fa2:	3c 78                	cmp    $0x78,%al
  102fa4:	75 0d                	jne    102fb3 <strtol+0x7e>
        s += 2, base = 16;
  102fa6:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102faa:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102fb1:	eb 29                	jmp    102fdc <strtol+0xa7>
    }
    else if (base == 0 && s[0] == '0') {
  102fb3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102fb7:	75 16                	jne    102fcf <strtol+0x9a>
  102fb9:	8b 45 08             	mov    0x8(%ebp),%eax
  102fbc:	0f b6 00             	movzbl (%eax),%eax
  102fbf:	3c 30                	cmp    $0x30,%al
  102fc1:	75 0c                	jne    102fcf <strtol+0x9a>
        s ++, base = 8;
  102fc3:	ff 45 08             	incl   0x8(%ebp)
  102fc6:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102fcd:	eb 0d                	jmp    102fdc <strtol+0xa7>
    }
    else if (base == 0) {
  102fcf:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102fd3:	75 07                	jne    102fdc <strtol+0xa7>
        base = 10;
  102fd5:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102fdc:	8b 45 08             	mov    0x8(%ebp),%eax
  102fdf:	0f b6 00             	movzbl (%eax),%eax
  102fe2:	3c 2f                	cmp    $0x2f,%al
  102fe4:	7e 1b                	jle    103001 <strtol+0xcc>
  102fe6:	8b 45 08             	mov    0x8(%ebp),%eax
  102fe9:	0f b6 00             	movzbl (%eax),%eax
  102fec:	3c 39                	cmp    $0x39,%al
  102fee:	7f 11                	jg     103001 <strtol+0xcc>
            dig = *s - '0';
  102ff0:	8b 45 08             	mov    0x8(%ebp),%eax
  102ff3:	0f b6 00             	movzbl (%eax),%eax
  102ff6:	0f be c0             	movsbl %al,%eax
  102ff9:	83 e8 30             	sub    $0x30,%eax
  102ffc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102fff:	eb 48                	jmp    103049 <strtol+0x114>
        }
        else if (*s >= 'a' && *s <= 'z') {
  103001:	8b 45 08             	mov    0x8(%ebp),%eax
  103004:	0f b6 00             	movzbl (%eax),%eax
  103007:	3c 60                	cmp    $0x60,%al
  103009:	7e 1b                	jle    103026 <strtol+0xf1>
  10300b:	8b 45 08             	mov    0x8(%ebp),%eax
  10300e:	0f b6 00             	movzbl (%eax),%eax
  103011:	3c 7a                	cmp    $0x7a,%al
  103013:	7f 11                	jg     103026 <strtol+0xf1>
            dig = *s - 'a' + 10;
  103015:	8b 45 08             	mov    0x8(%ebp),%eax
  103018:	0f b6 00             	movzbl (%eax),%eax
  10301b:	0f be c0             	movsbl %al,%eax
  10301e:	83 e8 57             	sub    $0x57,%eax
  103021:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103024:	eb 23                	jmp    103049 <strtol+0x114>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  103026:	8b 45 08             	mov    0x8(%ebp),%eax
  103029:	0f b6 00             	movzbl (%eax),%eax
  10302c:	3c 40                	cmp    $0x40,%al
  10302e:	7e 3b                	jle    10306b <strtol+0x136>
  103030:	8b 45 08             	mov    0x8(%ebp),%eax
  103033:	0f b6 00             	movzbl (%eax),%eax
  103036:	3c 5a                	cmp    $0x5a,%al
  103038:	7f 31                	jg     10306b <strtol+0x136>
            dig = *s - 'A' + 10;
  10303a:	8b 45 08             	mov    0x8(%ebp),%eax
  10303d:	0f b6 00             	movzbl (%eax),%eax
  103040:	0f be c0             	movsbl %al,%eax
  103043:	83 e8 37             	sub    $0x37,%eax
  103046:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  103049:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10304c:	3b 45 10             	cmp    0x10(%ebp),%eax
  10304f:	7d 19                	jge    10306a <strtol+0x135>
            break;
        }
        s ++, val = (val * base) + dig;
  103051:	ff 45 08             	incl   0x8(%ebp)
  103054:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103057:	0f af 45 10          	imul   0x10(%ebp),%eax
  10305b:	89 c2                	mov    %eax,%edx
  10305d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103060:	01 d0                	add    %edx,%eax
  103062:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  103065:	e9 72 ff ff ff       	jmp    102fdc <strtol+0xa7>
            break;
  10306a:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  10306b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10306f:	74 08                	je     103079 <strtol+0x144>
        *endptr = (char *) s;
  103071:	8b 45 0c             	mov    0xc(%ebp),%eax
  103074:	8b 55 08             	mov    0x8(%ebp),%edx
  103077:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  103079:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  10307d:	74 07                	je     103086 <strtol+0x151>
  10307f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103082:	f7 d8                	neg    %eax
  103084:	eb 03                	jmp    103089 <strtol+0x154>
  103086:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  103089:	c9                   	leave  
  10308a:	c3                   	ret    

0010308b <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  10308b:	55                   	push   %ebp
  10308c:	89 e5                	mov    %esp,%ebp
  10308e:	57                   	push   %edi
  10308f:	83 ec 24             	sub    $0x24,%esp
  103092:	8b 45 0c             	mov    0xc(%ebp),%eax
  103095:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  103098:	0f be 55 d8          	movsbl -0x28(%ebp),%edx
  10309c:	8b 45 08             	mov    0x8(%ebp),%eax
  10309f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1030a2:	88 55 f7             	mov    %dl,-0x9(%ebp)
  1030a5:	8b 45 10             	mov    0x10(%ebp),%eax
  1030a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  1030ab:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  1030ae:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  1030b2:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1030b5:	89 d7                	mov    %edx,%edi
  1030b7:	f3 aa                	rep stos %al,%es:(%edi)
  1030b9:	89 fa                	mov    %edi,%edx
  1030bb:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  1030be:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  1030c1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  1030c4:	83 c4 24             	add    $0x24,%esp
  1030c7:	5f                   	pop    %edi
  1030c8:	5d                   	pop    %ebp
  1030c9:	c3                   	ret    

001030ca <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  1030ca:	55                   	push   %ebp
  1030cb:	89 e5                	mov    %esp,%ebp
  1030cd:	57                   	push   %edi
  1030ce:	56                   	push   %esi
  1030cf:	53                   	push   %ebx
  1030d0:	83 ec 30             	sub    $0x30,%esp
  1030d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030d9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1030df:	8b 45 10             	mov    0x10(%ebp),%eax
  1030e2:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  1030e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1030e8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1030eb:	73 42                	jae    10312f <memmove+0x65>
  1030ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1030f0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1030f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1030f6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1030f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1030fc:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1030ff:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103102:	c1 e8 02             	shr    $0x2,%eax
  103105:	89 c1                	mov    %eax,%ecx
    asm volatile (
  103107:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10310a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10310d:	89 d7                	mov    %edx,%edi
  10310f:	89 c6                	mov    %eax,%esi
  103111:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103113:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  103116:	83 e1 03             	and    $0x3,%ecx
  103119:	74 02                	je     10311d <memmove+0x53>
  10311b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10311d:	89 f0                	mov    %esi,%eax
  10311f:	89 fa                	mov    %edi,%edx
  103121:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  103124:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  103127:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  10312a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  10312d:	eb 36                	jmp    103165 <memmove+0x9b>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  10312f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103132:	8d 50 ff             	lea    -0x1(%eax),%edx
  103135:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103138:	01 c2                	add    %eax,%edx
  10313a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10313d:	8d 48 ff             	lea    -0x1(%eax),%ecx
  103140:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103143:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  103146:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103149:	89 c1                	mov    %eax,%ecx
  10314b:	89 d8                	mov    %ebx,%eax
  10314d:	89 d6                	mov    %edx,%esi
  10314f:	89 c7                	mov    %eax,%edi
  103151:	fd                   	std    
  103152:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103154:	fc                   	cld    
  103155:	89 f8                	mov    %edi,%eax
  103157:	89 f2                	mov    %esi,%edx
  103159:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  10315c:	89 55 c8             	mov    %edx,-0x38(%ebp)
  10315f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  103162:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  103165:	83 c4 30             	add    $0x30,%esp
  103168:	5b                   	pop    %ebx
  103169:	5e                   	pop    %esi
  10316a:	5f                   	pop    %edi
  10316b:	5d                   	pop    %ebp
  10316c:	c3                   	ret    

0010316d <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  10316d:	55                   	push   %ebp
  10316e:	89 e5                	mov    %esp,%ebp
  103170:	57                   	push   %edi
  103171:	56                   	push   %esi
  103172:	83 ec 20             	sub    $0x20,%esp
  103175:	8b 45 08             	mov    0x8(%ebp),%eax
  103178:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10317b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10317e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103181:	8b 45 10             	mov    0x10(%ebp),%eax
  103184:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103187:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10318a:	c1 e8 02             	shr    $0x2,%eax
  10318d:	89 c1                	mov    %eax,%ecx
    asm volatile (
  10318f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103192:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103195:	89 d7                	mov    %edx,%edi
  103197:	89 c6                	mov    %eax,%esi
  103199:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10319b:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  10319e:	83 e1 03             	and    $0x3,%ecx
  1031a1:	74 02                	je     1031a5 <memcpy+0x38>
  1031a3:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1031a5:	89 f0                	mov    %esi,%eax
  1031a7:	89 fa                	mov    %edi,%edx
  1031a9:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1031ac:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1031af:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  1031b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  1031b5:	83 c4 20             	add    $0x20,%esp
  1031b8:	5e                   	pop    %esi
  1031b9:	5f                   	pop    %edi
  1031ba:	5d                   	pop    %ebp
  1031bb:	c3                   	ret    

001031bc <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  1031bc:	55                   	push   %ebp
  1031bd:	89 e5                	mov    %esp,%ebp
  1031bf:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  1031c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1031c5:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  1031c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031cb:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  1031ce:	eb 2e                	jmp    1031fe <memcmp+0x42>
        if (*s1 != *s2) {
  1031d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1031d3:	0f b6 10             	movzbl (%eax),%edx
  1031d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1031d9:	0f b6 00             	movzbl (%eax),%eax
  1031dc:	38 c2                	cmp    %al,%dl
  1031de:	74 18                	je     1031f8 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  1031e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1031e3:	0f b6 00             	movzbl (%eax),%eax
  1031e6:	0f b6 d0             	movzbl %al,%edx
  1031e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1031ec:	0f b6 00             	movzbl (%eax),%eax
  1031ef:	0f b6 c0             	movzbl %al,%eax
  1031f2:	29 c2                	sub    %eax,%edx
  1031f4:	89 d0                	mov    %edx,%eax
  1031f6:	eb 18                	jmp    103210 <memcmp+0x54>
        }
        s1 ++, s2 ++;
  1031f8:	ff 45 fc             	incl   -0x4(%ebp)
  1031fb:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  1031fe:	8b 45 10             	mov    0x10(%ebp),%eax
  103201:	8d 50 ff             	lea    -0x1(%eax),%edx
  103204:	89 55 10             	mov    %edx,0x10(%ebp)
  103207:	85 c0                	test   %eax,%eax
  103209:	75 c5                	jne    1031d0 <memcmp+0x14>
    }
    return 0;
  10320b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103210:	c9                   	leave  
  103211:	c3                   	ret    
