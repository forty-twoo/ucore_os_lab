
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
  100023:	e8 19 31 00 00       	call   103141 <memset>

    cons_init();                // init the console
  100028:	e8 52 15 00 00       	call   10157f <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002d:	c7 45 f4 e0 32 10 00 	movl   $0x1032e0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100034:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100037:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003b:	c7 04 24 fc 32 10 00 	movl   $0x1032fc,(%esp)
  100042:	e8 c6 02 00 00       	call   10030d <cprintf>

    print_kerninfo();
  100047:	e8 d8 07 00 00       	call   100824 <print_kerninfo>

    grade_backtrace();
  10004c:	e8 89 00 00 00       	call   1000da <grade_backtrace>

    pmm_init();                 // init physical memory management
  100051:	e8 56 27 00 00       	call   1027ac <pmm_init>

    pic_init();                 // init interrupt controller
  100056:	e8 75 16 00 00       	call   1016d0 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005b:	e8 d5 17 00 00       	call   101835 <idt_init>

    clock_init();               // init clock interrupt
  100060:	e8 db 0c 00 00       	call   100d40 <clock_init>
    intr_enable();              // enable irq interrupt
  100065:	e8 c8 15 00 00       	call   101632 <intr_enable>
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
  100089:	e8 d1 0b 00 00       	call   100c5f <mon_backtrace>
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
  100128:	c7 04 24 01 33 10 00 	movl   $0x103301,(%esp)
  10012f:	e8 d9 01 00 00       	call   10030d <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100134:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100138:	89 c2                	mov    %eax,%edx
  10013a:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10013f:	89 54 24 08          	mov    %edx,0x8(%esp)
  100143:	89 44 24 04          	mov    %eax,0x4(%esp)
  100147:	c7 04 24 0f 33 10 00 	movl   $0x10330f,(%esp)
  10014e:	e8 ba 01 00 00       	call   10030d <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100153:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100157:	89 c2                	mov    %eax,%edx
  100159:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10015e:	89 54 24 08          	mov    %edx,0x8(%esp)
  100162:	89 44 24 04          	mov    %eax,0x4(%esp)
  100166:	c7 04 24 1d 33 10 00 	movl   $0x10331d,(%esp)
  10016d:	e8 9b 01 00 00       	call   10030d <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100172:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100176:	89 c2                	mov    %eax,%edx
  100178:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10017d:	89 54 24 08          	mov    %edx,0x8(%esp)
  100181:	89 44 24 04          	mov    %eax,0x4(%esp)
  100185:	c7 04 24 2b 33 10 00 	movl   $0x10332b,(%esp)
  10018c:	e8 7c 01 00 00       	call   10030d <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  100191:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  100195:	89 c2                	mov    %eax,%edx
  100197:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10019c:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001a4:	c7 04 24 39 33 10 00 	movl   $0x103339,(%esp)
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
  1001d5:	c7 04 24 48 33 10 00 	movl   $0x103348,(%esp)
  1001dc:	e8 2c 01 00 00       	call   10030d <cprintf>
    lab1_switch_to_user();
  1001e1:	e8 d8 ff ff ff       	call   1001be <lab1_switch_to_user>
    lab1_print_cur_status();
  1001e6:	e8 15 ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001eb:	c7 04 24 68 33 10 00 	movl   $0x103368,(%esp)
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
  100217:	c7 04 24 87 33 10 00 	movl   $0x103387,(%esp)
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
  1002c5:	e8 e2 12 00 00       	call   1015ac <cons_putc>
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
  100303:	e8 74 26 00 00       	call   10297c <vprintfmt>
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
  10033f:	e8 68 12 00 00       	call   1015ac <cons_putc>
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
  10039d:	e8 34 12 00 00       	call   1015d6 <cons_getc>
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
  100507:	c7 00 8c 33 10 00    	movl   $0x10338c,(%eax)
    info->eip_line = 0;
  10050d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100510:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100517:	8b 45 0c             	mov    0xc(%ebp),%eax
  10051a:	c7 40 08 8c 33 10 00 	movl   $0x10338c,0x8(%eax)
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
  10053e:	c7 45 f4 ec 3b 10 00 	movl   $0x103bec,-0xc(%ebp)
    stab_end = __STAB_END__;
  100545:	c7 45 f0 a8 c7 10 00 	movl   $0x10c7a8,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10054c:	c7 45 ec a9 c7 10 00 	movl   $0x10c7a9,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100553:	c7 45 e8 93 e8 10 00 	movl   $0x10e893,-0x18(%ebp)

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
  1006a6:	e8 12 29 00 00       	call   102fbd <strfind>
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
  10082a:	c7 04 24 96 33 10 00 	movl   $0x103396,(%esp)
  100831:	e8 d7 fa ff ff       	call   10030d <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100836:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10083d:	00 
  10083e:	c7 04 24 af 33 10 00 	movl   $0x1033af,(%esp)
  100845:	e8 c3 fa ff ff       	call   10030d <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  10084a:	c7 44 24 04 c8 32 10 	movl   $0x1032c8,0x4(%esp)
  100851:	00 
  100852:	c7 04 24 c7 33 10 00 	movl   $0x1033c7,(%esp)
  100859:	e8 af fa ff ff       	call   10030d <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  10085e:	c7 44 24 04 16 fa 10 	movl   $0x10fa16,0x4(%esp)
  100865:	00 
  100866:	c7 04 24 df 33 10 00 	movl   $0x1033df,(%esp)
  10086d:	e8 9b fa ff ff       	call   10030d <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100872:	c7 44 24 04 20 0d 11 	movl   $0x110d20,0x4(%esp)
  100879:	00 
  10087a:	c7 04 24 f7 33 10 00 	movl   $0x1033f7,(%esp)
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
  1008a7:	c7 04 24 10 34 10 00 	movl   $0x103410,(%esp)
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
  1008dc:	c7 04 24 3a 34 10 00 	movl   $0x10343a,(%esp)
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
  10094a:	c7 04 24 56 34 10 00 	movl   $0x103456,(%esp)
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
  10096d:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100970:	89 e8                	mov    %ebp,%eax
  100972:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100975:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t ebp = read_ebp(), eip = read_eip();
  100978:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10097b:	e8 d9 ff ff ff       	call   100959 <read_eip>
  100980:	89 45 f0             	mov    %eax,-0x10(%ebp)
    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  100983:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  10098a:	e9 84 00 00 00       	jmp    100a13 <print_stackframe+0xa9>
        cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
  10098f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100992:	89 44 24 08          	mov    %eax,0x8(%esp)
  100996:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100999:	89 44 24 04          	mov    %eax,0x4(%esp)
  10099d:	c7 04 24 68 34 10 00 	movl   $0x103468,(%esp)
  1009a4:	e8 64 f9 ff ff       	call   10030d <cprintf>
        uint32_t *args = (uint32_t *)ebp + 2;
  1009a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009ac:	83 c0 08             	add    $0x8,%eax
  1009af:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        for (j = 0; j < 4; j ++) {
  1009b2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  1009b9:	eb 24                	jmp    1009df <print_stackframe+0x75>
            cprintf("0x%08x ", args[j]);
  1009bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009be:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  1009c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1009c8:	01 d0                	add    %edx,%eax
  1009ca:	8b 00                	mov    (%eax),%eax
  1009cc:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009d0:	c7 04 24 84 34 10 00 	movl   $0x103484,(%esp)
  1009d7:	e8 31 f9 ff ff       	call   10030d <cprintf>
        for (j = 0; j < 4; j ++) {
  1009dc:	ff 45 e8             	incl   -0x18(%ebp)
  1009df:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  1009e3:	7e d6                	jle    1009bb <print_stackframe+0x51>
        }
        cprintf("\n");
  1009e5:	c7 04 24 8c 34 10 00 	movl   $0x10348c,(%esp)
  1009ec:	e8 1c f9 ff ff       	call   10030d <cprintf>
        print_debuginfo(eip-1);
  1009f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009f4:	48                   	dec    %eax
  1009f5:	89 04 24             	mov    %eax,(%esp)
  1009f8:	e8 b9 fe ff ff       	call   1008b6 <print_debuginfo>
        eip = ((uint32_t *)ebp)[1];
  1009fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a00:	83 c0 04             	add    $0x4,%eax
  100a03:	8b 00                	mov    (%eax),%eax
  100a05:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp = ((uint32_t *)ebp)[0];
  100a08:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a0b:	8b 00                	mov    (%eax),%eax
  100a0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  100a10:	ff 45 ec             	incl   -0x14(%ebp)
  100a13:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a17:	74 0a                	je     100a23 <print_stackframe+0xb9>
  100a19:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100a1d:	0f 8e 6c ff ff ff    	jle    10098f <print_stackframe+0x25>
    }
}
  100a23:	90                   	nop
  100a24:	c9                   	leave  
  100a25:	c3                   	ret    

00100a26 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a26:	55                   	push   %ebp
  100a27:	89 e5                	mov    %esp,%ebp
  100a29:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a2c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a33:	eb 0c                	jmp    100a41 <parse+0x1b>
            *buf ++ = '\0';
  100a35:	8b 45 08             	mov    0x8(%ebp),%eax
  100a38:	8d 50 01             	lea    0x1(%eax),%edx
  100a3b:	89 55 08             	mov    %edx,0x8(%ebp)
  100a3e:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a41:	8b 45 08             	mov    0x8(%ebp),%eax
  100a44:	0f b6 00             	movzbl (%eax),%eax
  100a47:	84 c0                	test   %al,%al
  100a49:	74 1d                	je     100a68 <parse+0x42>
  100a4b:	8b 45 08             	mov    0x8(%ebp),%eax
  100a4e:	0f b6 00             	movzbl (%eax),%eax
  100a51:	0f be c0             	movsbl %al,%eax
  100a54:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a58:	c7 04 24 10 35 10 00 	movl   $0x103510,(%esp)
  100a5f:	e8 27 25 00 00       	call   102f8b <strchr>
  100a64:	85 c0                	test   %eax,%eax
  100a66:	75 cd                	jne    100a35 <parse+0xf>
        }
        if (*buf == '\0') {
  100a68:	8b 45 08             	mov    0x8(%ebp),%eax
  100a6b:	0f b6 00             	movzbl (%eax),%eax
  100a6e:	84 c0                	test   %al,%al
  100a70:	74 65                	je     100ad7 <parse+0xb1>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100a72:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100a76:	75 14                	jne    100a8c <parse+0x66>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100a78:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100a7f:	00 
  100a80:	c7 04 24 15 35 10 00 	movl   $0x103515,(%esp)
  100a87:	e8 81 f8 ff ff       	call   10030d <cprintf>
        }
        argv[argc ++] = buf;
  100a8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a8f:	8d 50 01             	lea    0x1(%eax),%edx
  100a92:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100a95:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100a9c:	8b 45 0c             	mov    0xc(%ebp),%eax
  100a9f:	01 c2                	add    %eax,%edx
  100aa1:	8b 45 08             	mov    0x8(%ebp),%eax
  100aa4:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100aa6:	eb 03                	jmp    100aab <parse+0x85>
            buf ++;
  100aa8:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100aab:	8b 45 08             	mov    0x8(%ebp),%eax
  100aae:	0f b6 00             	movzbl (%eax),%eax
  100ab1:	84 c0                	test   %al,%al
  100ab3:	74 8c                	je     100a41 <parse+0x1b>
  100ab5:	8b 45 08             	mov    0x8(%ebp),%eax
  100ab8:	0f b6 00             	movzbl (%eax),%eax
  100abb:	0f be c0             	movsbl %al,%eax
  100abe:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ac2:	c7 04 24 10 35 10 00 	movl   $0x103510,(%esp)
  100ac9:	e8 bd 24 00 00       	call   102f8b <strchr>
  100ace:	85 c0                	test   %eax,%eax
  100ad0:	74 d6                	je     100aa8 <parse+0x82>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100ad2:	e9 6a ff ff ff       	jmp    100a41 <parse+0x1b>
            break;
  100ad7:	90                   	nop
        }
    }
    return argc;
  100ad8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100adb:	c9                   	leave  
  100adc:	c3                   	ret    

00100add <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100add:	55                   	push   %ebp
  100ade:	89 e5                	mov    %esp,%ebp
  100ae0:	53                   	push   %ebx
  100ae1:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100ae4:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100ae7:	89 44 24 04          	mov    %eax,0x4(%esp)
  100aeb:	8b 45 08             	mov    0x8(%ebp),%eax
  100aee:	89 04 24             	mov    %eax,(%esp)
  100af1:	e8 30 ff ff ff       	call   100a26 <parse>
  100af6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100af9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100afd:	75 0a                	jne    100b09 <runcmd+0x2c>
        return 0;
  100aff:	b8 00 00 00 00       	mov    $0x0,%eax
  100b04:	e9 83 00 00 00       	jmp    100b8c <runcmd+0xaf>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b09:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b10:	eb 5a                	jmp    100b6c <runcmd+0x8f>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b12:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b15:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b18:	89 d0                	mov    %edx,%eax
  100b1a:	01 c0                	add    %eax,%eax
  100b1c:	01 d0                	add    %edx,%eax
  100b1e:	c1 e0 02             	shl    $0x2,%eax
  100b21:	05 00 f0 10 00       	add    $0x10f000,%eax
  100b26:	8b 00                	mov    (%eax),%eax
  100b28:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100b2c:	89 04 24             	mov    %eax,(%esp)
  100b2f:	e8 bb 23 00 00       	call   102eef <strcmp>
  100b34:	85 c0                	test   %eax,%eax
  100b36:	75 31                	jne    100b69 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b38:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b3b:	89 d0                	mov    %edx,%eax
  100b3d:	01 c0                	add    %eax,%eax
  100b3f:	01 d0                	add    %edx,%eax
  100b41:	c1 e0 02             	shl    $0x2,%eax
  100b44:	05 08 f0 10 00       	add    $0x10f008,%eax
  100b49:	8b 10                	mov    (%eax),%edx
  100b4b:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b4e:	83 c0 04             	add    $0x4,%eax
  100b51:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100b54:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100b57:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100b5a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100b5e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b62:	89 1c 24             	mov    %ebx,(%esp)
  100b65:	ff d2                	call   *%edx
  100b67:	eb 23                	jmp    100b8c <runcmd+0xaf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100b69:	ff 45 f4             	incl   -0xc(%ebp)
  100b6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b6f:	83 f8 02             	cmp    $0x2,%eax
  100b72:	76 9e                	jbe    100b12 <runcmd+0x35>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100b74:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100b77:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b7b:	c7 04 24 33 35 10 00 	movl   $0x103533,(%esp)
  100b82:	e8 86 f7 ff ff       	call   10030d <cprintf>
    return 0;
  100b87:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100b8c:	83 c4 64             	add    $0x64,%esp
  100b8f:	5b                   	pop    %ebx
  100b90:	5d                   	pop    %ebp
  100b91:	c3                   	ret    

00100b92 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100b92:	55                   	push   %ebp
  100b93:	89 e5                	mov    %esp,%ebp
  100b95:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100b98:	c7 04 24 4c 35 10 00 	movl   $0x10354c,(%esp)
  100b9f:	e8 69 f7 ff ff       	call   10030d <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100ba4:	c7 04 24 74 35 10 00 	movl   $0x103574,(%esp)
  100bab:	e8 5d f7 ff ff       	call   10030d <cprintf>

    if (tf != NULL) {
  100bb0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100bb4:	74 0b                	je     100bc1 <kmonitor+0x2f>
        print_trapframe(tf);
  100bb6:	8b 45 08             	mov    0x8(%ebp),%eax
  100bb9:	89 04 24             	mov    %eax,(%esp)
  100bbc:	e8 c0 0c 00 00       	call   101881 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100bc1:	c7 04 24 99 35 10 00 	movl   $0x103599,(%esp)
  100bc8:	e8 37 f6 ff ff       	call   100204 <readline>
  100bcd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100bd0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100bd4:	74 eb                	je     100bc1 <kmonitor+0x2f>
            if (runcmd(buf, tf) < 0) {
  100bd6:	8b 45 08             	mov    0x8(%ebp),%eax
  100bd9:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100be0:	89 04 24             	mov    %eax,(%esp)
  100be3:	e8 f5 fe ff ff       	call   100add <runcmd>
  100be8:	85 c0                	test   %eax,%eax
  100bea:	78 02                	js     100bee <kmonitor+0x5c>
        if ((buf = readline("K> ")) != NULL) {
  100bec:	eb d3                	jmp    100bc1 <kmonitor+0x2f>
                break;
  100bee:	90                   	nop
            }
        }
    }
}
  100bef:	90                   	nop
  100bf0:	c9                   	leave  
  100bf1:	c3                   	ret    

00100bf2 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100bf2:	55                   	push   %ebp
  100bf3:	89 e5                	mov    %esp,%ebp
  100bf5:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100bf8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100bff:	eb 3d                	jmp    100c3e <mon_help+0x4c>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c01:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c04:	89 d0                	mov    %edx,%eax
  100c06:	01 c0                	add    %eax,%eax
  100c08:	01 d0                	add    %edx,%eax
  100c0a:	c1 e0 02             	shl    $0x2,%eax
  100c0d:	05 04 f0 10 00       	add    $0x10f004,%eax
  100c12:	8b 08                	mov    (%eax),%ecx
  100c14:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c17:	89 d0                	mov    %edx,%eax
  100c19:	01 c0                	add    %eax,%eax
  100c1b:	01 d0                	add    %edx,%eax
  100c1d:	c1 e0 02             	shl    $0x2,%eax
  100c20:	05 00 f0 10 00       	add    $0x10f000,%eax
  100c25:	8b 00                	mov    (%eax),%eax
  100c27:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c2b:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c2f:	c7 04 24 9d 35 10 00 	movl   $0x10359d,(%esp)
  100c36:	e8 d2 f6 ff ff       	call   10030d <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100c3b:	ff 45 f4             	incl   -0xc(%ebp)
  100c3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c41:	83 f8 02             	cmp    $0x2,%eax
  100c44:	76 bb                	jbe    100c01 <mon_help+0xf>
    }
    return 0;
  100c46:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c4b:	c9                   	leave  
  100c4c:	c3                   	ret    

00100c4d <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c4d:	55                   	push   %ebp
  100c4e:	89 e5                	mov    %esp,%ebp
  100c50:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c53:	e8 cc fb ff ff       	call   100824 <print_kerninfo>
    return 0;
  100c58:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c5d:	c9                   	leave  
  100c5e:	c3                   	ret    

00100c5f <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c5f:	55                   	push   %ebp
  100c60:	89 e5                	mov    %esp,%ebp
  100c62:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c65:	e8 00 fd ff ff       	call   10096a <print_stackframe>
    return 0;
  100c6a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c6f:	c9                   	leave  
  100c70:	c3                   	ret    

00100c71 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100c71:	55                   	push   %ebp
  100c72:	89 e5                	mov    %esp,%ebp
  100c74:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100c77:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  100c7c:	85 c0                	test   %eax,%eax
  100c7e:	75 5b                	jne    100cdb <__panic+0x6a>
        goto panic_dead;
    }
    is_panic = 1;
  100c80:	c7 05 40 fe 10 00 01 	movl   $0x1,0x10fe40
  100c87:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100c8a:	8d 45 14             	lea    0x14(%ebp),%eax
  100c8d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100c90:	8b 45 0c             	mov    0xc(%ebp),%eax
  100c93:	89 44 24 08          	mov    %eax,0x8(%esp)
  100c97:	8b 45 08             	mov    0x8(%ebp),%eax
  100c9a:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c9e:	c7 04 24 a6 35 10 00 	movl   $0x1035a6,(%esp)
  100ca5:	e8 63 f6 ff ff       	call   10030d <cprintf>
    vcprintf(fmt, ap);
  100caa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cad:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cb1:	8b 45 10             	mov    0x10(%ebp),%eax
  100cb4:	89 04 24             	mov    %eax,(%esp)
  100cb7:	e8 1e f6 ff ff       	call   1002da <vcprintf>
    cprintf("\n");
  100cbc:	c7 04 24 c2 35 10 00 	movl   $0x1035c2,(%esp)
  100cc3:	e8 45 f6 ff ff       	call   10030d <cprintf>
    
    cprintf("stack trackback:\n");
  100cc8:	c7 04 24 c4 35 10 00 	movl   $0x1035c4,(%esp)
  100ccf:	e8 39 f6 ff ff       	call   10030d <cprintf>
    print_stackframe();
  100cd4:	e8 91 fc ff ff       	call   10096a <print_stackframe>
  100cd9:	eb 01                	jmp    100cdc <__panic+0x6b>
        goto panic_dead;
  100cdb:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  100cdc:	e8 59 09 00 00       	call   10163a <intr_disable>
    while (1) {
        kmonitor(NULL);
  100ce1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100ce8:	e8 a5 fe ff ff       	call   100b92 <kmonitor>
  100ced:	eb f2                	jmp    100ce1 <__panic+0x70>

00100cef <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100cef:	55                   	push   %ebp
  100cf0:	89 e5                	mov    %esp,%ebp
  100cf2:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100cf5:	8d 45 14             	lea    0x14(%ebp),%eax
  100cf8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100cfb:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cfe:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d02:	8b 45 08             	mov    0x8(%ebp),%eax
  100d05:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d09:	c7 04 24 d6 35 10 00 	movl   $0x1035d6,(%esp)
  100d10:	e8 f8 f5 ff ff       	call   10030d <cprintf>
    vcprintf(fmt, ap);
  100d15:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d18:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d1c:	8b 45 10             	mov    0x10(%ebp),%eax
  100d1f:	89 04 24             	mov    %eax,(%esp)
  100d22:	e8 b3 f5 ff ff       	call   1002da <vcprintf>
    cprintf("\n");
  100d27:	c7 04 24 c2 35 10 00 	movl   $0x1035c2,(%esp)
  100d2e:	e8 da f5 ff ff       	call   10030d <cprintf>
    va_end(ap);
}
  100d33:	90                   	nop
  100d34:	c9                   	leave  
  100d35:	c3                   	ret    

00100d36 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d36:	55                   	push   %ebp
  100d37:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d39:	a1 40 fe 10 00       	mov    0x10fe40,%eax
}
  100d3e:	5d                   	pop    %ebp
  100d3f:	c3                   	ret    

00100d40 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d40:	55                   	push   %ebp
  100d41:	89 e5                	mov    %esp,%ebp
  100d43:	83 ec 28             	sub    $0x28,%esp
  100d46:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100d4c:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d50:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d54:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d58:	ee                   	out    %al,(%dx)
}
  100d59:	90                   	nop
  100d5a:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d60:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d64:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d68:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d6c:	ee                   	out    %al,(%dx)
}
  100d6d:	90                   	nop
  100d6e:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100d74:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d78:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d7c:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d80:	ee                   	out    %al,(%dx)
}
  100d81:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d82:	c7 05 08 09 11 00 00 	movl   $0x0,0x110908
  100d89:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d8c:	c7 04 24 f4 35 10 00 	movl   $0x1035f4,(%esp)
  100d93:	e8 75 f5 ff ff       	call   10030d <cprintf>
    pic_enable(IRQ_TIMER);
  100d98:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100d9f:	e8 f9 08 00 00       	call   10169d <pic_enable>
}
  100da4:	90                   	nop
  100da5:	c9                   	leave  
  100da6:	c3                   	ret    

00100da7 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100da7:	55                   	push   %ebp
  100da8:	89 e5                	mov    %esp,%ebp
  100daa:	83 ec 10             	sub    $0x10,%esp
  100dad:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100db3:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100db7:	89 c2                	mov    %eax,%edx
  100db9:	ec                   	in     (%dx),%al
  100dba:	88 45 f1             	mov    %al,-0xf(%ebp)
  100dbd:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100dc3:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100dc7:	89 c2                	mov    %eax,%edx
  100dc9:	ec                   	in     (%dx),%al
  100dca:	88 45 f5             	mov    %al,-0xb(%ebp)
  100dcd:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100dd3:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100dd7:	89 c2                	mov    %eax,%edx
  100dd9:	ec                   	in     (%dx),%al
  100dda:	88 45 f9             	mov    %al,-0x7(%ebp)
  100ddd:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100de3:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100de7:	89 c2                	mov    %eax,%edx
  100de9:	ec                   	in     (%dx),%al
  100dea:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100ded:	90                   	nop
  100dee:	c9                   	leave  
  100def:	c3                   	ret    

00100df0 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100df0:	55                   	push   %ebp
  100df1:	89 e5                	mov    %esp,%ebp
  100df3:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100df6:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100dfd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e00:	0f b7 00             	movzwl (%eax),%eax
  100e03:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e07:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e0a:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e0f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e12:	0f b7 00             	movzwl (%eax),%eax
  100e15:	0f b7 c0             	movzwl %ax,%eax
  100e18:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100e1d:	74 12                	je     100e31 <cga_init+0x41>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e1f:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e26:	66 c7 05 66 fe 10 00 	movw   $0x3b4,0x10fe66
  100e2d:	b4 03 
  100e2f:	eb 13                	jmp    100e44 <cga_init+0x54>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e31:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e34:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e38:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e3b:	66 c7 05 66 fe 10 00 	movw   $0x3d4,0x10fe66
  100e42:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e44:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100e4b:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100e4f:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e53:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100e57:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100e5b:	ee                   	out    %al,(%dx)
}
  100e5c:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e5d:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100e64:	40                   	inc    %eax
  100e65:	0f b7 c0             	movzwl %ax,%eax
  100e68:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e6c:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100e70:	89 c2                	mov    %eax,%edx
  100e72:	ec                   	in     (%dx),%al
  100e73:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100e76:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100e7a:	0f b6 c0             	movzbl %al,%eax
  100e7d:	c1 e0 08             	shl    $0x8,%eax
  100e80:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e83:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100e8a:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100e8e:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e92:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e96:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100e9a:	ee                   	out    %al,(%dx)
}
  100e9b:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100e9c:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ea3:	40                   	inc    %eax
  100ea4:	0f b7 c0             	movzwl %ax,%eax
  100ea7:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100eab:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100eaf:	89 c2                	mov    %eax,%edx
  100eb1:	ec                   	in     (%dx),%al
  100eb2:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100eb5:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100eb9:	0f b6 c0             	movzbl %al,%eax
  100ebc:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100ebf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ec2:	a3 60 fe 10 00       	mov    %eax,0x10fe60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100ec7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100eca:	0f b7 c0             	movzwl %ax,%eax
  100ecd:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
}
  100ed3:	90                   	nop
  100ed4:	c9                   	leave  
  100ed5:	c3                   	ret    

00100ed6 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ed6:	55                   	push   %ebp
  100ed7:	89 e5                	mov    %esp,%ebp
  100ed9:	83 ec 48             	sub    $0x48,%esp
  100edc:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100ee2:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ee6:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100eea:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100eee:	ee                   	out    %al,(%dx)
}
  100eef:	90                   	nop
  100ef0:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100ef6:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100efa:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100efe:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f02:	ee                   	out    %al,(%dx)
}
  100f03:	90                   	nop
  100f04:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f0a:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f0e:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100f12:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100f16:	ee                   	out    %al,(%dx)
}
  100f17:	90                   	nop
  100f18:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f1e:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f22:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f26:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f2a:	ee                   	out    %al,(%dx)
}
  100f2b:	90                   	nop
  100f2c:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100f32:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f36:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f3a:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f3e:	ee                   	out    %al,(%dx)
}
  100f3f:	90                   	nop
  100f40:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100f46:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f4a:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f4e:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f52:	ee                   	out    %al,(%dx)
}
  100f53:	90                   	nop
  100f54:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f5a:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f5e:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f62:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f66:	ee                   	out    %al,(%dx)
}
  100f67:	90                   	nop
  100f68:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f6e:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100f72:	89 c2                	mov    %eax,%edx
  100f74:	ec                   	in     (%dx),%al
  100f75:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100f78:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f7c:	3c ff                	cmp    $0xff,%al
  100f7e:	0f 95 c0             	setne  %al
  100f81:	0f b6 c0             	movzbl %al,%eax
  100f84:	a3 68 fe 10 00       	mov    %eax,0x10fe68
  100f89:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f8f:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100f93:	89 c2                	mov    %eax,%edx
  100f95:	ec                   	in     (%dx),%al
  100f96:	88 45 f1             	mov    %al,-0xf(%ebp)
  100f99:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  100f9f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100fa3:	89 c2                	mov    %eax,%edx
  100fa5:	ec                   	in     (%dx),%al
  100fa6:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fa9:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  100fae:	85 c0                	test   %eax,%eax
  100fb0:	74 0c                	je     100fbe <serial_init+0xe8>
        pic_enable(IRQ_COM1);
  100fb2:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fb9:	e8 df 06 00 00       	call   10169d <pic_enable>
    }
}
  100fbe:	90                   	nop
  100fbf:	c9                   	leave  
  100fc0:	c3                   	ret    

00100fc1 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fc1:	55                   	push   %ebp
  100fc2:	89 e5                	mov    %esp,%ebp
  100fc4:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fc7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fce:	eb 08                	jmp    100fd8 <lpt_putc_sub+0x17>
        delay();
  100fd0:	e8 d2 fd ff ff       	call   100da7 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fd5:	ff 45 fc             	incl   -0x4(%ebp)
  100fd8:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100fde:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100fe2:	89 c2                	mov    %eax,%edx
  100fe4:	ec                   	in     (%dx),%al
  100fe5:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100fe8:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  100fec:	84 c0                	test   %al,%al
  100fee:	78 09                	js     100ff9 <lpt_putc_sub+0x38>
  100ff0:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100ff7:	7e d7                	jle    100fd0 <lpt_putc_sub+0xf>
    }
    outb(LPTPORT + 0, c);
  100ff9:	8b 45 08             	mov    0x8(%ebp),%eax
  100ffc:	0f b6 c0             	movzbl %al,%eax
  100fff:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  101005:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101008:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10100c:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101010:	ee                   	out    %al,(%dx)
}
  101011:	90                   	nop
  101012:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  101018:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10101c:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101020:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101024:	ee                   	out    %al,(%dx)
}
  101025:	90                   	nop
  101026:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  10102c:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101030:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101034:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101038:	ee                   	out    %al,(%dx)
}
  101039:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  10103a:	90                   	nop
  10103b:	c9                   	leave  
  10103c:	c3                   	ret    

0010103d <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  10103d:	55                   	push   %ebp
  10103e:	89 e5                	mov    %esp,%ebp
  101040:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101043:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101047:	74 0d                	je     101056 <lpt_putc+0x19>
        lpt_putc_sub(c);
  101049:	8b 45 08             	mov    0x8(%ebp),%eax
  10104c:	89 04 24             	mov    %eax,(%esp)
  10104f:	e8 6d ff ff ff       	call   100fc1 <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  101054:	eb 24                	jmp    10107a <lpt_putc+0x3d>
        lpt_putc_sub('\b');
  101056:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10105d:	e8 5f ff ff ff       	call   100fc1 <lpt_putc_sub>
        lpt_putc_sub(' ');
  101062:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101069:	e8 53 ff ff ff       	call   100fc1 <lpt_putc_sub>
        lpt_putc_sub('\b');
  10106e:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101075:	e8 47 ff ff ff       	call   100fc1 <lpt_putc_sub>
}
  10107a:	90                   	nop
  10107b:	c9                   	leave  
  10107c:	c3                   	ret    

0010107d <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10107d:	55                   	push   %ebp
  10107e:	89 e5                	mov    %esp,%ebp
  101080:	53                   	push   %ebx
  101081:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101084:	8b 45 08             	mov    0x8(%ebp),%eax
  101087:	25 00 ff ff ff       	and    $0xffffff00,%eax
  10108c:	85 c0                	test   %eax,%eax
  10108e:	75 07                	jne    101097 <cga_putc+0x1a>
        c |= 0x0700;
  101090:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101097:	8b 45 08             	mov    0x8(%ebp),%eax
  10109a:	0f b6 c0             	movzbl %al,%eax
  10109d:	83 f8 0d             	cmp    $0xd,%eax
  1010a0:	74 72                	je     101114 <cga_putc+0x97>
  1010a2:	83 f8 0d             	cmp    $0xd,%eax
  1010a5:	0f 8f a3 00 00 00    	jg     10114e <cga_putc+0xd1>
  1010ab:	83 f8 08             	cmp    $0x8,%eax
  1010ae:	74 0a                	je     1010ba <cga_putc+0x3d>
  1010b0:	83 f8 0a             	cmp    $0xa,%eax
  1010b3:	74 4c                	je     101101 <cga_putc+0x84>
  1010b5:	e9 94 00 00 00       	jmp    10114e <cga_putc+0xd1>
    case '\b':
        if (crt_pos > 0) {
  1010ba:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1010c1:	85 c0                	test   %eax,%eax
  1010c3:	0f 84 af 00 00 00    	je     101178 <cga_putc+0xfb>
            crt_pos --;
  1010c9:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1010d0:	48                   	dec    %eax
  1010d1:	0f b7 c0             	movzwl %ax,%eax
  1010d4:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010da:	8b 45 08             	mov    0x8(%ebp),%eax
  1010dd:	98                   	cwtl   
  1010de:	25 00 ff ff ff       	and    $0xffffff00,%eax
  1010e3:	98                   	cwtl   
  1010e4:	83 c8 20             	or     $0x20,%eax
  1010e7:	98                   	cwtl   
  1010e8:	8b 15 60 fe 10 00    	mov    0x10fe60,%edx
  1010ee:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  1010f5:	01 c9                	add    %ecx,%ecx
  1010f7:	01 ca                	add    %ecx,%edx
  1010f9:	0f b7 c0             	movzwl %ax,%eax
  1010fc:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1010ff:	eb 77                	jmp    101178 <cga_putc+0xfb>
    case '\n':
        crt_pos += CRT_COLS;
  101101:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101108:	83 c0 50             	add    $0x50,%eax
  10110b:	0f b7 c0             	movzwl %ax,%eax
  10110e:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101114:	0f b7 1d 64 fe 10 00 	movzwl 0x10fe64,%ebx
  10111b:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  101122:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  101127:	89 c8                	mov    %ecx,%eax
  101129:	f7 e2                	mul    %edx
  10112b:	c1 ea 06             	shr    $0x6,%edx
  10112e:	89 d0                	mov    %edx,%eax
  101130:	c1 e0 02             	shl    $0x2,%eax
  101133:	01 d0                	add    %edx,%eax
  101135:	c1 e0 04             	shl    $0x4,%eax
  101138:	29 c1                	sub    %eax,%ecx
  10113a:	89 c8                	mov    %ecx,%eax
  10113c:	0f b7 c0             	movzwl %ax,%eax
  10113f:	29 c3                	sub    %eax,%ebx
  101141:	89 d8                	mov    %ebx,%eax
  101143:	0f b7 c0             	movzwl %ax,%eax
  101146:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
        break;
  10114c:	eb 2b                	jmp    101179 <cga_putc+0xfc>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  10114e:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  101154:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10115b:	8d 50 01             	lea    0x1(%eax),%edx
  10115e:	0f b7 d2             	movzwl %dx,%edx
  101161:	66 89 15 64 fe 10 00 	mov    %dx,0x10fe64
  101168:	01 c0                	add    %eax,%eax
  10116a:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  10116d:	8b 45 08             	mov    0x8(%ebp),%eax
  101170:	0f b7 c0             	movzwl %ax,%eax
  101173:	66 89 02             	mov    %ax,(%edx)
        break;
  101176:	eb 01                	jmp    101179 <cga_putc+0xfc>
        break;
  101178:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101179:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101180:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  101185:	76 5d                	jbe    1011e4 <cga_putc+0x167>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101187:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  10118c:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101192:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101197:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  10119e:	00 
  10119f:	89 54 24 04          	mov    %edx,0x4(%esp)
  1011a3:	89 04 24             	mov    %eax,(%esp)
  1011a6:	e8 d5 1f 00 00       	call   103180 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011ab:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011b2:	eb 14                	jmp    1011c8 <cga_putc+0x14b>
            crt_buf[i] = 0x0700 | ' ';
  1011b4:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  1011b9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011bc:	01 d2                	add    %edx,%edx
  1011be:	01 d0                	add    %edx,%eax
  1011c0:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011c5:	ff 45 f4             	incl   -0xc(%ebp)
  1011c8:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011cf:	7e e3                	jle    1011b4 <cga_putc+0x137>
        }
        crt_pos -= CRT_COLS;
  1011d1:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011d8:	83 e8 50             	sub    $0x50,%eax
  1011db:	0f b7 c0             	movzwl %ax,%eax
  1011de:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011e4:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  1011eb:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  1011ef:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1011f3:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1011f7:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1011fb:	ee                   	out    %al,(%dx)
}
  1011fc:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  1011fd:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101204:	c1 e8 08             	shr    $0x8,%eax
  101207:	0f b7 c0             	movzwl %ax,%eax
  10120a:	0f b6 c0             	movzbl %al,%eax
  10120d:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  101214:	42                   	inc    %edx
  101215:	0f b7 d2             	movzwl %dx,%edx
  101218:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  10121c:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10121f:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101223:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101227:	ee                   	out    %al,(%dx)
}
  101228:	90                   	nop
    outb(addr_6845, 15);
  101229:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  101230:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  101234:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101238:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10123c:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101240:	ee                   	out    %al,(%dx)
}
  101241:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  101242:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101249:	0f b6 c0             	movzbl %al,%eax
  10124c:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  101253:	42                   	inc    %edx
  101254:	0f b7 d2             	movzwl %dx,%edx
  101257:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  10125b:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10125e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101262:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101266:	ee                   	out    %al,(%dx)
}
  101267:	90                   	nop
}
  101268:	90                   	nop
  101269:	83 c4 34             	add    $0x34,%esp
  10126c:	5b                   	pop    %ebx
  10126d:	5d                   	pop    %ebp
  10126e:	c3                   	ret    

0010126f <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  10126f:	55                   	push   %ebp
  101270:	89 e5                	mov    %esp,%ebp
  101272:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101275:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10127c:	eb 08                	jmp    101286 <serial_putc_sub+0x17>
        delay();
  10127e:	e8 24 fb ff ff       	call   100da7 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101283:	ff 45 fc             	incl   -0x4(%ebp)
  101286:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10128c:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101290:	89 c2                	mov    %eax,%edx
  101292:	ec                   	in     (%dx),%al
  101293:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101296:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10129a:	0f b6 c0             	movzbl %al,%eax
  10129d:	83 e0 20             	and    $0x20,%eax
  1012a0:	85 c0                	test   %eax,%eax
  1012a2:	75 09                	jne    1012ad <serial_putc_sub+0x3e>
  1012a4:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1012ab:	7e d1                	jle    10127e <serial_putc_sub+0xf>
    }
    outb(COM1 + COM_TX, c);
  1012ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1012b0:	0f b6 c0             	movzbl %al,%eax
  1012b3:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1012b9:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012bc:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012c0:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012c4:	ee                   	out    %al,(%dx)
}
  1012c5:	90                   	nop
}
  1012c6:	90                   	nop
  1012c7:	c9                   	leave  
  1012c8:	c3                   	ret    

001012c9 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012c9:	55                   	push   %ebp
  1012ca:	89 e5                	mov    %esp,%ebp
  1012cc:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012cf:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012d3:	74 0d                	je     1012e2 <serial_putc+0x19>
        serial_putc_sub(c);
  1012d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1012d8:	89 04 24             	mov    %eax,(%esp)
  1012db:	e8 8f ff ff ff       	call   10126f <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  1012e0:	eb 24                	jmp    101306 <serial_putc+0x3d>
        serial_putc_sub('\b');
  1012e2:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012e9:	e8 81 ff ff ff       	call   10126f <serial_putc_sub>
        serial_putc_sub(' ');
  1012ee:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1012f5:	e8 75 ff ff ff       	call   10126f <serial_putc_sub>
        serial_putc_sub('\b');
  1012fa:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101301:	e8 69 ff ff ff       	call   10126f <serial_putc_sub>
}
  101306:	90                   	nop
  101307:	c9                   	leave  
  101308:	c3                   	ret    

00101309 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101309:	55                   	push   %ebp
  10130a:	89 e5                	mov    %esp,%ebp
  10130c:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  10130f:	eb 33                	jmp    101344 <cons_intr+0x3b>
        if (c != 0) {
  101311:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101315:	74 2d                	je     101344 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101317:	a1 84 00 11 00       	mov    0x110084,%eax
  10131c:	8d 50 01             	lea    0x1(%eax),%edx
  10131f:	89 15 84 00 11 00    	mov    %edx,0x110084
  101325:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101328:	88 90 80 fe 10 00    	mov    %dl,0x10fe80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  10132e:	a1 84 00 11 00       	mov    0x110084,%eax
  101333:	3d 00 02 00 00       	cmp    $0x200,%eax
  101338:	75 0a                	jne    101344 <cons_intr+0x3b>
                cons.wpos = 0;
  10133a:	c7 05 84 00 11 00 00 	movl   $0x0,0x110084
  101341:	00 00 00 
    while ((c = (*proc)()) != -1) {
  101344:	8b 45 08             	mov    0x8(%ebp),%eax
  101347:	ff d0                	call   *%eax
  101349:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10134c:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101350:	75 bf                	jne    101311 <cons_intr+0x8>
            }
        }
    }
}
  101352:	90                   	nop
  101353:	90                   	nop
  101354:	c9                   	leave  
  101355:	c3                   	ret    

00101356 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101356:	55                   	push   %ebp
  101357:	89 e5                	mov    %esp,%ebp
  101359:	83 ec 10             	sub    $0x10,%esp
  10135c:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101362:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101366:	89 c2                	mov    %eax,%edx
  101368:	ec                   	in     (%dx),%al
  101369:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10136c:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101370:	0f b6 c0             	movzbl %al,%eax
  101373:	83 e0 01             	and    $0x1,%eax
  101376:	85 c0                	test   %eax,%eax
  101378:	75 07                	jne    101381 <serial_proc_data+0x2b>
        return -1;
  10137a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10137f:	eb 2a                	jmp    1013ab <serial_proc_data+0x55>
  101381:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101387:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10138b:	89 c2                	mov    %eax,%edx
  10138d:	ec                   	in     (%dx),%al
  10138e:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101391:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101395:	0f b6 c0             	movzbl %al,%eax
  101398:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  10139b:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  10139f:	75 07                	jne    1013a8 <serial_proc_data+0x52>
        c = '\b';
  1013a1:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  1013a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1013ab:	c9                   	leave  
  1013ac:	c3                   	ret    

001013ad <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1013ad:	55                   	push   %ebp
  1013ae:	89 e5                	mov    %esp,%ebp
  1013b0:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1013b3:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  1013b8:	85 c0                	test   %eax,%eax
  1013ba:	74 0c                	je     1013c8 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013bc:	c7 04 24 56 13 10 00 	movl   $0x101356,(%esp)
  1013c3:	e8 41 ff ff ff       	call   101309 <cons_intr>
    }
}
  1013c8:	90                   	nop
  1013c9:	c9                   	leave  
  1013ca:	c3                   	ret    

001013cb <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013cb:	55                   	push   %ebp
  1013cc:	89 e5                	mov    %esp,%ebp
  1013ce:	83 ec 38             	sub    $0x38,%esp
  1013d1:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1013da:	89 c2                	mov    %eax,%edx
  1013dc:	ec                   	in     (%dx),%al
  1013dd:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013e0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013e4:	0f b6 c0             	movzbl %al,%eax
  1013e7:	83 e0 01             	and    $0x1,%eax
  1013ea:	85 c0                	test   %eax,%eax
  1013ec:	75 0a                	jne    1013f8 <kbd_proc_data+0x2d>
        return -1;
  1013ee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013f3:	e9 56 01 00 00       	jmp    10154e <kbd_proc_data+0x183>
  1013f8:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101401:	89 c2                	mov    %eax,%edx
  101403:	ec                   	in     (%dx),%al
  101404:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  101407:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  10140b:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  10140e:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  101412:	75 17                	jne    10142b <kbd_proc_data+0x60>
        // E0 escape character
        shift |= E0ESC;
  101414:	a1 88 00 11 00       	mov    0x110088,%eax
  101419:	83 c8 40             	or     $0x40,%eax
  10141c:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  101421:	b8 00 00 00 00       	mov    $0x0,%eax
  101426:	e9 23 01 00 00       	jmp    10154e <kbd_proc_data+0x183>
    } else if (data & 0x80) {
  10142b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10142f:	84 c0                	test   %al,%al
  101431:	79 45                	jns    101478 <kbd_proc_data+0xad>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101433:	a1 88 00 11 00       	mov    0x110088,%eax
  101438:	83 e0 40             	and    $0x40,%eax
  10143b:	85 c0                	test   %eax,%eax
  10143d:	75 08                	jne    101447 <kbd_proc_data+0x7c>
  10143f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101443:	24 7f                	and    $0x7f,%al
  101445:	eb 04                	jmp    10144b <kbd_proc_data+0x80>
  101447:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10144b:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10144e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101452:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  101459:	0c 40                	or     $0x40,%al
  10145b:	0f b6 c0             	movzbl %al,%eax
  10145e:	f7 d0                	not    %eax
  101460:	89 c2                	mov    %eax,%edx
  101462:	a1 88 00 11 00       	mov    0x110088,%eax
  101467:	21 d0                	and    %edx,%eax
  101469:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  10146e:	b8 00 00 00 00       	mov    $0x0,%eax
  101473:	e9 d6 00 00 00       	jmp    10154e <kbd_proc_data+0x183>
    } else if (shift & E0ESC) {
  101478:	a1 88 00 11 00       	mov    0x110088,%eax
  10147d:	83 e0 40             	and    $0x40,%eax
  101480:	85 c0                	test   %eax,%eax
  101482:	74 11                	je     101495 <kbd_proc_data+0xca>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101484:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101488:	a1 88 00 11 00       	mov    0x110088,%eax
  10148d:	83 e0 bf             	and    $0xffffffbf,%eax
  101490:	a3 88 00 11 00       	mov    %eax,0x110088
    }

    shift |= shiftcode[data];
  101495:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101499:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  1014a0:	0f b6 d0             	movzbl %al,%edx
  1014a3:	a1 88 00 11 00       	mov    0x110088,%eax
  1014a8:	09 d0                	or     %edx,%eax
  1014aa:	a3 88 00 11 00       	mov    %eax,0x110088
    shift ^= togglecode[data];
  1014af:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014b3:	0f b6 80 40 f1 10 00 	movzbl 0x10f140(%eax),%eax
  1014ba:	0f b6 d0             	movzbl %al,%edx
  1014bd:	a1 88 00 11 00       	mov    0x110088,%eax
  1014c2:	31 d0                	xor    %edx,%eax
  1014c4:	a3 88 00 11 00       	mov    %eax,0x110088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014c9:	a1 88 00 11 00       	mov    0x110088,%eax
  1014ce:	83 e0 03             	and    $0x3,%eax
  1014d1:	8b 14 85 40 f5 10 00 	mov    0x10f540(,%eax,4),%edx
  1014d8:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014dc:	01 d0                	add    %edx,%eax
  1014de:	0f b6 00             	movzbl (%eax),%eax
  1014e1:	0f b6 c0             	movzbl %al,%eax
  1014e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014e7:	a1 88 00 11 00       	mov    0x110088,%eax
  1014ec:	83 e0 08             	and    $0x8,%eax
  1014ef:	85 c0                	test   %eax,%eax
  1014f1:	74 22                	je     101515 <kbd_proc_data+0x14a>
        if ('a' <= c && c <= 'z')
  1014f3:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014f7:	7e 0c                	jle    101505 <kbd_proc_data+0x13a>
  1014f9:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014fd:	7f 06                	jg     101505 <kbd_proc_data+0x13a>
            c += 'A' - 'a';
  1014ff:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  101503:	eb 10                	jmp    101515 <kbd_proc_data+0x14a>
        else if ('A' <= c && c <= 'Z')
  101505:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101509:	7e 0a                	jle    101515 <kbd_proc_data+0x14a>
  10150b:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  10150f:	7f 04                	jg     101515 <kbd_proc_data+0x14a>
            c += 'a' - 'A';
  101511:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101515:	a1 88 00 11 00       	mov    0x110088,%eax
  10151a:	f7 d0                	not    %eax
  10151c:	83 e0 06             	and    $0x6,%eax
  10151f:	85 c0                	test   %eax,%eax
  101521:	75 28                	jne    10154b <kbd_proc_data+0x180>
  101523:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  10152a:	75 1f                	jne    10154b <kbd_proc_data+0x180>
        cprintf("Rebooting!\n");
  10152c:	c7 04 24 0f 36 10 00 	movl   $0x10360f,(%esp)
  101533:	e8 d5 ed ff ff       	call   10030d <cprintf>
  101538:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  10153e:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101542:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101546:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101549:	ee                   	out    %al,(%dx)
}
  10154a:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  10154b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10154e:	c9                   	leave  
  10154f:	c3                   	ret    

00101550 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101550:	55                   	push   %ebp
  101551:	89 e5                	mov    %esp,%ebp
  101553:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101556:	c7 04 24 cb 13 10 00 	movl   $0x1013cb,(%esp)
  10155d:	e8 a7 fd ff ff       	call   101309 <cons_intr>
}
  101562:	90                   	nop
  101563:	c9                   	leave  
  101564:	c3                   	ret    

00101565 <kbd_init>:

static void
kbd_init(void) {
  101565:	55                   	push   %ebp
  101566:	89 e5                	mov    %esp,%ebp
  101568:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  10156b:	e8 e0 ff ff ff       	call   101550 <kbd_intr>
    pic_enable(IRQ_KBD);
  101570:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101577:	e8 21 01 00 00       	call   10169d <pic_enable>
}
  10157c:	90                   	nop
  10157d:	c9                   	leave  
  10157e:	c3                   	ret    

0010157f <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  10157f:	55                   	push   %ebp
  101580:	89 e5                	mov    %esp,%ebp
  101582:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101585:	e8 66 f8 ff ff       	call   100df0 <cga_init>
    serial_init();
  10158a:	e8 47 f9 ff ff       	call   100ed6 <serial_init>
    kbd_init();
  10158f:	e8 d1 ff ff ff       	call   101565 <kbd_init>
    if (!serial_exists) {
  101594:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101599:	85 c0                	test   %eax,%eax
  10159b:	75 0c                	jne    1015a9 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  10159d:	c7 04 24 1b 36 10 00 	movl   $0x10361b,(%esp)
  1015a4:	e8 64 ed ff ff       	call   10030d <cprintf>
    }
}
  1015a9:	90                   	nop
  1015aa:	c9                   	leave  
  1015ab:	c3                   	ret    

001015ac <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1015ac:	55                   	push   %ebp
  1015ad:	89 e5                	mov    %esp,%ebp
  1015af:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  1015b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1015b5:	89 04 24             	mov    %eax,(%esp)
  1015b8:	e8 80 fa ff ff       	call   10103d <lpt_putc>
    cga_putc(c);
  1015bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1015c0:	89 04 24             	mov    %eax,(%esp)
  1015c3:	e8 b5 fa ff ff       	call   10107d <cga_putc>
    serial_putc(c);
  1015c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1015cb:	89 04 24             	mov    %eax,(%esp)
  1015ce:	e8 f6 fc ff ff       	call   1012c9 <serial_putc>
}
  1015d3:	90                   	nop
  1015d4:	c9                   	leave  
  1015d5:	c3                   	ret    

001015d6 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015d6:	55                   	push   %ebp
  1015d7:	89 e5                	mov    %esp,%ebp
  1015d9:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015dc:	e8 cc fd ff ff       	call   1013ad <serial_intr>
    kbd_intr();
  1015e1:	e8 6a ff ff ff       	call   101550 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015e6:	8b 15 80 00 11 00    	mov    0x110080,%edx
  1015ec:	a1 84 00 11 00       	mov    0x110084,%eax
  1015f1:	39 c2                	cmp    %eax,%edx
  1015f3:	74 36                	je     10162b <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015f5:	a1 80 00 11 00       	mov    0x110080,%eax
  1015fa:	8d 50 01             	lea    0x1(%eax),%edx
  1015fd:	89 15 80 00 11 00    	mov    %edx,0x110080
  101603:	0f b6 80 80 fe 10 00 	movzbl 0x10fe80(%eax),%eax
  10160a:	0f b6 c0             	movzbl %al,%eax
  10160d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101610:	a1 80 00 11 00       	mov    0x110080,%eax
  101615:	3d 00 02 00 00       	cmp    $0x200,%eax
  10161a:	75 0a                	jne    101626 <cons_getc+0x50>
            cons.rpos = 0;
  10161c:	c7 05 80 00 11 00 00 	movl   $0x0,0x110080
  101623:	00 00 00 
        }
        return c;
  101626:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101629:	eb 05                	jmp    101630 <cons_getc+0x5a>
    }
    return 0;
  10162b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101630:	c9                   	leave  
  101631:	c3                   	ret    

00101632 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101632:	55                   	push   %ebp
  101633:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  101635:	fb                   	sti    
}
  101636:	90                   	nop
    sti();
}
  101637:	90                   	nop
  101638:	5d                   	pop    %ebp
  101639:	c3                   	ret    

0010163a <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  10163a:	55                   	push   %ebp
  10163b:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  10163d:	fa                   	cli    
}
  10163e:	90                   	nop
    cli();
}
  10163f:	90                   	nop
  101640:	5d                   	pop    %ebp
  101641:	c3                   	ret    

00101642 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101642:	55                   	push   %ebp
  101643:	89 e5                	mov    %esp,%ebp
  101645:	83 ec 14             	sub    $0x14,%esp
  101648:	8b 45 08             	mov    0x8(%ebp),%eax
  10164b:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  10164f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101652:	66 a3 50 f5 10 00    	mov    %ax,0x10f550
    if (did_init) {
  101658:	a1 8c 00 11 00       	mov    0x11008c,%eax
  10165d:	85 c0                	test   %eax,%eax
  10165f:	74 39                	je     10169a <pic_setmask+0x58>
        outb(IO_PIC1 + 1, mask);
  101661:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101664:	0f b6 c0             	movzbl %al,%eax
  101667:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  10166d:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101670:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101674:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101678:	ee                   	out    %al,(%dx)
}
  101679:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  10167a:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10167e:	c1 e8 08             	shr    $0x8,%eax
  101681:	0f b7 c0             	movzwl %ax,%eax
  101684:	0f b6 c0             	movzbl %al,%eax
  101687:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  10168d:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101690:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101694:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101698:	ee                   	out    %al,(%dx)
}
  101699:	90                   	nop
    }
}
  10169a:	90                   	nop
  10169b:	c9                   	leave  
  10169c:	c3                   	ret    

0010169d <pic_enable>:

void
pic_enable(unsigned int irq) {
  10169d:	55                   	push   %ebp
  10169e:	89 e5                	mov    %esp,%ebp
  1016a0:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  1016a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1016a6:	ba 01 00 00 00       	mov    $0x1,%edx
  1016ab:	88 c1                	mov    %al,%cl
  1016ad:	d3 e2                	shl    %cl,%edx
  1016af:	89 d0                	mov    %edx,%eax
  1016b1:	98                   	cwtl   
  1016b2:	f7 d0                	not    %eax
  1016b4:	0f bf d0             	movswl %ax,%edx
  1016b7:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1016be:	98                   	cwtl   
  1016bf:	21 d0                	and    %edx,%eax
  1016c1:	98                   	cwtl   
  1016c2:	0f b7 c0             	movzwl %ax,%eax
  1016c5:	89 04 24             	mov    %eax,(%esp)
  1016c8:	e8 75 ff ff ff       	call   101642 <pic_setmask>
}
  1016cd:	90                   	nop
  1016ce:	c9                   	leave  
  1016cf:	c3                   	ret    

001016d0 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016d0:	55                   	push   %ebp
  1016d1:	89 e5                	mov    %esp,%ebp
  1016d3:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1016d6:	c7 05 8c 00 11 00 01 	movl   $0x1,0x11008c
  1016dd:	00 00 00 
  1016e0:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1016e6:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016ea:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1016ee:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1016f2:	ee                   	out    %al,(%dx)
}
  1016f3:	90                   	nop
  1016f4:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1016fa:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016fe:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  101702:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  101706:	ee                   	out    %al,(%dx)
}
  101707:	90                   	nop
  101708:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  10170e:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101712:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101716:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  10171a:	ee                   	out    %al,(%dx)
}
  10171b:	90                   	nop
  10171c:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  101722:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101726:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  10172a:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10172e:	ee                   	out    %al,(%dx)
}
  10172f:	90                   	nop
  101730:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  101736:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10173a:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  10173e:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101742:	ee                   	out    %al,(%dx)
}
  101743:	90                   	nop
  101744:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  10174a:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10174e:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101752:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101756:	ee                   	out    %al,(%dx)
}
  101757:	90                   	nop
  101758:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  10175e:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101762:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101766:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  10176a:	ee                   	out    %al,(%dx)
}
  10176b:	90                   	nop
  10176c:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101772:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101776:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10177a:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10177e:	ee                   	out    %al,(%dx)
}
  10177f:	90                   	nop
  101780:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101786:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10178a:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10178e:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101792:	ee                   	out    %al,(%dx)
}
  101793:	90                   	nop
  101794:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  10179a:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10179e:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1017a2:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1017a6:	ee                   	out    %al,(%dx)
}
  1017a7:	90                   	nop
  1017a8:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  1017ae:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017b2:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1017b6:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1017ba:	ee                   	out    %al,(%dx)
}
  1017bb:	90                   	nop
  1017bc:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1017c2:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017c6:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1017ca:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1017ce:	ee                   	out    %al,(%dx)
}
  1017cf:	90                   	nop
  1017d0:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  1017d6:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017da:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1017de:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1017e2:	ee                   	out    %al,(%dx)
}
  1017e3:	90                   	nop
  1017e4:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1017ea:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017ee:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1017f2:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1017f6:	ee                   	out    %al,(%dx)
}
  1017f7:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017f8:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1017ff:	3d ff ff 00 00       	cmp    $0xffff,%eax
  101804:	74 0f                	je     101815 <pic_init+0x145>
        pic_setmask(irq_mask);
  101806:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  10180d:	89 04 24             	mov    %eax,(%esp)
  101810:	e8 2d fe ff ff       	call   101642 <pic_setmask>
    }
}
  101815:	90                   	nop
  101816:	c9                   	leave  
  101817:	c3                   	ret    

00101818 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  101818:	55                   	push   %ebp
  101819:	89 e5                	mov    %esp,%ebp
  10181b:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  10181e:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101825:	00 
  101826:	c7 04 24 40 36 10 00 	movl   $0x103640,(%esp)
  10182d:	e8 db ea ff ff       	call   10030d <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101832:	90                   	nop
  101833:	c9                   	leave  
  101834:	c3                   	ret    

00101835 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101835:	55                   	push   %ebp
  101836:	89 e5                	mov    %esp,%ebp
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
}
  101838:	90                   	nop
  101839:	5d                   	pop    %ebp
  10183a:	c3                   	ret    

0010183b <trapname>:

static const char *
trapname(int trapno) {
  10183b:	55                   	push   %ebp
  10183c:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  10183e:	8b 45 08             	mov    0x8(%ebp),%eax
  101841:	83 f8 13             	cmp    $0x13,%eax
  101844:	77 0c                	ja     101852 <trapname+0x17>
        return excnames[trapno];
  101846:	8b 45 08             	mov    0x8(%ebp),%eax
  101849:	8b 04 85 a0 39 10 00 	mov    0x1039a0(,%eax,4),%eax
  101850:	eb 18                	jmp    10186a <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101852:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101856:	7e 0d                	jle    101865 <trapname+0x2a>
  101858:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  10185c:	7f 07                	jg     101865 <trapname+0x2a>
        return "Hardware Interrupt";
  10185e:	b8 4a 36 10 00       	mov    $0x10364a,%eax
  101863:	eb 05                	jmp    10186a <trapname+0x2f>
    }
    return "(unknown trap)";
  101865:	b8 5d 36 10 00       	mov    $0x10365d,%eax
}
  10186a:	5d                   	pop    %ebp
  10186b:	c3                   	ret    

0010186c <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  10186c:	55                   	push   %ebp
  10186d:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  10186f:	8b 45 08             	mov    0x8(%ebp),%eax
  101872:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101876:	83 f8 08             	cmp    $0x8,%eax
  101879:	0f 94 c0             	sete   %al
  10187c:	0f b6 c0             	movzbl %al,%eax
}
  10187f:	5d                   	pop    %ebp
  101880:	c3                   	ret    

00101881 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101881:	55                   	push   %ebp
  101882:	89 e5                	mov    %esp,%ebp
  101884:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101887:	8b 45 08             	mov    0x8(%ebp),%eax
  10188a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10188e:	c7 04 24 9e 36 10 00 	movl   $0x10369e,(%esp)
  101895:	e8 73 ea ff ff       	call   10030d <cprintf>
    print_regs(&tf->tf_regs);
  10189a:	8b 45 08             	mov    0x8(%ebp),%eax
  10189d:	89 04 24             	mov    %eax,(%esp)
  1018a0:	e8 8d 01 00 00       	call   101a32 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  1018a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1018a8:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  1018ac:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018b0:	c7 04 24 af 36 10 00 	movl   $0x1036af,(%esp)
  1018b7:	e8 51 ea ff ff       	call   10030d <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  1018bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1018bf:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  1018c3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018c7:	c7 04 24 c2 36 10 00 	movl   $0x1036c2,(%esp)
  1018ce:	e8 3a ea ff ff       	call   10030d <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  1018d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1018d6:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  1018da:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018de:	c7 04 24 d5 36 10 00 	movl   $0x1036d5,(%esp)
  1018e5:	e8 23 ea ff ff       	call   10030d <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  1018ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1018ed:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  1018f1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018f5:	c7 04 24 e8 36 10 00 	movl   $0x1036e8,(%esp)
  1018fc:	e8 0c ea ff ff       	call   10030d <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101901:	8b 45 08             	mov    0x8(%ebp),%eax
  101904:	8b 40 30             	mov    0x30(%eax),%eax
  101907:	89 04 24             	mov    %eax,(%esp)
  10190a:	e8 2c ff ff ff       	call   10183b <trapname>
  10190f:	8b 55 08             	mov    0x8(%ebp),%edx
  101912:	8b 52 30             	mov    0x30(%edx),%edx
  101915:	89 44 24 08          	mov    %eax,0x8(%esp)
  101919:	89 54 24 04          	mov    %edx,0x4(%esp)
  10191d:	c7 04 24 fb 36 10 00 	movl   $0x1036fb,(%esp)
  101924:	e8 e4 e9 ff ff       	call   10030d <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101929:	8b 45 08             	mov    0x8(%ebp),%eax
  10192c:	8b 40 34             	mov    0x34(%eax),%eax
  10192f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101933:	c7 04 24 0d 37 10 00 	movl   $0x10370d,(%esp)
  10193a:	e8 ce e9 ff ff       	call   10030d <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  10193f:	8b 45 08             	mov    0x8(%ebp),%eax
  101942:	8b 40 38             	mov    0x38(%eax),%eax
  101945:	89 44 24 04          	mov    %eax,0x4(%esp)
  101949:	c7 04 24 1c 37 10 00 	movl   $0x10371c,(%esp)
  101950:	e8 b8 e9 ff ff       	call   10030d <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101955:	8b 45 08             	mov    0x8(%ebp),%eax
  101958:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  10195c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101960:	c7 04 24 2b 37 10 00 	movl   $0x10372b,(%esp)
  101967:	e8 a1 e9 ff ff       	call   10030d <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  10196c:	8b 45 08             	mov    0x8(%ebp),%eax
  10196f:	8b 40 40             	mov    0x40(%eax),%eax
  101972:	89 44 24 04          	mov    %eax,0x4(%esp)
  101976:	c7 04 24 3e 37 10 00 	movl   $0x10373e,(%esp)
  10197d:	e8 8b e9 ff ff       	call   10030d <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101982:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101989:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101990:	eb 3d                	jmp    1019cf <print_trapframe+0x14e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101992:	8b 45 08             	mov    0x8(%ebp),%eax
  101995:	8b 50 40             	mov    0x40(%eax),%edx
  101998:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10199b:	21 d0                	and    %edx,%eax
  10199d:	85 c0                	test   %eax,%eax
  10199f:	74 28                	je     1019c9 <print_trapframe+0x148>
  1019a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1019a4:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  1019ab:	85 c0                	test   %eax,%eax
  1019ad:	74 1a                	je     1019c9 <print_trapframe+0x148>
            cprintf("%s,", IA32flags[i]);
  1019af:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1019b2:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  1019b9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019bd:	c7 04 24 4d 37 10 00 	movl   $0x10374d,(%esp)
  1019c4:	e8 44 e9 ff ff       	call   10030d <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  1019c9:	ff 45 f4             	incl   -0xc(%ebp)
  1019cc:	d1 65 f0             	shll   -0x10(%ebp)
  1019cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1019d2:	83 f8 17             	cmp    $0x17,%eax
  1019d5:	76 bb                	jbe    101992 <print_trapframe+0x111>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  1019d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1019da:	8b 40 40             	mov    0x40(%eax),%eax
  1019dd:	c1 e8 0c             	shr    $0xc,%eax
  1019e0:	83 e0 03             	and    $0x3,%eax
  1019e3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019e7:	c7 04 24 51 37 10 00 	movl   $0x103751,(%esp)
  1019ee:	e8 1a e9 ff ff       	call   10030d <cprintf>

    if (!trap_in_kernel(tf)) {
  1019f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f6:	89 04 24             	mov    %eax,(%esp)
  1019f9:	e8 6e fe ff ff       	call   10186c <trap_in_kernel>
  1019fe:	85 c0                	test   %eax,%eax
  101a00:	75 2d                	jne    101a2f <print_trapframe+0x1ae>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101a02:	8b 45 08             	mov    0x8(%ebp),%eax
  101a05:	8b 40 44             	mov    0x44(%eax),%eax
  101a08:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a0c:	c7 04 24 5a 37 10 00 	movl   $0x10375a,(%esp)
  101a13:	e8 f5 e8 ff ff       	call   10030d <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101a18:	8b 45 08             	mov    0x8(%ebp),%eax
  101a1b:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101a1f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a23:	c7 04 24 69 37 10 00 	movl   $0x103769,(%esp)
  101a2a:	e8 de e8 ff ff       	call   10030d <cprintf>
    }
}
  101a2f:	90                   	nop
  101a30:	c9                   	leave  
  101a31:	c3                   	ret    

00101a32 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101a32:	55                   	push   %ebp
  101a33:	89 e5                	mov    %esp,%ebp
  101a35:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101a38:	8b 45 08             	mov    0x8(%ebp),%eax
  101a3b:	8b 00                	mov    (%eax),%eax
  101a3d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a41:	c7 04 24 7c 37 10 00 	movl   $0x10377c,(%esp)
  101a48:	e8 c0 e8 ff ff       	call   10030d <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101a4d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a50:	8b 40 04             	mov    0x4(%eax),%eax
  101a53:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a57:	c7 04 24 8b 37 10 00 	movl   $0x10378b,(%esp)
  101a5e:	e8 aa e8 ff ff       	call   10030d <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101a63:	8b 45 08             	mov    0x8(%ebp),%eax
  101a66:	8b 40 08             	mov    0x8(%eax),%eax
  101a69:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a6d:	c7 04 24 9a 37 10 00 	movl   $0x10379a,(%esp)
  101a74:	e8 94 e8 ff ff       	call   10030d <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101a79:	8b 45 08             	mov    0x8(%ebp),%eax
  101a7c:	8b 40 0c             	mov    0xc(%eax),%eax
  101a7f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a83:	c7 04 24 a9 37 10 00 	movl   $0x1037a9,(%esp)
  101a8a:	e8 7e e8 ff ff       	call   10030d <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101a8f:	8b 45 08             	mov    0x8(%ebp),%eax
  101a92:	8b 40 10             	mov    0x10(%eax),%eax
  101a95:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a99:	c7 04 24 b8 37 10 00 	movl   $0x1037b8,(%esp)
  101aa0:	e8 68 e8 ff ff       	call   10030d <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101aa5:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa8:	8b 40 14             	mov    0x14(%eax),%eax
  101aab:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aaf:	c7 04 24 c7 37 10 00 	movl   $0x1037c7,(%esp)
  101ab6:	e8 52 e8 ff ff       	call   10030d <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101abb:	8b 45 08             	mov    0x8(%ebp),%eax
  101abe:	8b 40 18             	mov    0x18(%eax),%eax
  101ac1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ac5:	c7 04 24 d6 37 10 00 	movl   $0x1037d6,(%esp)
  101acc:	e8 3c e8 ff ff       	call   10030d <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101ad1:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad4:	8b 40 1c             	mov    0x1c(%eax),%eax
  101ad7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101adb:	c7 04 24 e5 37 10 00 	movl   $0x1037e5,(%esp)
  101ae2:	e8 26 e8 ff ff       	call   10030d <cprintf>
}
  101ae7:	90                   	nop
  101ae8:	c9                   	leave  
  101ae9:	c3                   	ret    

00101aea <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101aea:	55                   	push   %ebp
  101aeb:	89 e5                	mov    %esp,%ebp
  101aed:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101af0:	8b 45 08             	mov    0x8(%ebp),%eax
  101af3:	8b 40 30             	mov    0x30(%eax),%eax
  101af6:	83 f8 79             	cmp    $0x79,%eax
  101af9:	0f 87 99 00 00 00    	ja     101b98 <trap_dispatch+0xae>
  101aff:	83 f8 78             	cmp    $0x78,%eax
  101b02:	73 78                	jae    101b7c <trap_dispatch+0x92>
  101b04:	83 f8 2f             	cmp    $0x2f,%eax
  101b07:	0f 87 8b 00 00 00    	ja     101b98 <trap_dispatch+0xae>
  101b0d:	83 f8 2e             	cmp    $0x2e,%eax
  101b10:	0f 83 b7 00 00 00    	jae    101bcd <trap_dispatch+0xe3>
  101b16:	83 f8 24             	cmp    $0x24,%eax
  101b19:	74 15                	je     101b30 <trap_dispatch+0x46>
  101b1b:	83 f8 24             	cmp    $0x24,%eax
  101b1e:	77 78                	ja     101b98 <trap_dispatch+0xae>
  101b20:	83 f8 20             	cmp    $0x20,%eax
  101b23:	0f 84 a7 00 00 00    	je     101bd0 <trap_dispatch+0xe6>
  101b29:	83 f8 21             	cmp    $0x21,%eax
  101b2c:	74 28                	je     101b56 <trap_dispatch+0x6c>
  101b2e:	eb 68                	jmp    101b98 <trap_dispatch+0xae>
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101b30:	e8 a1 fa ff ff       	call   1015d6 <cons_getc>
  101b35:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101b38:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101b3c:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101b40:	89 54 24 08          	mov    %edx,0x8(%esp)
  101b44:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b48:	c7 04 24 f4 37 10 00 	movl   $0x1037f4,(%esp)
  101b4f:	e8 b9 e7 ff ff       	call   10030d <cprintf>
        break;
  101b54:	eb 7b                	jmp    101bd1 <trap_dispatch+0xe7>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101b56:	e8 7b fa ff ff       	call   1015d6 <cons_getc>
  101b5b:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101b5e:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101b62:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101b66:	89 54 24 08          	mov    %edx,0x8(%esp)
  101b6a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b6e:	c7 04 24 06 38 10 00 	movl   $0x103806,(%esp)
  101b75:	e8 93 e7 ff ff       	call   10030d <cprintf>
        break;
  101b7a:	eb 55                	jmp    101bd1 <trap_dispatch+0xe7>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101b7c:	c7 44 24 08 15 38 10 	movl   $0x103815,0x8(%esp)
  101b83:	00 
  101b84:	c7 44 24 04 a2 00 00 	movl   $0xa2,0x4(%esp)
  101b8b:	00 
  101b8c:	c7 04 24 25 38 10 00 	movl   $0x103825,(%esp)
  101b93:	e8 d9 f0 ff ff       	call   100c71 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101b98:	8b 45 08             	mov    0x8(%ebp),%eax
  101b9b:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101b9f:	83 e0 03             	and    $0x3,%eax
  101ba2:	85 c0                	test   %eax,%eax
  101ba4:	75 2b                	jne    101bd1 <trap_dispatch+0xe7>
            print_trapframe(tf);
  101ba6:	8b 45 08             	mov    0x8(%ebp),%eax
  101ba9:	89 04 24             	mov    %eax,(%esp)
  101bac:	e8 d0 fc ff ff       	call   101881 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101bb1:	c7 44 24 08 36 38 10 	movl   $0x103836,0x8(%esp)
  101bb8:	00 
  101bb9:	c7 44 24 04 ac 00 00 	movl   $0xac,0x4(%esp)
  101bc0:	00 
  101bc1:	c7 04 24 25 38 10 00 	movl   $0x103825,(%esp)
  101bc8:	e8 a4 f0 ff ff       	call   100c71 <__panic>
        break;
  101bcd:	90                   	nop
  101bce:	eb 01                	jmp    101bd1 <trap_dispatch+0xe7>
        break;
  101bd0:	90                   	nop
        }
    }
}
  101bd1:	90                   	nop
  101bd2:	c9                   	leave  
  101bd3:	c3                   	ret    

00101bd4 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101bd4:	55                   	push   %ebp
  101bd5:	89 e5                	mov    %esp,%ebp
  101bd7:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101bda:	8b 45 08             	mov    0x8(%ebp),%eax
  101bdd:	89 04 24             	mov    %eax,(%esp)
  101be0:	e8 05 ff ff ff       	call   101aea <trap_dispatch>
}
  101be5:	90                   	nop
  101be6:	c9                   	leave  
  101be7:	c3                   	ret    

00101be8 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101be8:	1e                   	push   %ds
    pushl %es
  101be9:	06                   	push   %es
    pushl %fs
  101bea:	0f a0                	push   %fs
    pushl %gs
  101bec:	0f a8                	push   %gs
    pushal
  101bee:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101bef:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101bf4:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101bf6:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101bf8:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101bf9:	e8 d6 ff ff ff       	call   101bd4 <trap>

    # pop the pushed stack pointer
    popl %esp
  101bfe:	5c                   	pop    %esp

00101bff <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101bff:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101c00:	0f a9                	pop    %gs
    popl %fs
  101c02:	0f a1                	pop    %fs
    popl %es
  101c04:	07                   	pop    %es
    popl %ds
  101c05:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101c06:	83 c4 08             	add    $0x8,%esp
    iret
  101c09:	cf                   	iret   

00101c0a <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101c0a:	6a 00                	push   $0x0
  pushl $0
  101c0c:	6a 00                	push   $0x0
  jmp __alltraps
  101c0e:	e9 d5 ff ff ff       	jmp    101be8 <__alltraps>

00101c13 <vector1>:
.globl vector1
vector1:
  pushl $0
  101c13:	6a 00                	push   $0x0
  pushl $1
  101c15:	6a 01                	push   $0x1
  jmp __alltraps
  101c17:	e9 cc ff ff ff       	jmp    101be8 <__alltraps>

00101c1c <vector2>:
.globl vector2
vector2:
  pushl $0
  101c1c:	6a 00                	push   $0x0
  pushl $2
  101c1e:	6a 02                	push   $0x2
  jmp __alltraps
  101c20:	e9 c3 ff ff ff       	jmp    101be8 <__alltraps>

00101c25 <vector3>:
.globl vector3
vector3:
  pushl $0
  101c25:	6a 00                	push   $0x0
  pushl $3
  101c27:	6a 03                	push   $0x3
  jmp __alltraps
  101c29:	e9 ba ff ff ff       	jmp    101be8 <__alltraps>

00101c2e <vector4>:
.globl vector4
vector4:
  pushl $0
  101c2e:	6a 00                	push   $0x0
  pushl $4
  101c30:	6a 04                	push   $0x4
  jmp __alltraps
  101c32:	e9 b1 ff ff ff       	jmp    101be8 <__alltraps>

00101c37 <vector5>:
.globl vector5
vector5:
  pushl $0
  101c37:	6a 00                	push   $0x0
  pushl $5
  101c39:	6a 05                	push   $0x5
  jmp __alltraps
  101c3b:	e9 a8 ff ff ff       	jmp    101be8 <__alltraps>

00101c40 <vector6>:
.globl vector6
vector6:
  pushl $0
  101c40:	6a 00                	push   $0x0
  pushl $6
  101c42:	6a 06                	push   $0x6
  jmp __alltraps
  101c44:	e9 9f ff ff ff       	jmp    101be8 <__alltraps>

00101c49 <vector7>:
.globl vector7
vector7:
  pushl $0
  101c49:	6a 00                	push   $0x0
  pushl $7
  101c4b:	6a 07                	push   $0x7
  jmp __alltraps
  101c4d:	e9 96 ff ff ff       	jmp    101be8 <__alltraps>

00101c52 <vector8>:
.globl vector8
vector8:
  pushl $8
  101c52:	6a 08                	push   $0x8
  jmp __alltraps
  101c54:	e9 8f ff ff ff       	jmp    101be8 <__alltraps>

00101c59 <vector9>:
.globl vector9
vector9:
  pushl $0
  101c59:	6a 00                	push   $0x0
  pushl $9
  101c5b:	6a 09                	push   $0x9
  jmp __alltraps
  101c5d:	e9 86 ff ff ff       	jmp    101be8 <__alltraps>

00101c62 <vector10>:
.globl vector10
vector10:
  pushl $10
  101c62:	6a 0a                	push   $0xa
  jmp __alltraps
  101c64:	e9 7f ff ff ff       	jmp    101be8 <__alltraps>

00101c69 <vector11>:
.globl vector11
vector11:
  pushl $11
  101c69:	6a 0b                	push   $0xb
  jmp __alltraps
  101c6b:	e9 78 ff ff ff       	jmp    101be8 <__alltraps>

00101c70 <vector12>:
.globl vector12
vector12:
  pushl $12
  101c70:	6a 0c                	push   $0xc
  jmp __alltraps
  101c72:	e9 71 ff ff ff       	jmp    101be8 <__alltraps>

00101c77 <vector13>:
.globl vector13
vector13:
  pushl $13
  101c77:	6a 0d                	push   $0xd
  jmp __alltraps
  101c79:	e9 6a ff ff ff       	jmp    101be8 <__alltraps>

00101c7e <vector14>:
.globl vector14
vector14:
  pushl $14
  101c7e:	6a 0e                	push   $0xe
  jmp __alltraps
  101c80:	e9 63 ff ff ff       	jmp    101be8 <__alltraps>

00101c85 <vector15>:
.globl vector15
vector15:
  pushl $0
  101c85:	6a 00                	push   $0x0
  pushl $15
  101c87:	6a 0f                	push   $0xf
  jmp __alltraps
  101c89:	e9 5a ff ff ff       	jmp    101be8 <__alltraps>

00101c8e <vector16>:
.globl vector16
vector16:
  pushl $0
  101c8e:	6a 00                	push   $0x0
  pushl $16
  101c90:	6a 10                	push   $0x10
  jmp __alltraps
  101c92:	e9 51 ff ff ff       	jmp    101be8 <__alltraps>

00101c97 <vector17>:
.globl vector17
vector17:
  pushl $17
  101c97:	6a 11                	push   $0x11
  jmp __alltraps
  101c99:	e9 4a ff ff ff       	jmp    101be8 <__alltraps>

00101c9e <vector18>:
.globl vector18
vector18:
  pushl $0
  101c9e:	6a 00                	push   $0x0
  pushl $18
  101ca0:	6a 12                	push   $0x12
  jmp __alltraps
  101ca2:	e9 41 ff ff ff       	jmp    101be8 <__alltraps>

00101ca7 <vector19>:
.globl vector19
vector19:
  pushl $0
  101ca7:	6a 00                	push   $0x0
  pushl $19
  101ca9:	6a 13                	push   $0x13
  jmp __alltraps
  101cab:	e9 38 ff ff ff       	jmp    101be8 <__alltraps>

00101cb0 <vector20>:
.globl vector20
vector20:
  pushl $0
  101cb0:	6a 00                	push   $0x0
  pushl $20
  101cb2:	6a 14                	push   $0x14
  jmp __alltraps
  101cb4:	e9 2f ff ff ff       	jmp    101be8 <__alltraps>

00101cb9 <vector21>:
.globl vector21
vector21:
  pushl $0
  101cb9:	6a 00                	push   $0x0
  pushl $21
  101cbb:	6a 15                	push   $0x15
  jmp __alltraps
  101cbd:	e9 26 ff ff ff       	jmp    101be8 <__alltraps>

00101cc2 <vector22>:
.globl vector22
vector22:
  pushl $0
  101cc2:	6a 00                	push   $0x0
  pushl $22
  101cc4:	6a 16                	push   $0x16
  jmp __alltraps
  101cc6:	e9 1d ff ff ff       	jmp    101be8 <__alltraps>

00101ccb <vector23>:
.globl vector23
vector23:
  pushl $0
  101ccb:	6a 00                	push   $0x0
  pushl $23
  101ccd:	6a 17                	push   $0x17
  jmp __alltraps
  101ccf:	e9 14 ff ff ff       	jmp    101be8 <__alltraps>

00101cd4 <vector24>:
.globl vector24
vector24:
  pushl $0
  101cd4:	6a 00                	push   $0x0
  pushl $24
  101cd6:	6a 18                	push   $0x18
  jmp __alltraps
  101cd8:	e9 0b ff ff ff       	jmp    101be8 <__alltraps>

00101cdd <vector25>:
.globl vector25
vector25:
  pushl $0
  101cdd:	6a 00                	push   $0x0
  pushl $25
  101cdf:	6a 19                	push   $0x19
  jmp __alltraps
  101ce1:	e9 02 ff ff ff       	jmp    101be8 <__alltraps>

00101ce6 <vector26>:
.globl vector26
vector26:
  pushl $0
  101ce6:	6a 00                	push   $0x0
  pushl $26
  101ce8:	6a 1a                	push   $0x1a
  jmp __alltraps
  101cea:	e9 f9 fe ff ff       	jmp    101be8 <__alltraps>

00101cef <vector27>:
.globl vector27
vector27:
  pushl $0
  101cef:	6a 00                	push   $0x0
  pushl $27
  101cf1:	6a 1b                	push   $0x1b
  jmp __alltraps
  101cf3:	e9 f0 fe ff ff       	jmp    101be8 <__alltraps>

00101cf8 <vector28>:
.globl vector28
vector28:
  pushl $0
  101cf8:	6a 00                	push   $0x0
  pushl $28
  101cfa:	6a 1c                	push   $0x1c
  jmp __alltraps
  101cfc:	e9 e7 fe ff ff       	jmp    101be8 <__alltraps>

00101d01 <vector29>:
.globl vector29
vector29:
  pushl $0
  101d01:	6a 00                	push   $0x0
  pushl $29
  101d03:	6a 1d                	push   $0x1d
  jmp __alltraps
  101d05:	e9 de fe ff ff       	jmp    101be8 <__alltraps>

00101d0a <vector30>:
.globl vector30
vector30:
  pushl $0
  101d0a:	6a 00                	push   $0x0
  pushl $30
  101d0c:	6a 1e                	push   $0x1e
  jmp __alltraps
  101d0e:	e9 d5 fe ff ff       	jmp    101be8 <__alltraps>

00101d13 <vector31>:
.globl vector31
vector31:
  pushl $0
  101d13:	6a 00                	push   $0x0
  pushl $31
  101d15:	6a 1f                	push   $0x1f
  jmp __alltraps
  101d17:	e9 cc fe ff ff       	jmp    101be8 <__alltraps>

00101d1c <vector32>:
.globl vector32
vector32:
  pushl $0
  101d1c:	6a 00                	push   $0x0
  pushl $32
  101d1e:	6a 20                	push   $0x20
  jmp __alltraps
  101d20:	e9 c3 fe ff ff       	jmp    101be8 <__alltraps>

00101d25 <vector33>:
.globl vector33
vector33:
  pushl $0
  101d25:	6a 00                	push   $0x0
  pushl $33
  101d27:	6a 21                	push   $0x21
  jmp __alltraps
  101d29:	e9 ba fe ff ff       	jmp    101be8 <__alltraps>

00101d2e <vector34>:
.globl vector34
vector34:
  pushl $0
  101d2e:	6a 00                	push   $0x0
  pushl $34
  101d30:	6a 22                	push   $0x22
  jmp __alltraps
  101d32:	e9 b1 fe ff ff       	jmp    101be8 <__alltraps>

00101d37 <vector35>:
.globl vector35
vector35:
  pushl $0
  101d37:	6a 00                	push   $0x0
  pushl $35
  101d39:	6a 23                	push   $0x23
  jmp __alltraps
  101d3b:	e9 a8 fe ff ff       	jmp    101be8 <__alltraps>

00101d40 <vector36>:
.globl vector36
vector36:
  pushl $0
  101d40:	6a 00                	push   $0x0
  pushl $36
  101d42:	6a 24                	push   $0x24
  jmp __alltraps
  101d44:	e9 9f fe ff ff       	jmp    101be8 <__alltraps>

00101d49 <vector37>:
.globl vector37
vector37:
  pushl $0
  101d49:	6a 00                	push   $0x0
  pushl $37
  101d4b:	6a 25                	push   $0x25
  jmp __alltraps
  101d4d:	e9 96 fe ff ff       	jmp    101be8 <__alltraps>

00101d52 <vector38>:
.globl vector38
vector38:
  pushl $0
  101d52:	6a 00                	push   $0x0
  pushl $38
  101d54:	6a 26                	push   $0x26
  jmp __alltraps
  101d56:	e9 8d fe ff ff       	jmp    101be8 <__alltraps>

00101d5b <vector39>:
.globl vector39
vector39:
  pushl $0
  101d5b:	6a 00                	push   $0x0
  pushl $39
  101d5d:	6a 27                	push   $0x27
  jmp __alltraps
  101d5f:	e9 84 fe ff ff       	jmp    101be8 <__alltraps>

00101d64 <vector40>:
.globl vector40
vector40:
  pushl $0
  101d64:	6a 00                	push   $0x0
  pushl $40
  101d66:	6a 28                	push   $0x28
  jmp __alltraps
  101d68:	e9 7b fe ff ff       	jmp    101be8 <__alltraps>

00101d6d <vector41>:
.globl vector41
vector41:
  pushl $0
  101d6d:	6a 00                	push   $0x0
  pushl $41
  101d6f:	6a 29                	push   $0x29
  jmp __alltraps
  101d71:	e9 72 fe ff ff       	jmp    101be8 <__alltraps>

00101d76 <vector42>:
.globl vector42
vector42:
  pushl $0
  101d76:	6a 00                	push   $0x0
  pushl $42
  101d78:	6a 2a                	push   $0x2a
  jmp __alltraps
  101d7a:	e9 69 fe ff ff       	jmp    101be8 <__alltraps>

00101d7f <vector43>:
.globl vector43
vector43:
  pushl $0
  101d7f:	6a 00                	push   $0x0
  pushl $43
  101d81:	6a 2b                	push   $0x2b
  jmp __alltraps
  101d83:	e9 60 fe ff ff       	jmp    101be8 <__alltraps>

00101d88 <vector44>:
.globl vector44
vector44:
  pushl $0
  101d88:	6a 00                	push   $0x0
  pushl $44
  101d8a:	6a 2c                	push   $0x2c
  jmp __alltraps
  101d8c:	e9 57 fe ff ff       	jmp    101be8 <__alltraps>

00101d91 <vector45>:
.globl vector45
vector45:
  pushl $0
  101d91:	6a 00                	push   $0x0
  pushl $45
  101d93:	6a 2d                	push   $0x2d
  jmp __alltraps
  101d95:	e9 4e fe ff ff       	jmp    101be8 <__alltraps>

00101d9a <vector46>:
.globl vector46
vector46:
  pushl $0
  101d9a:	6a 00                	push   $0x0
  pushl $46
  101d9c:	6a 2e                	push   $0x2e
  jmp __alltraps
  101d9e:	e9 45 fe ff ff       	jmp    101be8 <__alltraps>

00101da3 <vector47>:
.globl vector47
vector47:
  pushl $0
  101da3:	6a 00                	push   $0x0
  pushl $47
  101da5:	6a 2f                	push   $0x2f
  jmp __alltraps
  101da7:	e9 3c fe ff ff       	jmp    101be8 <__alltraps>

00101dac <vector48>:
.globl vector48
vector48:
  pushl $0
  101dac:	6a 00                	push   $0x0
  pushl $48
  101dae:	6a 30                	push   $0x30
  jmp __alltraps
  101db0:	e9 33 fe ff ff       	jmp    101be8 <__alltraps>

00101db5 <vector49>:
.globl vector49
vector49:
  pushl $0
  101db5:	6a 00                	push   $0x0
  pushl $49
  101db7:	6a 31                	push   $0x31
  jmp __alltraps
  101db9:	e9 2a fe ff ff       	jmp    101be8 <__alltraps>

00101dbe <vector50>:
.globl vector50
vector50:
  pushl $0
  101dbe:	6a 00                	push   $0x0
  pushl $50
  101dc0:	6a 32                	push   $0x32
  jmp __alltraps
  101dc2:	e9 21 fe ff ff       	jmp    101be8 <__alltraps>

00101dc7 <vector51>:
.globl vector51
vector51:
  pushl $0
  101dc7:	6a 00                	push   $0x0
  pushl $51
  101dc9:	6a 33                	push   $0x33
  jmp __alltraps
  101dcb:	e9 18 fe ff ff       	jmp    101be8 <__alltraps>

00101dd0 <vector52>:
.globl vector52
vector52:
  pushl $0
  101dd0:	6a 00                	push   $0x0
  pushl $52
  101dd2:	6a 34                	push   $0x34
  jmp __alltraps
  101dd4:	e9 0f fe ff ff       	jmp    101be8 <__alltraps>

00101dd9 <vector53>:
.globl vector53
vector53:
  pushl $0
  101dd9:	6a 00                	push   $0x0
  pushl $53
  101ddb:	6a 35                	push   $0x35
  jmp __alltraps
  101ddd:	e9 06 fe ff ff       	jmp    101be8 <__alltraps>

00101de2 <vector54>:
.globl vector54
vector54:
  pushl $0
  101de2:	6a 00                	push   $0x0
  pushl $54
  101de4:	6a 36                	push   $0x36
  jmp __alltraps
  101de6:	e9 fd fd ff ff       	jmp    101be8 <__alltraps>

00101deb <vector55>:
.globl vector55
vector55:
  pushl $0
  101deb:	6a 00                	push   $0x0
  pushl $55
  101ded:	6a 37                	push   $0x37
  jmp __alltraps
  101def:	e9 f4 fd ff ff       	jmp    101be8 <__alltraps>

00101df4 <vector56>:
.globl vector56
vector56:
  pushl $0
  101df4:	6a 00                	push   $0x0
  pushl $56
  101df6:	6a 38                	push   $0x38
  jmp __alltraps
  101df8:	e9 eb fd ff ff       	jmp    101be8 <__alltraps>

00101dfd <vector57>:
.globl vector57
vector57:
  pushl $0
  101dfd:	6a 00                	push   $0x0
  pushl $57
  101dff:	6a 39                	push   $0x39
  jmp __alltraps
  101e01:	e9 e2 fd ff ff       	jmp    101be8 <__alltraps>

00101e06 <vector58>:
.globl vector58
vector58:
  pushl $0
  101e06:	6a 00                	push   $0x0
  pushl $58
  101e08:	6a 3a                	push   $0x3a
  jmp __alltraps
  101e0a:	e9 d9 fd ff ff       	jmp    101be8 <__alltraps>

00101e0f <vector59>:
.globl vector59
vector59:
  pushl $0
  101e0f:	6a 00                	push   $0x0
  pushl $59
  101e11:	6a 3b                	push   $0x3b
  jmp __alltraps
  101e13:	e9 d0 fd ff ff       	jmp    101be8 <__alltraps>

00101e18 <vector60>:
.globl vector60
vector60:
  pushl $0
  101e18:	6a 00                	push   $0x0
  pushl $60
  101e1a:	6a 3c                	push   $0x3c
  jmp __alltraps
  101e1c:	e9 c7 fd ff ff       	jmp    101be8 <__alltraps>

00101e21 <vector61>:
.globl vector61
vector61:
  pushl $0
  101e21:	6a 00                	push   $0x0
  pushl $61
  101e23:	6a 3d                	push   $0x3d
  jmp __alltraps
  101e25:	e9 be fd ff ff       	jmp    101be8 <__alltraps>

00101e2a <vector62>:
.globl vector62
vector62:
  pushl $0
  101e2a:	6a 00                	push   $0x0
  pushl $62
  101e2c:	6a 3e                	push   $0x3e
  jmp __alltraps
  101e2e:	e9 b5 fd ff ff       	jmp    101be8 <__alltraps>

00101e33 <vector63>:
.globl vector63
vector63:
  pushl $0
  101e33:	6a 00                	push   $0x0
  pushl $63
  101e35:	6a 3f                	push   $0x3f
  jmp __alltraps
  101e37:	e9 ac fd ff ff       	jmp    101be8 <__alltraps>

00101e3c <vector64>:
.globl vector64
vector64:
  pushl $0
  101e3c:	6a 00                	push   $0x0
  pushl $64
  101e3e:	6a 40                	push   $0x40
  jmp __alltraps
  101e40:	e9 a3 fd ff ff       	jmp    101be8 <__alltraps>

00101e45 <vector65>:
.globl vector65
vector65:
  pushl $0
  101e45:	6a 00                	push   $0x0
  pushl $65
  101e47:	6a 41                	push   $0x41
  jmp __alltraps
  101e49:	e9 9a fd ff ff       	jmp    101be8 <__alltraps>

00101e4e <vector66>:
.globl vector66
vector66:
  pushl $0
  101e4e:	6a 00                	push   $0x0
  pushl $66
  101e50:	6a 42                	push   $0x42
  jmp __alltraps
  101e52:	e9 91 fd ff ff       	jmp    101be8 <__alltraps>

00101e57 <vector67>:
.globl vector67
vector67:
  pushl $0
  101e57:	6a 00                	push   $0x0
  pushl $67
  101e59:	6a 43                	push   $0x43
  jmp __alltraps
  101e5b:	e9 88 fd ff ff       	jmp    101be8 <__alltraps>

00101e60 <vector68>:
.globl vector68
vector68:
  pushl $0
  101e60:	6a 00                	push   $0x0
  pushl $68
  101e62:	6a 44                	push   $0x44
  jmp __alltraps
  101e64:	e9 7f fd ff ff       	jmp    101be8 <__alltraps>

00101e69 <vector69>:
.globl vector69
vector69:
  pushl $0
  101e69:	6a 00                	push   $0x0
  pushl $69
  101e6b:	6a 45                	push   $0x45
  jmp __alltraps
  101e6d:	e9 76 fd ff ff       	jmp    101be8 <__alltraps>

00101e72 <vector70>:
.globl vector70
vector70:
  pushl $0
  101e72:	6a 00                	push   $0x0
  pushl $70
  101e74:	6a 46                	push   $0x46
  jmp __alltraps
  101e76:	e9 6d fd ff ff       	jmp    101be8 <__alltraps>

00101e7b <vector71>:
.globl vector71
vector71:
  pushl $0
  101e7b:	6a 00                	push   $0x0
  pushl $71
  101e7d:	6a 47                	push   $0x47
  jmp __alltraps
  101e7f:	e9 64 fd ff ff       	jmp    101be8 <__alltraps>

00101e84 <vector72>:
.globl vector72
vector72:
  pushl $0
  101e84:	6a 00                	push   $0x0
  pushl $72
  101e86:	6a 48                	push   $0x48
  jmp __alltraps
  101e88:	e9 5b fd ff ff       	jmp    101be8 <__alltraps>

00101e8d <vector73>:
.globl vector73
vector73:
  pushl $0
  101e8d:	6a 00                	push   $0x0
  pushl $73
  101e8f:	6a 49                	push   $0x49
  jmp __alltraps
  101e91:	e9 52 fd ff ff       	jmp    101be8 <__alltraps>

00101e96 <vector74>:
.globl vector74
vector74:
  pushl $0
  101e96:	6a 00                	push   $0x0
  pushl $74
  101e98:	6a 4a                	push   $0x4a
  jmp __alltraps
  101e9a:	e9 49 fd ff ff       	jmp    101be8 <__alltraps>

00101e9f <vector75>:
.globl vector75
vector75:
  pushl $0
  101e9f:	6a 00                	push   $0x0
  pushl $75
  101ea1:	6a 4b                	push   $0x4b
  jmp __alltraps
  101ea3:	e9 40 fd ff ff       	jmp    101be8 <__alltraps>

00101ea8 <vector76>:
.globl vector76
vector76:
  pushl $0
  101ea8:	6a 00                	push   $0x0
  pushl $76
  101eaa:	6a 4c                	push   $0x4c
  jmp __alltraps
  101eac:	e9 37 fd ff ff       	jmp    101be8 <__alltraps>

00101eb1 <vector77>:
.globl vector77
vector77:
  pushl $0
  101eb1:	6a 00                	push   $0x0
  pushl $77
  101eb3:	6a 4d                	push   $0x4d
  jmp __alltraps
  101eb5:	e9 2e fd ff ff       	jmp    101be8 <__alltraps>

00101eba <vector78>:
.globl vector78
vector78:
  pushl $0
  101eba:	6a 00                	push   $0x0
  pushl $78
  101ebc:	6a 4e                	push   $0x4e
  jmp __alltraps
  101ebe:	e9 25 fd ff ff       	jmp    101be8 <__alltraps>

00101ec3 <vector79>:
.globl vector79
vector79:
  pushl $0
  101ec3:	6a 00                	push   $0x0
  pushl $79
  101ec5:	6a 4f                	push   $0x4f
  jmp __alltraps
  101ec7:	e9 1c fd ff ff       	jmp    101be8 <__alltraps>

00101ecc <vector80>:
.globl vector80
vector80:
  pushl $0
  101ecc:	6a 00                	push   $0x0
  pushl $80
  101ece:	6a 50                	push   $0x50
  jmp __alltraps
  101ed0:	e9 13 fd ff ff       	jmp    101be8 <__alltraps>

00101ed5 <vector81>:
.globl vector81
vector81:
  pushl $0
  101ed5:	6a 00                	push   $0x0
  pushl $81
  101ed7:	6a 51                	push   $0x51
  jmp __alltraps
  101ed9:	e9 0a fd ff ff       	jmp    101be8 <__alltraps>

00101ede <vector82>:
.globl vector82
vector82:
  pushl $0
  101ede:	6a 00                	push   $0x0
  pushl $82
  101ee0:	6a 52                	push   $0x52
  jmp __alltraps
  101ee2:	e9 01 fd ff ff       	jmp    101be8 <__alltraps>

00101ee7 <vector83>:
.globl vector83
vector83:
  pushl $0
  101ee7:	6a 00                	push   $0x0
  pushl $83
  101ee9:	6a 53                	push   $0x53
  jmp __alltraps
  101eeb:	e9 f8 fc ff ff       	jmp    101be8 <__alltraps>

00101ef0 <vector84>:
.globl vector84
vector84:
  pushl $0
  101ef0:	6a 00                	push   $0x0
  pushl $84
  101ef2:	6a 54                	push   $0x54
  jmp __alltraps
  101ef4:	e9 ef fc ff ff       	jmp    101be8 <__alltraps>

00101ef9 <vector85>:
.globl vector85
vector85:
  pushl $0
  101ef9:	6a 00                	push   $0x0
  pushl $85
  101efb:	6a 55                	push   $0x55
  jmp __alltraps
  101efd:	e9 e6 fc ff ff       	jmp    101be8 <__alltraps>

00101f02 <vector86>:
.globl vector86
vector86:
  pushl $0
  101f02:	6a 00                	push   $0x0
  pushl $86
  101f04:	6a 56                	push   $0x56
  jmp __alltraps
  101f06:	e9 dd fc ff ff       	jmp    101be8 <__alltraps>

00101f0b <vector87>:
.globl vector87
vector87:
  pushl $0
  101f0b:	6a 00                	push   $0x0
  pushl $87
  101f0d:	6a 57                	push   $0x57
  jmp __alltraps
  101f0f:	e9 d4 fc ff ff       	jmp    101be8 <__alltraps>

00101f14 <vector88>:
.globl vector88
vector88:
  pushl $0
  101f14:	6a 00                	push   $0x0
  pushl $88
  101f16:	6a 58                	push   $0x58
  jmp __alltraps
  101f18:	e9 cb fc ff ff       	jmp    101be8 <__alltraps>

00101f1d <vector89>:
.globl vector89
vector89:
  pushl $0
  101f1d:	6a 00                	push   $0x0
  pushl $89
  101f1f:	6a 59                	push   $0x59
  jmp __alltraps
  101f21:	e9 c2 fc ff ff       	jmp    101be8 <__alltraps>

00101f26 <vector90>:
.globl vector90
vector90:
  pushl $0
  101f26:	6a 00                	push   $0x0
  pushl $90
  101f28:	6a 5a                	push   $0x5a
  jmp __alltraps
  101f2a:	e9 b9 fc ff ff       	jmp    101be8 <__alltraps>

00101f2f <vector91>:
.globl vector91
vector91:
  pushl $0
  101f2f:	6a 00                	push   $0x0
  pushl $91
  101f31:	6a 5b                	push   $0x5b
  jmp __alltraps
  101f33:	e9 b0 fc ff ff       	jmp    101be8 <__alltraps>

00101f38 <vector92>:
.globl vector92
vector92:
  pushl $0
  101f38:	6a 00                	push   $0x0
  pushl $92
  101f3a:	6a 5c                	push   $0x5c
  jmp __alltraps
  101f3c:	e9 a7 fc ff ff       	jmp    101be8 <__alltraps>

00101f41 <vector93>:
.globl vector93
vector93:
  pushl $0
  101f41:	6a 00                	push   $0x0
  pushl $93
  101f43:	6a 5d                	push   $0x5d
  jmp __alltraps
  101f45:	e9 9e fc ff ff       	jmp    101be8 <__alltraps>

00101f4a <vector94>:
.globl vector94
vector94:
  pushl $0
  101f4a:	6a 00                	push   $0x0
  pushl $94
  101f4c:	6a 5e                	push   $0x5e
  jmp __alltraps
  101f4e:	e9 95 fc ff ff       	jmp    101be8 <__alltraps>

00101f53 <vector95>:
.globl vector95
vector95:
  pushl $0
  101f53:	6a 00                	push   $0x0
  pushl $95
  101f55:	6a 5f                	push   $0x5f
  jmp __alltraps
  101f57:	e9 8c fc ff ff       	jmp    101be8 <__alltraps>

00101f5c <vector96>:
.globl vector96
vector96:
  pushl $0
  101f5c:	6a 00                	push   $0x0
  pushl $96
  101f5e:	6a 60                	push   $0x60
  jmp __alltraps
  101f60:	e9 83 fc ff ff       	jmp    101be8 <__alltraps>

00101f65 <vector97>:
.globl vector97
vector97:
  pushl $0
  101f65:	6a 00                	push   $0x0
  pushl $97
  101f67:	6a 61                	push   $0x61
  jmp __alltraps
  101f69:	e9 7a fc ff ff       	jmp    101be8 <__alltraps>

00101f6e <vector98>:
.globl vector98
vector98:
  pushl $0
  101f6e:	6a 00                	push   $0x0
  pushl $98
  101f70:	6a 62                	push   $0x62
  jmp __alltraps
  101f72:	e9 71 fc ff ff       	jmp    101be8 <__alltraps>

00101f77 <vector99>:
.globl vector99
vector99:
  pushl $0
  101f77:	6a 00                	push   $0x0
  pushl $99
  101f79:	6a 63                	push   $0x63
  jmp __alltraps
  101f7b:	e9 68 fc ff ff       	jmp    101be8 <__alltraps>

00101f80 <vector100>:
.globl vector100
vector100:
  pushl $0
  101f80:	6a 00                	push   $0x0
  pushl $100
  101f82:	6a 64                	push   $0x64
  jmp __alltraps
  101f84:	e9 5f fc ff ff       	jmp    101be8 <__alltraps>

00101f89 <vector101>:
.globl vector101
vector101:
  pushl $0
  101f89:	6a 00                	push   $0x0
  pushl $101
  101f8b:	6a 65                	push   $0x65
  jmp __alltraps
  101f8d:	e9 56 fc ff ff       	jmp    101be8 <__alltraps>

00101f92 <vector102>:
.globl vector102
vector102:
  pushl $0
  101f92:	6a 00                	push   $0x0
  pushl $102
  101f94:	6a 66                	push   $0x66
  jmp __alltraps
  101f96:	e9 4d fc ff ff       	jmp    101be8 <__alltraps>

00101f9b <vector103>:
.globl vector103
vector103:
  pushl $0
  101f9b:	6a 00                	push   $0x0
  pushl $103
  101f9d:	6a 67                	push   $0x67
  jmp __alltraps
  101f9f:	e9 44 fc ff ff       	jmp    101be8 <__alltraps>

00101fa4 <vector104>:
.globl vector104
vector104:
  pushl $0
  101fa4:	6a 00                	push   $0x0
  pushl $104
  101fa6:	6a 68                	push   $0x68
  jmp __alltraps
  101fa8:	e9 3b fc ff ff       	jmp    101be8 <__alltraps>

00101fad <vector105>:
.globl vector105
vector105:
  pushl $0
  101fad:	6a 00                	push   $0x0
  pushl $105
  101faf:	6a 69                	push   $0x69
  jmp __alltraps
  101fb1:	e9 32 fc ff ff       	jmp    101be8 <__alltraps>

00101fb6 <vector106>:
.globl vector106
vector106:
  pushl $0
  101fb6:	6a 00                	push   $0x0
  pushl $106
  101fb8:	6a 6a                	push   $0x6a
  jmp __alltraps
  101fba:	e9 29 fc ff ff       	jmp    101be8 <__alltraps>

00101fbf <vector107>:
.globl vector107
vector107:
  pushl $0
  101fbf:	6a 00                	push   $0x0
  pushl $107
  101fc1:	6a 6b                	push   $0x6b
  jmp __alltraps
  101fc3:	e9 20 fc ff ff       	jmp    101be8 <__alltraps>

00101fc8 <vector108>:
.globl vector108
vector108:
  pushl $0
  101fc8:	6a 00                	push   $0x0
  pushl $108
  101fca:	6a 6c                	push   $0x6c
  jmp __alltraps
  101fcc:	e9 17 fc ff ff       	jmp    101be8 <__alltraps>

00101fd1 <vector109>:
.globl vector109
vector109:
  pushl $0
  101fd1:	6a 00                	push   $0x0
  pushl $109
  101fd3:	6a 6d                	push   $0x6d
  jmp __alltraps
  101fd5:	e9 0e fc ff ff       	jmp    101be8 <__alltraps>

00101fda <vector110>:
.globl vector110
vector110:
  pushl $0
  101fda:	6a 00                	push   $0x0
  pushl $110
  101fdc:	6a 6e                	push   $0x6e
  jmp __alltraps
  101fde:	e9 05 fc ff ff       	jmp    101be8 <__alltraps>

00101fe3 <vector111>:
.globl vector111
vector111:
  pushl $0
  101fe3:	6a 00                	push   $0x0
  pushl $111
  101fe5:	6a 6f                	push   $0x6f
  jmp __alltraps
  101fe7:	e9 fc fb ff ff       	jmp    101be8 <__alltraps>

00101fec <vector112>:
.globl vector112
vector112:
  pushl $0
  101fec:	6a 00                	push   $0x0
  pushl $112
  101fee:	6a 70                	push   $0x70
  jmp __alltraps
  101ff0:	e9 f3 fb ff ff       	jmp    101be8 <__alltraps>

00101ff5 <vector113>:
.globl vector113
vector113:
  pushl $0
  101ff5:	6a 00                	push   $0x0
  pushl $113
  101ff7:	6a 71                	push   $0x71
  jmp __alltraps
  101ff9:	e9 ea fb ff ff       	jmp    101be8 <__alltraps>

00101ffe <vector114>:
.globl vector114
vector114:
  pushl $0
  101ffe:	6a 00                	push   $0x0
  pushl $114
  102000:	6a 72                	push   $0x72
  jmp __alltraps
  102002:	e9 e1 fb ff ff       	jmp    101be8 <__alltraps>

00102007 <vector115>:
.globl vector115
vector115:
  pushl $0
  102007:	6a 00                	push   $0x0
  pushl $115
  102009:	6a 73                	push   $0x73
  jmp __alltraps
  10200b:	e9 d8 fb ff ff       	jmp    101be8 <__alltraps>

00102010 <vector116>:
.globl vector116
vector116:
  pushl $0
  102010:	6a 00                	push   $0x0
  pushl $116
  102012:	6a 74                	push   $0x74
  jmp __alltraps
  102014:	e9 cf fb ff ff       	jmp    101be8 <__alltraps>

00102019 <vector117>:
.globl vector117
vector117:
  pushl $0
  102019:	6a 00                	push   $0x0
  pushl $117
  10201b:	6a 75                	push   $0x75
  jmp __alltraps
  10201d:	e9 c6 fb ff ff       	jmp    101be8 <__alltraps>

00102022 <vector118>:
.globl vector118
vector118:
  pushl $0
  102022:	6a 00                	push   $0x0
  pushl $118
  102024:	6a 76                	push   $0x76
  jmp __alltraps
  102026:	e9 bd fb ff ff       	jmp    101be8 <__alltraps>

0010202b <vector119>:
.globl vector119
vector119:
  pushl $0
  10202b:	6a 00                	push   $0x0
  pushl $119
  10202d:	6a 77                	push   $0x77
  jmp __alltraps
  10202f:	e9 b4 fb ff ff       	jmp    101be8 <__alltraps>

00102034 <vector120>:
.globl vector120
vector120:
  pushl $0
  102034:	6a 00                	push   $0x0
  pushl $120
  102036:	6a 78                	push   $0x78
  jmp __alltraps
  102038:	e9 ab fb ff ff       	jmp    101be8 <__alltraps>

0010203d <vector121>:
.globl vector121
vector121:
  pushl $0
  10203d:	6a 00                	push   $0x0
  pushl $121
  10203f:	6a 79                	push   $0x79
  jmp __alltraps
  102041:	e9 a2 fb ff ff       	jmp    101be8 <__alltraps>

00102046 <vector122>:
.globl vector122
vector122:
  pushl $0
  102046:	6a 00                	push   $0x0
  pushl $122
  102048:	6a 7a                	push   $0x7a
  jmp __alltraps
  10204a:	e9 99 fb ff ff       	jmp    101be8 <__alltraps>

0010204f <vector123>:
.globl vector123
vector123:
  pushl $0
  10204f:	6a 00                	push   $0x0
  pushl $123
  102051:	6a 7b                	push   $0x7b
  jmp __alltraps
  102053:	e9 90 fb ff ff       	jmp    101be8 <__alltraps>

00102058 <vector124>:
.globl vector124
vector124:
  pushl $0
  102058:	6a 00                	push   $0x0
  pushl $124
  10205a:	6a 7c                	push   $0x7c
  jmp __alltraps
  10205c:	e9 87 fb ff ff       	jmp    101be8 <__alltraps>

00102061 <vector125>:
.globl vector125
vector125:
  pushl $0
  102061:	6a 00                	push   $0x0
  pushl $125
  102063:	6a 7d                	push   $0x7d
  jmp __alltraps
  102065:	e9 7e fb ff ff       	jmp    101be8 <__alltraps>

0010206a <vector126>:
.globl vector126
vector126:
  pushl $0
  10206a:	6a 00                	push   $0x0
  pushl $126
  10206c:	6a 7e                	push   $0x7e
  jmp __alltraps
  10206e:	e9 75 fb ff ff       	jmp    101be8 <__alltraps>

00102073 <vector127>:
.globl vector127
vector127:
  pushl $0
  102073:	6a 00                	push   $0x0
  pushl $127
  102075:	6a 7f                	push   $0x7f
  jmp __alltraps
  102077:	e9 6c fb ff ff       	jmp    101be8 <__alltraps>

0010207c <vector128>:
.globl vector128
vector128:
  pushl $0
  10207c:	6a 00                	push   $0x0
  pushl $128
  10207e:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102083:	e9 60 fb ff ff       	jmp    101be8 <__alltraps>

00102088 <vector129>:
.globl vector129
vector129:
  pushl $0
  102088:	6a 00                	push   $0x0
  pushl $129
  10208a:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10208f:	e9 54 fb ff ff       	jmp    101be8 <__alltraps>

00102094 <vector130>:
.globl vector130
vector130:
  pushl $0
  102094:	6a 00                	push   $0x0
  pushl $130
  102096:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  10209b:	e9 48 fb ff ff       	jmp    101be8 <__alltraps>

001020a0 <vector131>:
.globl vector131
vector131:
  pushl $0
  1020a0:	6a 00                	push   $0x0
  pushl $131
  1020a2:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  1020a7:	e9 3c fb ff ff       	jmp    101be8 <__alltraps>

001020ac <vector132>:
.globl vector132
vector132:
  pushl $0
  1020ac:	6a 00                	push   $0x0
  pushl $132
  1020ae:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  1020b3:	e9 30 fb ff ff       	jmp    101be8 <__alltraps>

001020b8 <vector133>:
.globl vector133
vector133:
  pushl $0
  1020b8:	6a 00                	push   $0x0
  pushl $133
  1020ba:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  1020bf:	e9 24 fb ff ff       	jmp    101be8 <__alltraps>

001020c4 <vector134>:
.globl vector134
vector134:
  pushl $0
  1020c4:	6a 00                	push   $0x0
  pushl $134
  1020c6:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  1020cb:	e9 18 fb ff ff       	jmp    101be8 <__alltraps>

001020d0 <vector135>:
.globl vector135
vector135:
  pushl $0
  1020d0:	6a 00                	push   $0x0
  pushl $135
  1020d2:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1020d7:	e9 0c fb ff ff       	jmp    101be8 <__alltraps>

001020dc <vector136>:
.globl vector136
vector136:
  pushl $0
  1020dc:	6a 00                	push   $0x0
  pushl $136
  1020de:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1020e3:	e9 00 fb ff ff       	jmp    101be8 <__alltraps>

001020e8 <vector137>:
.globl vector137
vector137:
  pushl $0
  1020e8:	6a 00                	push   $0x0
  pushl $137
  1020ea:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1020ef:	e9 f4 fa ff ff       	jmp    101be8 <__alltraps>

001020f4 <vector138>:
.globl vector138
vector138:
  pushl $0
  1020f4:	6a 00                	push   $0x0
  pushl $138
  1020f6:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1020fb:	e9 e8 fa ff ff       	jmp    101be8 <__alltraps>

00102100 <vector139>:
.globl vector139
vector139:
  pushl $0
  102100:	6a 00                	push   $0x0
  pushl $139
  102102:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102107:	e9 dc fa ff ff       	jmp    101be8 <__alltraps>

0010210c <vector140>:
.globl vector140
vector140:
  pushl $0
  10210c:	6a 00                	push   $0x0
  pushl $140
  10210e:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102113:	e9 d0 fa ff ff       	jmp    101be8 <__alltraps>

00102118 <vector141>:
.globl vector141
vector141:
  pushl $0
  102118:	6a 00                	push   $0x0
  pushl $141
  10211a:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  10211f:	e9 c4 fa ff ff       	jmp    101be8 <__alltraps>

00102124 <vector142>:
.globl vector142
vector142:
  pushl $0
  102124:	6a 00                	push   $0x0
  pushl $142
  102126:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  10212b:	e9 b8 fa ff ff       	jmp    101be8 <__alltraps>

00102130 <vector143>:
.globl vector143
vector143:
  pushl $0
  102130:	6a 00                	push   $0x0
  pushl $143
  102132:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102137:	e9 ac fa ff ff       	jmp    101be8 <__alltraps>

0010213c <vector144>:
.globl vector144
vector144:
  pushl $0
  10213c:	6a 00                	push   $0x0
  pushl $144
  10213e:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102143:	e9 a0 fa ff ff       	jmp    101be8 <__alltraps>

00102148 <vector145>:
.globl vector145
vector145:
  pushl $0
  102148:	6a 00                	push   $0x0
  pushl $145
  10214a:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  10214f:	e9 94 fa ff ff       	jmp    101be8 <__alltraps>

00102154 <vector146>:
.globl vector146
vector146:
  pushl $0
  102154:	6a 00                	push   $0x0
  pushl $146
  102156:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  10215b:	e9 88 fa ff ff       	jmp    101be8 <__alltraps>

00102160 <vector147>:
.globl vector147
vector147:
  pushl $0
  102160:	6a 00                	push   $0x0
  pushl $147
  102162:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102167:	e9 7c fa ff ff       	jmp    101be8 <__alltraps>

0010216c <vector148>:
.globl vector148
vector148:
  pushl $0
  10216c:	6a 00                	push   $0x0
  pushl $148
  10216e:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102173:	e9 70 fa ff ff       	jmp    101be8 <__alltraps>

00102178 <vector149>:
.globl vector149
vector149:
  pushl $0
  102178:	6a 00                	push   $0x0
  pushl $149
  10217a:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10217f:	e9 64 fa ff ff       	jmp    101be8 <__alltraps>

00102184 <vector150>:
.globl vector150
vector150:
  pushl $0
  102184:	6a 00                	push   $0x0
  pushl $150
  102186:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  10218b:	e9 58 fa ff ff       	jmp    101be8 <__alltraps>

00102190 <vector151>:
.globl vector151
vector151:
  pushl $0
  102190:	6a 00                	push   $0x0
  pushl $151
  102192:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102197:	e9 4c fa ff ff       	jmp    101be8 <__alltraps>

0010219c <vector152>:
.globl vector152
vector152:
  pushl $0
  10219c:	6a 00                	push   $0x0
  pushl $152
  10219e:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  1021a3:	e9 40 fa ff ff       	jmp    101be8 <__alltraps>

001021a8 <vector153>:
.globl vector153
vector153:
  pushl $0
  1021a8:	6a 00                	push   $0x0
  pushl $153
  1021aa:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  1021af:	e9 34 fa ff ff       	jmp    101be8 <__alltraps>

001021b4 <vector154>:
.globl vector154
vector154:
  pushl $0
  1021b4:	6a 00                	push   $0x0
  pushl $154
  1021b6:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  1021bb:	e9 28 fa ff ff       	jmp    101be8 <__alltraps>

001021c0 <vector155>:
.globl vector155
vector155:
  pushl $0
  1021c0:	6a 00                	push   $0x0
  pushl $155
  1021c2:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  1021c7:	e9 1c fa ff ff       	jmp    101be8 <__alltraps>

001021cc <vector156>:
.globl vector156
vector156:
  pushl $0
  1021cc:	6a 00                	push   $0x0
  pushl $156
  1021ce:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1021d3:	e9 10 fa ff ff       	jmp    101be8 <__alltraps>

001021d8 <vector157>:
.globl vector157
vector157:
  pushl $0
  1021d8:	6a 00                	push   $0x0
  pushl $157
  1021da:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1021df:	e9 04 fa ff ff       	jmp    101be8 <__alltraps>

001021e4 <vector158>:
.globl vector158
vector158:
  pushl $0
  1021e4:	6a 00                	push   $0x0
  pushl $158
  1021e6:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1021eb:	e9 f8 f9 ff ff       	jmp    101be8 <__alltraps>

001021f0 <vector159>:
.globl vector159
vector159:
  pushl $0
  1021f0:	6a 00                	push   $0x0
  pushl $159
  1021f2:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1021f7:	e9 ec f9 ff ff       	jmp    101be8 <__alltraps>

001021fc <vector160>:
.globl vector160
vector160:
  pushl $0
  1021fc:	6a 00                	push   $0x0
  pushl $160
  1021fe:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102203:	e9 e0 f9 ff ff       	jmp    101be8 <__alltraps>

00102208 <vector161>:
.globl vector161
vector161:
  pushl $0
  102208:	6a 00                	push   $0x0
  pushl $161
  10220a:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  10220f:	e9 d4 f9 ff ff       	jmp    101be8 <__alltraps>

00102214 <vector162>:
.globl vector162
vector162:
  pushl $0
  102214:	6a 00                	push   $0x0
  pushl $162
  102216:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  10221b:	e9 c8 f9 ff ff       	jmp    101be8 <__alltraps>

00102220 <vector163>:
.globl vector163
vector163:
  pushl $0
  102220:	6a 00                	push   $0x0
  pushl $163
  102222:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102227:	e9 bc f9 ff ff       	jmp    101be8 <__alltraps>

0010222c <vector164>:
.globl vector164
vector164:
  pushl $0
  10222c:	6a 00                	push   $0x0
  pushl $164
  10222e:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102233:	e9 b0 f9 ff ff       	jmp    101be8 <__alltraps>

00102238 <vector165>:
.globl vector165
vector165:
  pushl $0
  102238:	6a 00                	push   $0x0
  pushl $165
  10223a:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  10223f:	e9 a4 f9 ff ff       	jmp    101be8 <__alltraps>

00102244 <vector166>:
.globl vector166
vector166:
  pushl $0
  102244:	6a 00                	push   $0x0
  pushl $166
  102246:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  10224b:	e9 98 f9 ff ff       	jmp    101be8 <__alltraps>

00102250 <vector167>:
.globl vector167
vector167:
  pushl $0
  102250:	6a 00                	push   $0x0
  pushl $167
  102252:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102257:	e9 8c f9 ff ff       	jmp    101be8 <__alltraps>

0010225c <vector168>:
.globl vector168
vector168:
  pushl $0
  10225c:	6a 00                	push   $0x0
  pushl $168
  10225e:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102263:	e9 80 f9 ff ff       	jmp    101be8 <__alltraps>

00102268 <vector169>:
.globl vector169
vector169:
  pushl $0
  102268:	6a 00                	push   $0x0
  pushl $169
  10226a:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10226f:	e9 74 f9 ff ff       	jmp    101be8 <__alltraps>

00102274 <vector170>:
.globl vector170
vector170:
  pushl $0
  102274:	6a 00                	push   $0x0
  pushl $170
  102276:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  10227b:	e9 68 f9 ff ff       	jmp    101be8 <__alltraps>

00102280 <vector171>:
.globl vector171
vector171:
  pushl $0
  102280:	6a 00                	push   $0x0
  pushl $171
  102282:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102287:	e9 5c f9 ff ff       	jmp    101be8 <__alltraps>

0010228c <vector172>:
.globl vector172
vector172:
  pushl $0
  10228c:	6a 00                	push   $0x0
  pushl $172
  10228e:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102293:	e9 50 f9 ff ff       	jmp    101be8 <__alltraps>

00102298 <vector173>:
.globl vector173
vector173:
  pushl $0
  102298:	6a 00                	push   $0x0
  pushl $173
  10229a:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10229f:	e9 44 f9 ff ff       	jmp    101be8 <__alltraps>

001022a4 <vector174>:
.globl vector174
vector174:
  pushl $0
  1022a4:	6a 00                	push   $0x0
  pushl $174
  1022a6:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  1022ab:	e9 38 f9 ff ff       	jmp    101be8 <__alltraps>

001022b0 <vector175>:
.globl vector175
vector175:
  pushl $0
  1022b0:	6a 00                	push   $0x0
  pushl $175
  1022b2:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  1022b7:	e9 2c f9 ff ff       	jmp    101be8 <__alltraps>

001022bc <vector176>:
.globl vector176
vector176:
  pushl $0
  1022bc:	6a 00                	push   $0x0
  pushl $176
  1022be:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  1022c3:	e9 20 f9 ff ff       	jmp    101be8 <__alltraps>

001022c8 <vector177>:
.globl vector177
vector177:
  pushl $0
  1022c8:	6a 00                	push   $0x0
  pushl $177
  1022ca:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1022cf:	e9 14 f9 ff ff       	jmp    101be8 <__alltraps>

001022d4 <vector178>:
.globl vector178
vector178:
  pushl $0
  1022d4:	6a 00                	push   $0x0
  pushl $178
  1022d6:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1022db:	e9 08 f9 ff ff       	jmp    101be8 <__alltraps>

001022e0 <vector179>:
.globl vector179
vector179:
  pushl $0
  1022e0:	6a 00                	push   $0x0
  pushl $179
  1022e2:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1022e7:	e9 fc f8 ff ff       	jmp    101be8 <__alltraps>

001022ec <vector180>:
.globl vector180
vector180:
  pushl $0
  1022ec:	6a 00                	push   $0x0
  pushl $180
  1022ee:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1022f3:	e9 f0 f8 ff ff       	jmp    101be8 <__alltraps>

001022f8 <vector181>:
.globl vector181
vector181:
  pushl $0
  1022f8:	6a 00                	push   $0x0
  pushl $181
  1022fa:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1022ff:	e9 e4 f8 ff ff       	jmp    101be8 <__alltraps>

00102304 <vector182>:
.globl vector182
vector182:
  pushl $0
  102304:	6a 00                	push   $0x0
  pushl $182
  102306:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  10230b:	e9 d8 f8 ff ff       	jmp    101be8 <__alltraps>

00102310 <vector183>:
.globl vector183
vector183:
  pushl $0
  102310:	6a 00                	push   $0x0
  pushl $183
  102312:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102317:	e9 cc f8 ff ff       	jmp    101be8 <__alltraps>

0010231c <vector184>:
.globl vector184
vector184:
  pushl $0
  10231c:	6a 00                	push   $0x0
  pushl $184
  10231e:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102323:	e9 c0 f8 ff ff       	jmp    101be8 <__alltraps>

00102328 <vector185>:
.globl vector185
vector185:
  pushl $0
  102328:	6a 00                	push   $0x0
  pushl $185
  10232a:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  10232f:	e9 b4 f8 ff ff       	jmp    101be8 <__alltraps>

00102334 <vector186>:
.globl vector186
vector186:
  pushl $0
  102334:	6a 00                	push   $0x0
  pushl $186
  102336:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  10233b:	e9 a8 f8 ff ff       	jmp    101be8 <__alltraps>

00102340 <vector187>:
.globl vector187
vector187:
  pushl $0
  102340:	6a 00                	push   $0x0
  pushl $187
  102342:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102347:	e9 9c f8 ff ff       	jmp    101be8 <__alltraps>

0010234c <vector188>:
.globl vector188
vector188:
  pushl $0
  10234c:	6a 00                	push   $0x0
  pushl $188
  10234e:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102353:	e9 90 f8 ff ff       	jmp    101be8 <__alltraps>

00102358 <vector189>:
.globl vector189
vector189:
  pushl $0
  102358:	6a 00                	push   $0x0
  pushl $189
  10235a:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10235f:	e9 84 f8 ff ff       	jmp    101be8 <__alltraps>

00102364 <vector190>:
.globl vector190
vector190:
  pushl $0
  102364:	6a 00                	push   $0x0
  pushl $190
  102366:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  10236b:	e9 78 f8 ff ff       	jmp    101be8 <__alltraps>

00102370 <vector191>:
.globl vector191
vector191:
  pushl $0
  102370:	6a 00                	push   $0x0
  pushl $191
  102372:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102377:	e9 6c f8 ff ff       	jmp    101be8 <__alltraps>

0010237c <vector192>:
.globl vector192
vector192:
  pushl $0
  10237c:	6a 00                	push   $0x0
  pushl $192
  10237e:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102383:	e9 60 f8 ff ff       	jmp    101be8 <__alltraps>

00102388 <vector193>:
.globl vector193
vector193:
  pushl $0
  102388:	6a 00                	push   $0x0
  pushl $193
  10238a:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10238f:	e9 54 f8 ff ff       	jmp    101be8 <__alltraps>

00102394 <vector194>:
.globl vector194
vector194:
  pushl $0
  102394:	6a 00                	push   $0x0
  pushl $194
  102396:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  10239b:	e9 48 f8 ff ff       	jmp    101be8 <__alltraps>

001023a0 <vector195>:
.globl vector195
vector195:
  pushl $0
  1023a0:	6a 00                	push   $0x0
  pushl $195
  1023a2:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  1023a7:	e9 3c f8 ff ff       	jmp    101be8 <__alltraps>

001023ac <vector196>:
.globl vector196
vector196:
  pushl $0
  1023ac:	6a 00                	push   $0x0
  pushl $196
  1023ae:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1023b3:	e9 30 f8 ff ff       	jmp    101be8 <__alltraps>

001023b8 <vector197>:
.globl vector197
vector197:
  pushl $0
  1023b8:	6a 00                	push   $0x0
  pushl $197
  1023ba:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  1023bf:	e9 24 f8 ff ff       	jmp    101be8 <__alltraps>

001023c4 <vector198>:
.globl vector198
vector198:
  pushl $0
  1023c4:	6a 00                	push   $0x0
  pushl $198
  1023c6:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  1023cb:	e9 18 f8 ff ff       	jmp    101be8 <__alltraps>

001023d0 <vector199>:
.globl vector199
vector199:
  pushl $0
  1023d0:	6a 00                	push   $0x0
  pushl $199
  1023d2:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1023d7:	e9 0c f8 ff ff       	jmp    101be8 <__alltraps>

001023dc <vector200>:
.globl vector200
vector200:
  pushl $0
  1023dc:	6a 00                	push   $0x0
  pushl $200
  1023de:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1023e3:	e9 00 f8 ff ff       	jmp    101be8 <__alltraps>

001023e8 <vector201>:
.globl vector201
vector201:
  pushl $0
  1023e8:	6a 00                	push   $0x0
  pushl $201
  1023ea:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1023ef:	e9 f4 f7 ff ff       	jmp    101be8 <__alltraps>

001023f4 <vector202>:
.globl vector202
vector202:
  pushl $0
  1023f4:	6a 00                	push   $0x0
  pushl $202
  1023f6:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1023fb:	e9 e8 f7 ff ff       	jmp    101be8 <__alltraps>

00102400 <vector203>:
.globl vector203
vector203:
  pushl $0
  102400:	6a 00                	push   $0x0
  pushl $203
  102402:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102407:	e9 dc f7 ff ff       	jmp    101be8 <__alltraps>

0010240c <vector204>:
.globl vector204
vector204:
  pushl $0
  10240c:	6a 00                	push   $0x0
  pushl $204
  10240e:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102413:	e9 d0 f7 ff ff       	jmp    101be8 <__alltraps>

00102418 <vector205>:
.globl vector205
vector205:
  pushl $0
  102418:	6a 00                	push   $0x0
  pushl $205
  10241a:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  10241f:	e9 c4 f7 ff ff       	jmp    101be8 <__alltraps>

00102424 <vector206>:
.globl vector206
vector206:
  pushl $0
  102424:	6a 00                	push   $0x0
  pushl $206
  102426:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  10242b:	e9 b8 f7 ff ff       	jmp    101be8 <__alltraps>

00102430 <vector207>:
.globl vector207
vector207:
  pushl $0
  102430:	6a 00                	push   $0x0
  pushl $207
  102432:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102437:	e9 ac f7 ff ff       	jmp    101be8 <__alltraps>

0010243c <vector208>:
.globl vector208
vector208:
  pushl $0
  10243c:	6a 00                	push   $0x0
  pushl $208
  10243e:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102443:	e9 a0 f7 ff ff       	jmp    101be8 <__alltraps>

00102448 <vector209>:
.globl vector209
vector209:
  pushl $0
  102448:	6a 00                	push   $0x0
  pushl $209
  10244a:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  10244f:	e9 94 f7 ff ff       	jmp    101be8 <__alltraps>

00102454 <vector210>:
.globl vector210
vector210:
  pushl $0
  102454:	6a 00                	push   $0x0
  pushl $210
  102456:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  10245b:	e9 88 f7 ff ff       	jmp    101be8 <__alltraps>

00102460 <vector211>:
.globl vector211
vector211:
  pushl $0
  102460:	6a 00                	push   $0x0
  pushl $211
  102462:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102467:	e9 7c f7 ff ff       	jmp    101be8 <__alltraps>

0010246c <vector212>:
.globl vector212
vector212:
  pushl $0
  10246c:	6a 00                	push   $0x0
  pushl $212
  10246e:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102473:	e9 70 f7 ff ff       	jmp    101be8 <__alltraps>

00102478 <vector213>:
.globl vector213
vector213:
  pushl $0
  102478:	6a 00                	push   $0x0
  pushl $213
  10247a:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10247f:	e9 64 f7 ff ff       	jmp    101be8 <__alltraps>

00102484 <vector214>:
.globl vector214
vector214:
  pushl $0
  102484:	6a 00                	push   $0x0
  pushl $214
  102486:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  10248b:	e9 58 f7 ff ff       	jmp    101be8 <__alltraps>

00102490 <vector215>:
.globl vector215
vector215:
  pushl $0
  102490:	6a 00                	push   $0x0
  pushl $215
  102492:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102497:	e9 4c f7 ff ff       	jmp    101be8 <__alltraps>

0010249c <vector216>:
.globl vector216
vector216:
  pushl $0
  10249c:	6a 00                	push   $0x0
  pushl $216
  10249e:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  1024a3:	e9 40 f7 ff ff       	jmp    101be8 <__alltraps>

001024a8 <vector217>:
.globl vector217
vector217:
  pushl $0
  1024a8:	6a 00                	push   $0x0
  pushl $217
  1024aa:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  1024af:	e9 34 f7 ff ff       	jmp    101be8 <__alltraps>

001024b4 <vector218>:
.globl vector218
vector218:
  pushl $0
  1024b4:	6a 00                	push   $0x0
  pushl $218
  1024b6:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  1024bb:	e9 28 f7 ff ff       	jmp    101be8 <__alltraps>

001024c0 <vector219>:
.globl vector219
vector219:
  pushl $0
  1024c0:	6a 00                	push   $0x0
  pushl $219
  1024c2:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  1024c7:	e9 1c f7 ff ff       	jmp    101be8 <__alltraps>

001024cc <vector220>:
.globl vector220
vector220:
  pushl $0
  1024cc:	6a 00                	push   $0x0
  pushl $220
  1024ce:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1024d3:	e9 10 f7 ff ff       	jmp    101be8 <__alltraps>

001024d8 <vector221>:
.globl vector221
vector221:
  pushl $0
  1024d8:	6a 00                	push   $0x0
  pushl $221
  1024da:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1024df:	e9 04 f7 ff ff       	jmp    101be8 <__alltraps>

001024e4 <vector222>:
.globl vector222
vector222:
  pushl $0
  1024e4:	6a 00                	push   $0x0
  pushl $222
  1024e6:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1024eb:	e9 f8 f6 ff ff       	jmp    101be8 <__alltraps>

001024f0 <vector223>:
.globl vector223
vector223:
  pushl $0
  1024f0:	6a 00                	push   $0x0
  pushl $223
  1024f2:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1024f7:	e9 ec f6 ff ff       	jmp    101be8 <__alltraps>

001024fc <vector224>:
.globl vector224
vector224:
  pushl $0
  1024fc:	6a 00                	push   $0x0
  pushl $224
  1024fe:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102503:	e9 e0 f6 ff ff       	jmp    101be8 <__alltraps>

00102508 <vector225>:
.globl vector225
vector225:
  pushl $0
  102508:	6a 00                	push   $0x0
  pushl $225
  10250a:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  10250f:	e9 d4 f6 ff ff       	jmp    101be8 <__alltraps>

00102514 <vector226>:
.globl vector226
vector226:
  pushl $0
  102514:	6a 00                	push   $0x0
  pushl $226
  102516:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  10251b:	e9 c8 f6 ff ff       	jmp    101be8 <__alltraps>

00102520 <vector227>:
.globl vector227
vector227:
  pushl $0
  102520:	6a 00                	push   $0x0
  pushl $227
  102522:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102527:	e9 bc f6 ff ff       	jmp    101be8 <__alltraps>

0010252c <vector228>:
.globl vector228
vector228:
  pushl $0
  10252c:	6a 00                	push   $0x0
  pushl $228
  10252e:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102533:	e9 b0 f6 ff ff       	jmp    101be8 <__alltraps>

00102538 <vector229>:
.globl vector229
vector229:
  pushl $0
  102538:	6a 00                	push   $0x0
  pushl $229
  10253a:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  10253f:	e9 a4 f6 ff ff       	jmp    101be8 <__alltraps>

00102544 <vector230>:
.globl vector230
vector230:
  pushl $0
  102544:	6a 00                	push   $0x0
  pushl $230
  102546:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  10254b:	e9 98 f6 ff ff       	jmp    101be8 <__alltraps>

00102550 <vector231>:
.globl vector231
vector231:
  pushl $0
  102550:	6a 00                	push   $0x0
  pushl $231
  102552:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102557:	e9 8c f6 ff ff       	jmp    101be8 <__alltraps>

0010255c <vector232>:
.globl vector232
vector232:
  pushl $0
  10255c:	6a 00                	push   $0x0
  pushl $232
  10255e:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102563:	e9 80 f6 ff ff       	jmp    101be8 <__alltraps>

00102568 <vector233>:
.globl vector233
vector233:
  pushl $0
  102568:	6a 00                	push   $0x0
  pushl $233
  10256a:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10256f:	e9 74 f6 ff ff       	jmp    101be8 <__alltraps>

00102574 <vector234>:
.globl vector234
vector234:
  pushl $0
  102574:	6a 00                	push   $0x0
  pushl $234
  102576:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  10257b:	e9 68 f6 ff ff       	jmp    101be8 <__alltraps>

00102580 <vector235>:
.globl vector235
vector235:
  pushl $0
  102580:	6a 00                	push   $0x0
  pushl $235
  102582:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102587:	e9 5c f6 ff ff       	jmp    101be8 <__alltraps>

0010258c <vector236>:
.globl vector236
vector236:
  pushl $0
  10258c:	6a 00                	push   $0x0
  pushl $236
  10258e:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102593:	e9 50 f6 ff ff       	jmp    101be8 <__alltraps>

00102598 <vector237>:
.globl vector237
vector237:
  pushl $0
  102598:	6a 00                	push   $0x0
  pushl $237
  10259a:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10259f:	e9 44 f6 ff ff       	jmp    101be8 <__alltraps>

001025a4 <vector238>:
.globl vector238
vector238:
  pushl $0
  1025a4:	6a 00                	push   $0x0
  pushl $238
  1025a6:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  1025ab:	e9 38 f6 ff ff       	jmp    101be8 <__alltraps>

001025b0 <vector239>:
.globl vector239
vector239:
  pushl $0
  1025b0:	6a 00                	push   $0x0
  pushl $239
  1025b2:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  1025b7:	e9 2c f6 ff ff       	jmp    101be8 <__alltraps>

001025bc <vector240>:
.globl vector240
vector240:
  pushl $0
  1025bc:	6a 00                	push   $0x0
  pushl $240
  1025be:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  1025c3:	e9 20 f6 ff ff       	jmp    101be8 <__alltraps>

001025c8 <vector241>:
.globl vector241
vector241:
  pushl $0
  1025c8:	6a 00                	push   $0x0
  pushl $241
  1025ca:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1025cf:	e9 14 f6 ff ff       	jmp    101be8 <__alltraps>

001025d4 <vector242>:
.globl vector242
vector242:
  pushl $0
  1025d4:	6a 00                	push   $0x0
  pushl $242
  1025d6:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1025db:	e9 08 f6 ff ff       	jmp    101be8 <__alltraps>

001025e0 <vector243>:
.globl vector243
vector243:
  pushl $0
  1025e0:	6a 00                	push   $0x0
  pushl $243
  1025e2:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1025e7:	e9 fc f5 ff ff       	jmp    101be8 <__alltraps>

001025ec <vector244>:
.globl vector244
vector244:
  pushl $0
  1025ec:	6a 00                	push   $0x0
  pushl $244
  1025ee:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1025f3:	e9 f0 f5 ff ff       	jmp    101be8 <__alltraps>

001025f8 <vector245>:
.globl vector245
vector245:
  pushl $0
  1025f8:	6a 00                	push   $0x0
  pushl $245
  1025fa:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1025ff:	e9 e4 f5 ff ff       	jmp    101be8 <__alltraps>

00102604 <vector246>:
.globl vector246
vector246:
  pushl $0
  102604:	6a 00                	push   $0x0
  pushl $246
  102606:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  10260b:	e9 d8 f5 ff ff       	jmp    101be8 <__alltraps>

00102610 <vector247>:
.globl vector247
vector247:
  pushl $0
  102610:	6a 00                	push   $0x0
  pushl $247
  102612:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102617:	e9 cc f5 ff ff       	jmp    101be8 <__alltraps>

0010261c <vector248>:
.globl vector248
vector248:
  pushl $0
  10261c:	6a 00                	push   $0x0
  pushl $248
  10261e:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102623:	e9 c0 f5 ff ff       	jmp    101be8 <__alltraps>

00102628 <vector249>:
.globl vector249
vector249:
  pushl $0
  102628:	6a 00                	push   $0x0
  pushl $249
  10262a:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  10262f:	e9 b4 f5 ff ff       	jmp    101be8 <__alltraps>

00102634 <vector250>:
.globl vector250
vector250:
  pushl $0
  102634:	6a 00                	push   $0x0
  pushl $250
  102636:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  10263b:	e9 a8 f5 ff ff       	jmp    101be8 <__alltraps>

00102640 <vector251>:
.globl vector251
vector251:
  pushl $0
  102640:	6a 00                	push   $0x0
  pushl $251
  102642:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102647:	e9 9c f5 ff ff       	jmp    101be8 <__alltraps>

0010264c <vector252>:
.globl vector252
vector252:
  pushl $0
  10264c:	6a 00                	push   $0x0
  pushl $252
  10264e:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102653:	e9 90 f5 ff ff       	jmp    101be8 <__alltraps>

00102658 <vector253>:
.globl vector253
vector253:
  pushl $0
  102658:	6a 00                	push   $0x0
  pushl $253
  10265a:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  10265f:	e9 84 f5 ff ff       	jmp    101be8 <__alltraps>

00102664 <vector254>:
.globl vector254
vector254:
  pushl $0
  102664:	6a 00                	push   $0x0
  pushl $254
  102666:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  10266b:	e9 78 f5 ff ff       	jmp    101be8 <__alltraps>

00102670 <vector255>:
.globl vector255
vector255:
  pushl $0
  102670:	6a 00                	push   $0x0
  pushl $255
  102672:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102677:	e9 6c f5 ff ff       	jmp    101be8 <__alltraps>

0010267c <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  10267c:	55                   	push   %ebp
  10267d:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10267f:	8b 45 08             	mov    0x8(%ebp),%eax
  102682:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102685:	b8 23 00 00 00       	mov    $0x23,%eax
  10268a:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  10268c:	b8 23 00 00 00       	mov    $0x23,%eax
  102691:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102693:	b8 10 00 00 00       	mov    $0x10,%eax
  102698:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  10269a:	b8 10 00 00 00       	mov    $0x10,%eax
  10269f:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  1026a1:	b8 10 00 00 00       	mov    $0x10,%eax
  1026a6:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  1026a8:	ea af 26 10 00 08 00 	ljmp   $0x8,$0x1026af
}
  1026af:	90                   	nop
  1026b0:	5d                   	pop    %ebp
  1026b1:	c3                   	ret    

001026b2 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  1026b2:	55                   	push   %ebp
  1026b3:	89 e5                	mov    %esp,%ebp
  1026b5:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  1026b8:	b8 20 09 11 00       	mov    $0x110920,%eax
  1026bd:	05 00 04 00 00       	add    $0x400,%eax
  1026c2:	a3 a4 08 11 00       	mov    %eax,0x1108a4
    ts.ts_ss0 = KERNEL_DS;
  1026c7:	66 c7 05 a8 08 11 00 	movw   $0x10,0x1108a8
  1026ce:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1026d0:	66 c7 05 08 fa 10 00 	movw   $0x68,0x10fa08
  1026d7:	68 00 
  1026d9:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  1026de:	0f b7 c0             	movzwl %ax,%eax
  1026e1:	66 a3 0a fa 10 00    	mov    %ax,0x10fa0a
  1026e7:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  1026ec:	c1 e8 10             	shr    $0x10,%eax
  1026ef:	a2 0c fa 10 00       	mov    %al,0x10fa0c
  1026f4:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1026fb:	24 f0                	and    $0xf0,%al
  1026fd:	0c 09                	or     $0x9,%al
  1026ff:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102704:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  10270b:	0c 10                	or     $0x10,%al
  10270d:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102712:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102719:	24 9f                	and    $0x9f,%al
  10271b:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102720:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102727:	0c 80                	or     $0x80,%al
  102729:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  10272e:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102735:	24 f0                	and    $0xf0,%al
  102737:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  10273c:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102743:	24 ef                	and    $0xef,%al
  102745:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  10274a:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102751:	24 df                	and    $0xdf,%al
  102753:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102758:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  10275f:	0c 40                	or     $0x40,%al
  102761:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102766:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  10276d:	24 7f                	and    $0x7f,%al
  10276f:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102774:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  102779:	c1 e8 18             	shr    $0x18,%eax
  10277c:	a2 0f fa 10 00       	mov    %al,0x10fa0f
    gdt[SEG_TSS].sd_s = 0;
  102781:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102788:	24 ef                	and    $0xef,%al
  10278a:	a2 0d fa 10 00       	mov    %al,0x10fa0d

    // reload all segment registers
    lgdt(&gdt_pd);
  10278f:	c7 04 24 10 fa 10 00 	movl   $0x10fa10,(%esp)
  102796:	e8 e1 fe ff ff       	call   10267c <lgdt>
  10279b:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  1027a1:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  1027a5:	0f 00 d8             	ltr    %ax
}
  1027a8:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  1027a9:	90                   	nop
  1027aa:	c9                   	leave  
  1027ab:	c3                   	ret    

001027ac <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  1027ac:	55                   	push   %ebp
  1027ad:	89 e5                	mov    %esp,%ebp
    gdt_init();
  1027af:	e8 fe fe ff ff       	call   1026b2 <gdt_init>
}
  1027b4:	90                   	nop
  1027b5:	5d                   	pop    %ebp
  1027b6:	c3                   	ret    

001027b7 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  1027b7:	55                   	push   %ebp
  1027b8:	89 e5                	mov    %esp,%ebp
  1027ba:	83 ec 58             	sub    $0x58,%esp
  1027bd:	8b 45 10             	mov    0x10(%ebp),%eax
  1027c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1027c3:	8b 45 14             	mov    0x14(%ebp),%eax
  1027c6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  1027c9:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1027cc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1027cf:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1027d2:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  1027d5:	8b 45 18             	mov    0x18(%ebp),%eax
  1027d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1027db:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1027de:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1027e1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1027e4:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1027e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1027ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1027ed:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1027f1:	74 1c                	je     10280f <printnum+0x58>
  1027f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1027f6:	ba 00 00 00 00       	mov    $0x0,%edx
  1027fb:	f7 75 e4             	divl   -0x1c(%ebp)
  1027fe:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102801:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102804:	ba 00 00 00 00       	mov    $0x0,%edx
  102809:	f7 75 e4             	divl   -0x1c(%ebp)
  10280c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10280f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102812:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102815:	f7 75 e4             	divl   -0x1c(%ebp)
  102818:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10281b:	89 55 dc             	mov    %edx,-0x24(%ebp)
  10281e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102821:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102824:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102827:	89 55 ec             	mov    %edx,-0x14(%ebp)
  10282a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10282d:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102830:	8b 45 18             	mov    0x18(%ebp),%eax
  102833:	ba 00 00 00 00       	mov    $0x0,%edx
  102838:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  10283b:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  10283e:	19 d1                	sbb    %edx,%ecx
  102840:	72 4c                	jb     10288e <printnum+0xd7>
        printnum(putch, putdat, result, base, width - 1, padc);
  102842:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102845:	8d 50 ff             	lea    -0x1(%eax),%edx
  102848:	8b 45 20             	mov    0x20(%ebp),%eax
  10284b:	89 44 24 18          	mov    %eax,0x18(%esp)
  10284f:	89 54 24 14          	mov    %edx,0x14(%esp)
  102853:	8b 45 18             	mov    0x18(%ebp),%eax
  102856:	89 44 24 10          	mov    %eax,0x10(%esp)
  10285a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10285d:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102860:	89 44 24 08          	mov    %eax,0x8(%esp)
  102864:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102868:	8b 45 0c             	mov    0xc(%ebp),%eax
  10286b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10286f:	8b 45 08             	mov    0x8(%ebp),%eax
  102872:	89 04 24             	mov    %eax,(%esp)
  102875:	e8 3d ff ff ff       	call   1027b7 <printnum>
  10287a:	eb 1b                	jmp    102897 <printnum+0xe0>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  10287c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10287f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102883:	8b 45 20             	mov    0x20(%ebp),%eax
  102886:	89 04 24             	mov    %eax,(%esp)
  102889:	8b 45 08             	mov    0x8(%ebp),%eax
  10288c:	ff d0                	call   *%eax
        while (-- width > 0)
  10288e:	ff 4d 1c             	decl   0x1c(%ebp)
  102891:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102895:	7f e5                	jg     10287c <printnum+0xc5>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102897:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10289a:	05 70 3a 10 00       	add    $0x103a70,%eax
  10289f:	0f b6 00             	movzbl (%eax),%eax
  1028a2:	0f be c0             	movsbl %al,%eax
  1028a5:	8b 55 0c             	mov    0xc(%ebp),%edx
  1028a8:	89 54 24 04          	mov    %edx,0x4(%esp)
  1028ac:	89 04 24             	mov    %eax,(%esp)
  1028af:	8b 45 08             	mov    0x8(%ebp),%eax
  1028b2:	ff d0                	call   *%eax
}
  1028b4:	90                   	nop
  1028b5:	c9                   	leave  
  1028b6:	c3                   	ret    

001028b7 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  1028b7:	55                   	push   %ebp
  1028b8:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1028ba:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1028be:	7e 14                	jle    1028d4 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  1028c0:	8b 45 08             	mov    0x8(%ebp),%eax
  1028c3:	8b 00                	mov    (%eax),%eax
  1028c5:	8d 48 08             	lea    0x8(%eax),%ecx
  1028c8:	8b 55 08             	mov    0x8(%ebp),%edx
  1028cb:	89 0a                	mov    %ecx,(%edx)
  1028cd:	8b 50 04             	mov    0x4(%eax),%edx
  1028d0:	8b 00                	mov    (%eax),%eax
  1028d2:	eb 30                	jmp    102904 <getuint+0x4d>
    }
    else if (lflag) {
  1028d4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1028d8:	74 16                	je     1028f0 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  1028da:	8b 45 08             	mov    0x8(%ebp),%eax
  1028dd:	8b 00                	mov    (%eax),%eax
  1028df:	8d 48 04             	lea    0x4(%eax),%ecx
  1028e2:	8b 55 08             	mov    0x8(%ebp),%edx
  1028e5:	89 0a                	mov    %ecx,(%edx)
  1028e7:	8b 00                	mov    (%eax),%eax
  1028e9:	ba 00 00 00 00       	mov    $0x0,%edx
  1028ee:	eb 14                	jmp    102904 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  1028f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1028f3:	8b 00                	mov    (%eax),%eax
  1028f5:	8d 48 04             	lea    0x4(%eax),%ecx
  1028f8:	8b 55 08             	mov    0x8(%ebp),%edx
  1028fb:	89 0a                	mov    %ecx,(%edx)
  1028fd:	8b 00                	mov    (%eax),%eax
  1028ff:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102904:	5d                   	pop    %ebp
  102905:	c3                   	ret    

00102906 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102906:	55                   	push   %ebp
  102907:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102909:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  10290d:	7e 14                	jle    102923 <getint+0x1d>
        return va_arg(*ap, long long);
  10290f:	8b 45 08             	mov    0x8(%ebp),%eax
  102912:	8b 00                	mov    (%eax),%eax
  102914:	8d 48 08             	lea    0x8(%eax),%ecx
  102917:	8b 55 08             	mov    0x8(%ebp),%edx
  10291a:	89 0a                	mov    %ecx,(%edx)
  10291c:	8b 50 04             	mov    0x4(%eax),%edx
  10291f:	8b 00                	mov    (%eax),%eax
  102921:	eb 28                	jmp    10294b <getint+0x45>
    }
    else if (lflag) {
  102923:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102927:	74 12                	je     10293b <getint+0x35>
        return va_arg(*ap, long);
  102929:	8b 45 08             	mov    0x8(%ebp),%eax
  10292c:	8b 00                	mov    (%eax),%eax
  10292e:	8d 48 04             	lea    0x4(%eax),%ecx
  102931:	8b 55 08             	mov    0x8(%ebp),%edx
  102934:	89 0a                	mov    %ecx,(%edx)
  102936:	8b 00                	mov    (%eax),%eax
  102938:	99                   	cltd   
  102939:	eb 10                	jmp    10294b <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  10293b:	8b 45 08             	mov    0x8(%ebp),%eax
  10293e:	8b 00                	mov    (%eax),%eax
  102940:	8d 48 04             	lea    0x4(%eax),%ecx
  102943:	8b 55 08             	mov    0x8(%ebp),%edx
  102946:	89 0a                	mov    %ecx,(%edx)
  102948:	8b 00                	mov    (%eax),%eax
  10294a:	99                   	cltd   
    }
}
  10294b:	5d                   	pop    %ebp
  10294c:	c3                   	ret    

0010294d <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  10294d:	55                   	push   %ebp
  10294e:	89 e5                	mov    %esp,%ebp
  102950:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102953:	8d 45 14             	lea    0x14(%ebp),%eax
  102956:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102959:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10295c:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102960:	8b 45 10             	mov    0x10(%ebp),%eax
  102963:	89 44 24 08          	mov    %eax,0x8(%esp)
  102967:	8b 45 0c             	mov    0xc(%ebp),%eax
  10296a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10296e:	8b 45 08             	mov    0x8(%ebp),%eax
  102971:	89 04 24             	mov    %eax,(%esp)
  102974:	e8 03 00 00 00       	call   10297c <vprintfmt>
    va_end(ap);
}
  102979:	90                   	nop
  10297a:	c9                   	leave  
  10297b:	c3                   	ret    

0010297c <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  10297c:	55                   	push   %ebp
  10297d:	89 e5                	mov    %esp,%ebp
  10297f:	56                   	push   %esi
  102980:	53                   	push   %ebx
  102981:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102984:	eb 17                	jmp    10299d <vprintfmt+0x21>
            if (ch == '\0') {
  102986:	85 db                	test   %ebx,%ebx
  102988:	0f 84 bf 03 00 00    	je     102d4d <vprintfmt+0x3d1>
                return;
            }
            putch(ch, putdat);
  10298e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102991:	89 44 24 04          	mov    %eax,0x4(%esp)
  102995:	89 1c 24             	mov    %ebx,(%esp)
  102998:	8b 45 08             	mov    0x8(%ebp),%eax
  10299b:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  10299d:	8b 45 10             	mov    0x10(%ebp),%eax
  1029a0:	8d 50 01             	lea    0x1(%eax),%edx
  1029a3:	89 55 10             	mov    %edx,0x10(%ebp)
  1029a6:	0f b6 00             	movzbl (%eax),%eax
  1029a9:	0f b6 d8             	movzbl %al,%ebx
  1029ac:	83 fb 25             	cmp    $0x25,%ebx
  1029af:	75 d5                	jne    102986 <vprintfmt+0xa>
        }

        // Process a %-escape sequence
        char padc = ' ';
  1029b1:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  1029b5:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  1029bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1029bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  1029c2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  1029c9:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1029cc:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  1029cf:	8b 45 10             	mov    0x10(%ebp),%eax
  1029d2:	8d 50 01             	lea    0x1(%eax),%edx
  1029d5:	89 55 10             	mov    %edx,0x10(%ebp)
  1029d8:	0f b6 00             	movzbl (%eax),%eax
  1029db:	0f b6 d8             	movzbl %al,%ebx
  1029de:	8d 43 dd             	lea    -0x23(%ebx),%eax
  1029e1:	83 f8 55             	cmp    $0x55,%eax
  1029e4:	0f 87 37 03 00 00    	ja     102d21 <vprintfmt+0x3a5>
  1029ea:	8b 04 85 94 3a 10 00 	mov    0x103a94(,%eax,4),%eax
  1029f1:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  1029f3:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  1029f7:	eb d6                	jmp    1029cf <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  1029f9:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  1029fd:	eb d0                	jmp    1029cf <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  1029ff:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102a06:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102a09:	89 d0                	mov    %edx,%eax
  102a0b:	c1 e0 02             	shl    $0x2,%eax
  102a0e:	01 d0                	add    %edx,%eax
  102a10:	01 c0                	add    %eax,%eax
  102a12:	01 d8                	add    %ebx,%eax
  102a14:	83 e8 30             	sub    $0x30,%eax
  102a17:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102a1a:	8b 45 10             	mov    0x10(%ebp),%eax
  102a1d:	0f b6 00             	movzbl (%eax),%eax
  102a20:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102a23:	83 fb 2f             	cmp    $0x2f,%ebx
  102a26:	7e 38                	jle    102a60 <vprintfmt+0xe4>
  102a28:	83 fb 39             	cmp    $0x39,%ebx
  102a2b:	7f 33                	jg     102a60 <vprintfmt+0xe4>
            for (precision = 0; ; ++ fmt) {
  102a2d:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  102a30:	eb d4                	jmp    102a06 <vprintfmt+0x8a>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  102a32:	8b 45 14             	mov    0x14(%ebp),%eax
  102a35:	8d 50 04             	lea    0x4(%eax),%edx
  102a38:	89 55 14             	mov    %edx,0x14(%ebp)
  102a3b:	8b 00                	mov    (%eax),%eax
  102a3d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102a40:	eb 1f                	jmp    102a61 <vprintfmt+0xe5>

        case '.':
            if (width < 0)
  102a42:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102a46:	79 87                	jns    1029cf <vprintfmt+0x53>
                width = 0;
  102a48:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102a4f:	e9 7b ff ff ff       	jmp    1029cf <vprintfmt+0x53>

        case '#':
            altflag = 1;
  102a54:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102a5b:	e9 6f ff ff ff       	jmp    1029cf <vprintfmt+0x53>
            goto process_precision;
  102a60:	90                   	nop

        process_precision:
            if (width < 0)
  102a61:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102a65:	0f 89 64 ff ff ff    	jns    1029cf <vprintfmt+0x53>
                width = precision, precision = -1;
  102a6b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102a6e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102a71:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102a78:	e9 52 ff ff ff       	jmp    1029cf <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102a7d:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  102a80:	e9 4a ff ff ff       	jmp    1029cf <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102a85:	8b 45 14             	mov    0x14(%ebp),%eax
  102a88:	8d 50 04             	lea    0x4(%eax),%edx
  102a8b:	89 55 14             	mov    %edx,0x14(%ebp)
  102a8e:	8b 00                	mov    (%eax),%eax
  102a90:	8b 55 0c             	mov    0xc(%ebp),%edx
  102a93:	89 54 24 04          	mov    %edx,0x4(%esp)
  102a97:	89 04 24             	mov    %eax,(%esp)
  102a9a:	8b 45 08             	mov    0x8(%ebp),%eax
  102a9d:	ff d0                	call   *%eax
            break;
  102a9f:	e9 a4 02 00 00       	jmp    102d48 <vprintfmt+0x3cc>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102aa4:	8b 45 14             	mov    0x14(%ebp),%eax
  102aa7:	8d 50 04             	lea    0x4(%eax),%edx
  102aaa:	89 55 14             	mov    %edx,0x14(%ebp)
  102aad:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102aaf:	85 db                	test   %ebx,%ebx
  102ab1:	79 02                	jns    102ab5 <vprintfmt+0x139>
                err = -err;
  102ab3:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102ab5:	83 fb 06             	cmp    $0x6,%ebx
  102ab8:	7f 0b                	jg     102ac5 <vprintfmt+0x149>
  102aba:	8b 34 9d 54 3a 10 00 	mov    0x103a54(,%ebx,4),%esi
  102ac1:	85 f6                	test   %esi,%esi
  102ac3:	75 23                	jne    102ae8 <vprintfmt+0x16c>
                printfmt(putch, putdat, "error %d", err);
  102ac5:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102ac9:	c7 44 24 08 81 3a 10 	movl   $0x103a81,0x8(%esp)
  102ad0:	00 
  102ad1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ad4:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ad8:	8b 45 08             	mov    0x8(%ebp),%eax
  102adb:	89 04 24             	mov    %eax,(%esp)
  102ade:	e8 6a fe ff ff       	call   10294d <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102ae3:	e9 60 02 00 00       	jmp    102d48 <vprintfmt+0x3cc>
                printfmt(putch, putdat, "%s", p);
  102ae8:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102aec:	c7 44 24 08 8a 3a 10 	movl   $0x103a8a,0x8(%esp)
  102af3:	00 
  102af4:	8b 45 0c             	mov    0xc(%ebp),%eax
  102af7:	89 44 24 04          	mov    %eax,0x4(%esp)
  102afb:	8b 45 08             	mov    0x8(%ebp),%eax
  102afe:	89 04 24             	mov    %eax,(%esp)
  102b01:	e8 47 fe ff ff       	call   10294d <printfmt>
            break;
  102b06:	e9 3d 02 00 00       	jmp    102d48 <vprintfmt+0x3cc>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102b0b:	8b 45 14             	mov    0x14(%ebp),%eax
  102b0e:	8d 50 04             	lea    0x4(%eax),%edx
  102b11:	89 55 14             	mov    %edx,0x14(%ebp)
  102b14:	8b 30                	mov    (%eax),%esi
  102b16:	85 f6                	test   %esi,%esi
  102b18:	75 05                	jne    102b1f <vprintfmt+0x1a3>
                p = "(null)";
  102b1a:	be 8d 3a 10 00       	mov    $0x103a8d,%esi
            }
            if (width > 0 && padc != '-') {
  102b1f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102b23:	7e 76                	jle    102b9b <vprintfmt+0x21f>
  102b25:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102b29:	74 70                	je     102b9b <vprintfmt+0x21f>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102b2b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102b2e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b32:	89 34 24             	mov    %esi,(%esp)
  102b35:	e8 10 03 00 00       	call   102e4a <strnlen>
  102b3a:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102b3d:	29 c2                	sub    %eax,%edx
  102b3f:	89 d0                	mov    %edx,%eax
  102b41:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102b44:	eb 16                	jmp    102b5c <vprintfmt+0x1e0>
                    putch(padc, putdat);
  102b46:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102b4a:	8b 55 0c             	mov    0xc(%ebp),%edx
  102b4d:	89 54 24 04          	mov    %edx,0x4(%esp)
  102b51:	89 04 24             	mov    %eax,(%esp)
  102b54:	8b 45 08             	mov    0x8(%ebp),%eax
  102b57:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  102b59:	ff 4d e8             	decl   -0x18(%ebp)
  102b5c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102b60:	7f e4                	jg     102b46 <vprintfmt+0x1ca>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102b62:	eb 37                	jmp    102b9b <vprintfmt+0x21f>
                if (altflag && (ch < ' ' || ch > '~')) {
  102b64:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102b68:	74 1f                	je     102b89 <vprintfmt+0x20d>
  102b6a:	83 fb 1f             	cmp    $0x1f,%ebx
  102b6d:	7e 05                	jle    102b74 <vprintfmt+0x1f8>
  102b6f:	83 fb 7e             	cmp    $0x7e,%ebx
  102b72:	7e 15                	jle    102b89 <vprintfmt+0x20d>
                    putch('?', putdat);
  102b74:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b77:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b7b:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102b82:	8b 45 08             	mov    0x8(%ebp),%eax
  102b85:	ff d0                	call   *%eax
  102b87:	eb 0f                	jmp    102b98 <vprintfmt+0x21c>
                }
                else {
                    putch(ch, putdat);
  102b89:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b8c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b90:	89 1c 24             	mov    %ebx,(%esp)
  102b93:	8b 45 08             	mov    0x8(%ebp),%eax
  102b96:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102b98:	ff 4d e8             	decl   -0x18(%ebp)
  102b9b:	89 f0                	mov    %esi,%eax
  102b9d:	8d 70 01             	lea    0x1(%eax),%esi
  102ba0:	0f b6 00             	movzbl (%eax),%eax
  102ba3:	0f be d8             	movsbl %al,%ebx
  102ba6:	85 db                	test   %ebx,%ebx
  102ba8:	74 27                	je     102bd1 <vprintfmt+0x255>
  102baa:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102bae:	78 b4                	js     102b64 <vprintfmt+0x1e8>
  102bb0:	ff 4d e4             	decl   -0x1c(%ebp)
  102bb3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102bb7:	79 ab                	jns    102b64 <vprintfmt+0x1e8>
                }
            }
            for (; width > 0; width --) {
  102bb9:	eb 16                	jmp    102bd1 <vprintfmt+0x255>
                putch(' ', putdat);
  102bbb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bbe:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bc2:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102bc9:	8b 45 08             	mov    0x8(%ebp),%eax
  102bcc:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  102bce:	ff 4d e8             	decl   -0x18(%ebp)
  102bd1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102bd5:	7f e4                	jg     102bbb <vprintfmt+0x23f>
            }
            break;
  102bd7:	e9 6c 01 00 00       	jmp    102d48 <vprintfmt+0x3cc>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102bdc:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102bdf:	89 44 24 04          	mov    %eax,0x4(%esp)
  102be3:	8d 45 14             	lea    0x14(%ebp),%eax
  102be6:	89 04 24             	mov    %eax,(%esp)
  102be9:	e8 18 fd ff ff       	call   102906 <getint>
  102bee:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102bf1:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102bf4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bf7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102bfa:	85 d2                	test   %edx,%edx
  102bfc:	79 26                	jns    102c24 <vprintfmt+0x2a8>
                putch('-', putdat);
  102bfe:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c01:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c05:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102c0c:	8b 45 08             	mov    0x8(%ebp),%eax
  102c0f:	ff d0                	call   *%eax
                num = -(long long)num;
  102c11:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c14:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102c17:	f7 d8                	neg    %eax
  102c19:	83 d2 00             	adc    $0x0,%edx
  102c1c:	f7 da                	neg    %edx
  102c1e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c21:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102c24:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102c2b:	e9 a8 00 00 00       	jmp    102cd8 <vprintfmt+0x35c>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102c30:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c33:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c37:	8d 45 14             	lea    0x14(%ebp),%eax
  102c3a:	89 04 24             	mov    %eax,(%esp)
  102c3d:	e8 75 fc ff ff       	call   1028b7 <getuint>
  102c42:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c45:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102c48:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102c4f:	e9 84 00 00 00       	jmp    102cd8 <vprintfmt+0x35c>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102c54:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c57:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c5b:	8d 45 14             	lea    0x14(%ebp),%eax
  102c5e:	89 04 24             	mov    %eax,(%esp)
  102c61:	e8 51 fc ff ff       	call   1028b7 <getuint>
  102c66:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c69:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102c6c:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102c73:	eb 63                	jmp    102cd8 <vprintfmt+0x35c>

        // pointer
        case 'p':
            putch('0', putdat);
  102c75:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c78:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c7c:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102c83:	8b 45 08             	mov    0x8(%ebp),%eax
  102c86:	ff d0                	call   *%eax
            putch('x', putdat);
  102c88:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c8b:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c8f:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102c96:	8b 45 08             	mov    0x8(%ebp),%eax
  102c99:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102c9b:	8b 45 14             	mov    0x14(%ebp),%eax
  102c9e:	8d 50 04             	lea    0x4(%eax),%edx
  102ca1:	89 55 14             	mov    %edx,0x14(%ebp)
  102ca4:	8b 00                	mov    (%eax),%eax
  102ca6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ca9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102cb0:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102cb7:	eb 1f                	jmp    102cd8 <vprintfmt+0x35c>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102cb9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102cbc:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cc0:	8d 45 14             	lea    0x14(%ebp),%eax
  102cc3:	89 04 24             	mov    %eax,(%esp)
  102cc6:	e8 ec fb ff ff       	call   1028b7 <getuint>
  102ccb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102cce:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102cd1:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102cd8:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102cdc:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102cdf:	89 54 24 18          	mov    %edx,0x18(%esp)
  102ce3:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102ce6:	89 54 24 14          	mov    %edx,0x14(%esp)
  102cea:	89 44 24 10          	mov    %eax,0x10(%esp)
  102cee:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cf1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102cf4:	89 44 24 08          	mov    %eax,0x8(%esp)
  102cf8:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102cfc:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cff:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d03:	8b 45 08             	mov    0x8(%ebp),%eax
  102d06:	89 04 24             	mov    %eax,(%esp)
  102d09:	e8 a9 fa ff ff       	call   1027b7 <printnum>
            break;
  102d0e:	eb 38                	jmp    102d48 <vprintfmt+0x3cc>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102d10:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d13:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d17:	89 1c 24             	mov    %ebx,(%esp)
  102d1a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d1d:	ff d0                	call   *%eax
            break;
  102d1f:	eb 27                	jmp    102d48 <vprintfmt+0x3cc>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102d21:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d24:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d28:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  102d2f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d32:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  102d34:	ff 4d 10             	decl   0x10(%ebp)
  102d37:	eb 03                	jmp    102d3c <vprintfmt+0x3c0>
  102d39:	ff 4d 10             	decl   0x10(%ebp)
  102d3c:	8b 45 10             	mov    0x10(%ebp),%eax
  102d3f:	48                   	dec    %eax
  102d40:	0f b6 00             	movzbl (%eax),%eax
  102d43:	3c 25                	cmp    $0x25,%al
  102d45:	75 f2                	jne    102d39 <vprintfmt+0x3bd>
                /* do nothing */;
            break;
  102d47:	90                   	nop
    while (1) {
  102d48:	e9 37 fc ff ff       	jmp    102984 <vprintfmt+0x8>
                return;
  102d4d:	90                   	nop
        }
    }
}
  102d4e:	83 c4 40             	add    $0x40,%esp
  102d51:	5b                   	pop    %ebx
  102d52:	5e                   	pop    %esi
  102d53:	5d                   	pop    %ebp
  102d54:	c3                   	ret    

00102d55 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  102d55:	55                   	push   %ebp
  102d56:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  102d58:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d5b:	8b 40 08             	mov    0x8(%eax),%eax
  102d5e:	8d 50 01             	lea    0x1(%eax),%edx
  102d61:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d64:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  102d67:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d6a:	8b 10                	mov    (%eax),%edx
  102d6c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d6f:	8b 40 04             	mov    0x4(%eax),%eax
  102d72:	39 c2                	cmp    %eax,%edx
  102d74:	73 12                	jae    102d88 <sprintputch+0x33>
        *b->buf ++ = ch;
  102d76:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d79:	8b 00                	mov    (%eax),%eax
  102d7b:	8d 48 01             	lea    0x1(%eax),%ecx
  102d7e:	8b 55 0c             	mov    0xc(%ebp),%edx
  102d81:	89 0a                	mov    %ecx,(%edx)
  102d83:	8b 55 08             	mov    0x8(%ebp),%edx
  102d86:	88 10                	mov    %dl,(%eax)
    }
}
  102d88:	90                   	nop
  102d89:	5d                   	pop    %ebp
  102d8a:	c3                   	ret    

00102d8b <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  102d8b:	55                   	push   %ebp
  102d8c:	89 e5                	mov    %esp,%ebp
  102d8e:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  102d91:	8d 45 14             	lea    0x14(%ebp),%eax
  102d94:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  102d97:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d9a:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102d9e:	8b 45 10             	mov    0x10(%ebp),%eax
  102da1:	89 44 24 08          	mov    %eax,0x8(%esp)
  102da5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102da8:	89 44 24 04          	mov    %eax,0x4(%esp)
  102dac:	8b 45 08             	mov    0x8(%ebp),%eax
  102daf:	89 04 24             	mov    %eax,(%esp)
  102db2:	e8 08 00 00 00       	call   102dbf <vsnprintf>
  102db7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  102dba:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102dbd:	c9                   	leave  
  102dbe:	c3                   	ret    

00102dbf <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  102dbf:	55                   	push   %ebp
  102dc0:	89 e5                	mov    %esp,%ebp
  102dc2:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  102dc5:	8b 45 08             	mov    0x8(%ebp),%eax
  102dc8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102dcb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dce:	8d 50 ff             	lea    -0x1(%eax),%edx
  102dd1:	8b 45 08             	mov    0x8(%ebp),%eax
  102dd4:	01 d0                	add    %edx,%eax
  102dd6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102dd9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  102de0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102de4:	74 0a                	je     102df0 <vsnprintf+0x31>
  102de6:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102de9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102dec:	39 c2                	cmp    %eax,%edx
  102dee:	76 07                	jbe    102df7 <vsnprintf+0x38>
        return -E_INVAL;
  102df0:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  102df5:	eb 2a                	jmp    102e21 <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  102df7:	8b 45 14             	mov    0x14(%ebp),%eax
  102dfa:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102dfe:	8b 45 10             	mov    0x10(%ebp),%eax
  102e01:	89 44 24 08          	mov    %eax,0x8(%esp)
  102e05:	8d 45 ec             	lea    -0x14(%ebp),%eax
  102e08:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e0c:	c7 04 24 55 2d 10 00 	movl   $0x102d55,(%esp)
  102e13:	e8 64 fb ff ff       	call   10297c <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  102e18:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e1b:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  102e1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102e21:	c9                   	leave  
  102e22:	c3                   	ret    

00102e23 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102e23:	55                   	push   %ebp
  102e24:	89 e5                	mov    %esp,%ebp
  102e26:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102e29:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102e30:	eb 03                	jmp    102e35 <strlen+0x12>
        cnt ++;
  102e32:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  102e35:	8b 45 08             	mov    0x8(%ebp),%eax
  102e38:	8d 50 01             	lea    0x1(%eax),%edx
  102e3b:	89 55 08             	mov    %edx,0x8(%ebp)
  102e3e:	0f b6 00             	movzbl (%eax),%eax
  102e41:	84 c0                	test   %al,%al
  102e43:	75 ed                	jne    102e32 <strlen+0xf>
    }
    return cnt;
  102e45:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102e48:	c9                   	leave  
  102e49:	c3                   	ret    

00102e4a <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102e4a:	55                   	push   %ebp
  102e4b:	89 e5                	mov    %esp,%ebp
  102e4d:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102e50:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102e57:	eb 03                	jmp    102e5c <strnlen+0x12>
        cnt ++;
  102e59:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102e5c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102e5f:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102e62:	73 10                	jae    102e74 <strnlen+0x2a>
  102e64:	8b 45 08             	mov    0x8(%ebp),%eax
  102e67:	8d 50 01             	lea    0x1(%eax),%edx
  102e6a:	89 55 08             	mov    %edx,0x8(%ebp)
  102e6d:	0f b6 00             	movzbl (%eax),%eax
  102e70:	84 c0                	test   %al,%al
  102e72:	75 e5                	jne    102e59 <strnlen+0xf>
    }
    return cnt;
  102e74:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102e77:	c9                   	leave  
  102e78:	c3                   	ret    

00102e79 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102e79:	55                   	push   %ebp
  102e7a:	89 e5                	mov    %esp,%ebp
  102e7c:	57                   	push   %edi
  102e7d:	56                   	push   %esi
  102e7e:	83 ec 20             	sub    $0x20,%esp
  102e81:	8b 45 08             	mov    0x8(%ebp),%eax
  102e84:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e87:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e8a:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102e8d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102e90:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e93:	89 d1                	mov    %edx,%ecx
  102e95:	89 c2                	mov    %eax,%edx
  102e97:	89 ce                	mov    %ecx,%esi
  102e99:	89 d7                	mov    %edx,%edi
  102e9b:	ac                   	lods   %ds:(%esi),%al
  102e9c:	aa                   	stos   %al,%es:(%edi)
  102e9d:	84 c0                	test   %al,%al
  102e9f:	75 fa                	jne    102e9b <strcpy+0x22>
  102ea1:	89 fa                	mov    %edi,%edx
  102ea3:	89 f1                	mov    %esi,%ecx
  102ea5:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102ea8:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102eab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102eae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102eb1:	83 c4 20             	add    $0x20,%esp
  102eb4:	5e                   	pop    %esi
  102eb5:	5f                   	pop    %edi
  102eb6:	5d                   	pop    %ebp
  102eb7:	c3                   	ret    

00102eb8 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102eb8:	55                   	push   %ebp
  102eb9:	89 e5                	mov    %esp,%ebp
  102ebb:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102ebe:	8b 45 08             	mov    0x8(%ebp),%eax
  102ec1:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102ec4:	eb 1e                	jmp    102ee4 <strncpy+0x2c>
        if ((*p = *src) != '\0') {
  102ec6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ec9:	0f b6 10             	movzbl (%eax),%edx
  102ecc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ecf:	88 10                	mov    %dl,(%eax)
  102ed1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ed4:	0f b6 00             	movzbl (%eax),%eax
  102ed7:	84 c0                	test   %al,%al
  102ed9:	74 03                	je     102ede <strncpy+0x26>
            src ++;
  102edb:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  102ede:	ff 45 fc             	incl   -0x4(%ebp)
  102ee1:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  102ee4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102ee8:	75 dc                	jne    102ec6 <strncpy+0xe>
    }
    return dst;
  102eea:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102eed:	c9                   	leave  
  102eee:	c3                   	ret    

00102eef <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102eef:	55                   	push   %ebp
  102ef0:	89 e5                	mov    %esp,%ebp
  102ef2:	57                   	push   %edi
  102ef3:	56                   	push   %esi
  102ef4:	83 ec 20             	sub    $0x20,%esp
  102ef7:	8b 45 08             	mov    0x8(%ebp),%eax
  102efa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102efd:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f00:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  102f03:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f06:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f09:	89 d1                	mov    %edx,%ecx
  102f0b:	89 c2                	mov    %eax,%edx
  102f0d:	89 ce                	mov    %ecx,%esi
  102f0f:	89 d7                	mov    %edx,%edi
  102f11:	ac                   	lods   %ds:(%esi),%al
  102f12:	ae                   	scas   %es:(%edi),%al
  102f13:	75 08                	jne    102f1d <strcmp+0x2e>
  102f15:	84 c0                	test   %al,%al
  102f17:	75 f8                	jne    102f11 <strcmp+0x22>
  102f19:	31 c0                	xor    %eax,%eax
  102f1b:	eb 04                	jmp    102f21 <strcmp+0x32>
  102f1d:	19 c0                	sbb    %eax,%eax
  102f1f:	0c 01                	or     $0x1,%al
  102f21:	89 fa                	mov    %edi,%edx
  102f23:	89 f1                	mov    %esi,%ecx
  102f25:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102f28:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102f2b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102f2e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102f31:	83 c4 20             	add    $0x20,%esp
  102f34:	5e                   	pop    %esi
  102f35:	5f                   	pop    %edi
  102f36:	5d                   	pop    %ebp
  102f37:	c3                   	ret    

00102f38 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102f38:	55                   	push   %ebp
  102f39:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102f3b:	eb 09                	jmp    102f46 <strncmp+0xe>
        n --, s1 ++, s2 ++;
  102f3d:	ff 4d 10             	decl   0x10(%ebp)
  102f40:	ff 45 08             	incl   0x8(%ebp)
  102f43:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102f46:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102f4a:	74 1a                	je     102f66 <strncmp+0x2e>
  102f4c:	8b 45 08             	mov    0x8(%ebp),%eax
  102f4f:	0f b6 00             	movzbl (%eax),%eax
  102f52:	84 c0                	test   %al,%al
  102f54:	74 10                	je     102f66 <strncmp+0x2e>
  102f56:	8b 45 08             	mov    0x8(%ebp),%eax
  102f59:	0f b6 10             	movzbl (%eax),%edx
  102f5c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f5f:	0f b6 00             	movzbl (%eax),%eax
  102f62:	38 c2                	cmp    %al,%dl
  102f64:	74 d7                	je     102f3d <strncmp+0x5>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102f66:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102f6a:	74 18                	je     102f84 <strncmp+0x4c>
  102f6c:	8b 45 08             	mov    0x8(%ebp),%eax
  102f6f:	0f b6 00             	movzbl (%eax),%eax
  102f72:	0f b6 d0             	movzbl %al,%edx
  102f75:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f78:	0f b6 00             	movzbl (%eax),%eax
  102f7b:	0f b6 c0             	movzbl %al,%eax
  102f7e:	29 c2                	sub    %eax,%edx
  102f80:	89 d0                	mov    %edx,%eax
  102f82:	eb 05                	jmp    102f89 <strncmp+0x51>
  102f84:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f89:	5d                   	pop    %ebp
  102f8a:	c3                   	ret    

00102f8b <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102f8b:	55                   	push   %ebp
  102f8c:	89 e5                	mov    %esp,%ebp
  102f8e:	83 ec 04             	sub    $0x4,%esp
  102f91:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f94:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102f97:	eb 13                	jmp    102fac <strchr+0x21>
        if (*s == c) {
  102f99:	8b 45 08             	mov    0x8(%ebp),%eax
  102f9c:	0f b6 00             	movzbl (%eax),%eax
  102f9f:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102fa2:	75 05                	jne    102fa9 <strchr+0x1e>
            return (char *)s;
  102fa4:	8b 45 08             	mov    0x8(%ebp),%eax
  102fa7:	eb 12                	jmp    102fbb <strchr+0x30>
        }
        s ++;
  102fa9:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102fac:	8b 45 08             	mov    0x8(%ebp),%eax
  102faf:	0f b6 00             	movzbl (%eax),%eax
  102fb2:	84 c0                	test   %al,%al
  102fb4:	75 e3                	jne    102f99 <strchr+0xe>
    }
    return NULL;
  102fb6:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102fbb:	c9                   	leave  
  102fbc:	c3                   	ret    

00102fbd <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102fbd:	55                   	push   %ebp
  102fbe:	89 e5                	mov    %esp,%ebp
  102fc0:	83 ec 04             	sub    $0x4,%esp
  102fc3:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fc6:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102fc9:	eb 0e                	jmp    102fd9 <strfind+0x1c>
        if (*s == c) {
  102fcb:	8b 45 08             	mov    0x8(%ebp),%eax
  102fce:	0f b6 00             	movzbl (%eax),%eax
  102fd1:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102fd4:	74 0f                	je     102fe5 <strfind+0x28>
            break;
        }
        s ++;
  102fd6:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102fd9:	8b 45 08             	mov    0x8(%ebp),%eax
  102fdc:	0f b6 00             	movzbl (%eax),%eax
  102fdf:	84 c0                	test   %al,%al
  102fe1:	75 e8                	jne    102fcb <strfind+0xe>
  102fe3:	eb 01                	jmp    102fe6 <strfind+0x29>
            break;
  102fe5:	90                   	nop
    }
    return (char *)s;
  102fe6:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102fe9:	c9                   	leave  
  102fea:	c3                   	ret    

00102feb <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102feb:	55                   	push   %ebp
  102fec:	89 e5                	mov    %esp,%ebp
  102fee:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102ff1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102ff8:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102fff:	eb 03                	jmp    103004 <strtol+0x19>
        s ++;
  103001:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  103004:	8b 45 08             	mov    0x8(%ebp),%eax
  103007:	0f b6 00             	movzbl (%eax),%eax
  10300a:	3c 20                	cmp    $0x20,%al
  10300c:	74 f3                	je     103001 <strtol+0x16>
  10300e:	8b 45 08             	mov    0x8(%ebp),%eax
  103011:	0f b6 00             	movzbl (%eax),%eax
  103014:	3c 09                	cmp    $0x9,%al
  103016:	74 e9                	je     103001 <strtol+0x16>
    }

    // plus/minus sign
    if (*s == '+') {
  103018:	8b 45 08             	mov    0x8(%ebp),%eax
  10301b:	0f b6 00             	movzbl (%eax),%eax
  10301e:	3c 2b                	cmp    $0x2b,%al
  103020:	75 05                	jne    103027 <strtol+0x3c>
        s ++;
  103022:	ff 45 08             	incl   0x8(%ebp)
  103025:	eb 14                	jmp    10303b <strtol+0x50>
    }
    else if (*s == '-') {
  103027:	8b 45 08             	mov    0x8(%ebp),%eax
  10302a:	0f b6 00             	movzbl (%eax),%eax
  10302d:	3c 2d                	cmp    $0x2d,%al
  10302f:	75 0a                	jne    10303b <strtol+0x50>
        s ++, neg = 1;
  103031:	ff 45 08             	incl   0x8(%ebp)
  103034:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  10303b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10303f:	74 06                	je     103047 <strtol+0x5c>
  103041:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  103045:	75 22                	jne    103069 <strtol+0x7e>
  103047:	8b 45 08             	mov    0x8(%ebp),%eax
  10304a:	0f b6 00             	movzbl (%eax),%eax
  10304d:	3c 30                	cmp    $0x30,%al
  10304f:	75 18                	jne    103069 <strtol+0x7e>
  103051:	8b 45 08             	mov    0x8(%ebp),%eax
  103054:	40                   	inc    %eax
  103055:	0f b6 00             	movzbl (%eax),%eax
  103058:	3c 78                	cmp    $0x78,%al
  10305a:	75 0d                	jne    103069 <strtol+0x7e>
        s += 2, base = 16;
  10305c:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  103060:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  103067:	eb 29                	jmp    103092 <strtol+0xa7>
    }
    else if (base == 0 && s[0] == '0') {
  103069:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10306d:	75 16                	jne    103085 <strtol+0x9a>
  10306f:	8b 45 08             	mov    0x8(%ebp),%eax
  103072:	0f b6 00             	movzbl (%eax),%eax
  103075:	3c 30                	cmp    $0x30,%al
  103077:	75 0c                	jne    103085 <strtol+0x9a>
        s ++, base = 8;
  103079:	ff 45 08             	incl   0x8(%ebp)
  10307c:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  103083:	eb 0d                	jmp    103092 <strtol+0xa7>
    }
    else if (base == 0) {
  103085:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103089:	75 07                	jne    103092 <strtol+0xa7>
        base = 10;
  10308b:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  103092:	8b 45 08             	mov    0x8(%ebp),%eax
  103095:	0f b6 00             	movzbl (%eax),%eax
  103098:	3c 2f                	cmp    $0x2f,%al
  10309a:	7e 1b                	jle    1030b7 <strtol+0xcc>
  10309c:	8b 45 08             	mov    0x8(%ebp),%eax
  10309f:	0f b6 00             	movzbl (%eax),%eax
  1030a2:	3c 39                	cmp    $0x39,%al
  1030a4:	7f 11                	jg     1030b7 <strtol+0xcc>
            dig = *s - '0';
  1030a6:	8b 45 08             	mov    0x8(%ebp),%eax
  1030a9:	0f b6 00             	movzbl (%eax),%eax
  1030ac:	0f be c0             	movsbl %al,%eax
  1030af:	83 e8 30             	sub    $0x30,%eax
  1030b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1030b5:	eb 48                	jmp    1030ff <strtol+0x114>
        }
        else if (*s >= 'a' && *s <= 'z') {
  1030b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ba:	0f b6 00             	movzbl (%eax),%eax
  1030bd:	3c 60                	cmp    $0x60,%al
  1030bf:	7e 1b                	jle    1030dc <strtol+0xf1>
  1030c1:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c4:	0f b6 00             	movzbl (%eax),%eax
  1030c7:	3c 7a                	cmp    $0x7a,%al
  1030c9:	7f 11                	jg     1030dc <strtol+0xf1>
            dig = *s - 'a' + 10;
  1030cb:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ce:	0f b6 00             	movzbl (%eax),%eax
  1030d1:	0f be c0             	movsbl %al,%eax
  1030d4:	83 e8 57             	sub    $0x57,%eax
  1030d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1030da:	eb 23                	jmp    1030ff <strtol+0x114>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  1030dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1030df:	0f b6 00             	movzbl (%eax),%eax
  1030e2:	3c 40                	cmp    $0x40,%al
  1030e4:	7e 3b                	jle    103121 <strtol+0x136>
  1030e6:	8b 45 08             	mov    0x8(%ebp),%eax
  1030e9:	0f b6 00             	movzbl (%eax),%eax
  1030ec:	3c 5a                	cmp    $0x5a,%al
  1030ee:	7f 31                	jg     103121 <strtol+0x136>
            dig = *s - 'A' + 10;
  1030f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1030f3:	0f b6 00             	movzbl (%eax),%eax
  1030f6:	0f be c0             	movsbl %al,%eax
  1030f9:	83 e8 37             	sub    $0x37,%eax
  1030fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  1030ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103102:	3b 45 10             	cmp    0x10(%ebp),%eax
  103105:	7d 19                	jge    103120 <strtol+0x135>
            break;
        }
        s ++, val = (val * base) + dig;
  103107:	ff 45 08             	incl   0x8(%ebp)
  10310a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10310d:	0f af 45 10          	imul   0x10(%ebp),%eax
  103111:	89 c2                	mov    %eax,%edx
  103113:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103116:	01 d0                	add    %edx,%eax
  103118:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  10311b:	e9 72 ff ff ff       	jmp    103092 <strtol+0xa7>
            break;
  103120:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  103121:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103125:	74 08                	je     10312f <strtol+0x144>
        *endptr = (char *) s;
  103127:	8b 45 0c             	mov    0xc(%ebp),%eax
  10312a:	8b 55 08             	mov    0x8(%ebp),%edx
  10312d:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  10312f:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  103133:	74 07                	je     10313c <strtol+0x151>
  103135:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103138:	f7 d8                	neg    %eax
  10313a:	eb 03                	jmp    10313f <strtol+0x154>
  10313c:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  10313f:	c9                   	leave  
  103140:	c3                   	ret    

00103141 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  103141:	55                   	push   %ebp
  103142:	89 e5                	mov    %esp,%ebp
  103144:	57                   	push   %edi
  103145:	83 ec 24             	sub    $0x24,%esp
  103148:	8b 45 0c             	mov    0xc(%ebp),%eax
  10314b:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  10314e:	0f be 55 d8          	movsbl -0x28(%ebp),%edx
  103152:	8b 45 08             	mov    0x8(%ebp),%eax
  103155:	89 45 f8             	mov    %eax,-0x8(%ebp)
  103158:	88 55 f7             	mov    %dl,-0x9(%ebp)
  10315b:	8b 45 10             	mov    0x10(%ebp),%eax
  10315e:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  103161:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  103164:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  103168:	8b 55 f8             	mov    -0x8(%ebp),%edx
  10316b:	89 d7                	mov    %edx,%edi
  10316d:	f3 aa                	rep stos %al,%es:(%edi)
  10316f:	89 fa                	mov    %edi,%edx
  103171:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  103174:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  103177:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  10317a:	83 c4 24             	add    $0x24,%esp
  10317d:	5f                   	pop    %edi
  10317e:	5d                   	pop    %ebp
  10317f:	c3                   	ret    

00103180 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  103180:	55                   	push   %ebp
  103181:	89 e5                	mov    %esp,%ebp
  103183:	57                   	push   %edi
  103184:	56                   	push   %esi
  103185:	53                   	push   %ebx
  103186:	83 ec 30             	sub    $0x30,%esp
  103189:	8b 45 08             	mov    0x8(%ebp),%eax
  10318c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10318f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103192:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103195:	8b 45 10             	mov    0x10(%ebp),%eax
  103198:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  10319b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10319e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1031a1:	73 42                	jae    1031e5 <memmove+0x65>
  1031a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1031a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1031ac:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1031af:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1031b2:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1031b5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1031b8:	c1 e8 02             	shr    $0x2,%eax
  1031bb:	89 c1                	mov    %eax,%ecx
    asm volatile (
  1031bd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1031c0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1031c3:	89 d7                	mov    %edx,%edi
  1031c5:	89 c6                	mov    %eax,%esi
  1031c7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1031c9:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1031cc:	83 e1 03             	and    $0x3,%ecx
  1031cf:	74 02                	je     1031d3 <memmove+0x53>
  1031d1:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1031d3:	89 f0                	mov    %esi,%eax
  1031d5:	89 fa                	mov    %edi,%edx
  1031d7:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  1031da:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  1031dd:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  1031e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  1031e3:	eb 36                	jmp    10321b <memmove+0x9b>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  1031e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1031e8:	8d 50 ff             	lea    -0x1(%eax),%edx
  1031eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1031ee:	01 c2                	add    %eax,%edx
  1031f0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1031f3:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1031f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031f9:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  1031fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1031ff:	89 c1                	mov    %eax,%ecx
  103201:	89 d8                	mov    %ebx,%eax
  103203:	89 d6                	mov    %edx,%esi
  103205:	89 c7                	mov    %eax,%edi
  103207:	fd                   	std    
  103208:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10320a:	fc                   	cld    
  10320b:	89 f8                	mov    %edi,%eax
  10320d:	89 f2                	mov    %esi,%edx
  10320f:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  103212:	89 55 c8             	mov    %edx,-0x38(%ebp)
  103215:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  103218:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  10321b:	83 c4 30             	add    $0x30,%esp
  10321e:	5b                   	pop    %ebx
  10321f:	5e                   	pop    %esi
  103220:	5f                   	pop    %edi
  103221:	5d                   	pop    %ebp
  103222:	c3                   	ret    

00103223 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  103223:	55                   	push   %ebp
  103224:	89 e5                	mov    %esp,%ebp
  103226:	57                   	push   %edi
  103227:	56                   	push   %esi
  103228:	83 ec 20             	sub    $0x20,%esp
  10322b:	8b 45 08             	mov    0x8(%ebp),%eax
  10322e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103231:	8b 45 0c             	mov    0xc(%ebp),%eax
  103234:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103237:	8b 45 10             	mov    0x10(%ebp),%eax
  10323a:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  10323d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103240:	c1 e8 02             	shr    $0x2,%eax
  103243:	89 c1                	mov    %eax,%ecx
    asm volatile (
  103245:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103248:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10324b:	89 d7                	mov    %edx,%edi
  10324d:	89 c6                	mov    %eax,%esi
  10324f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103251:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  103254:	83 e1 03             	and    $0x3,%ecx
  103257:	74 02                	je     10325b <memcpy+0x38>
  103259:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10325b:	89 f0                	mov    %esi,%eax
  10325d:	89 fa                	mov    %edi,%edx
  10325f:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103262:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103265:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  103268:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  10326b:	83 c4 20             	add    $0x20,%esp
  10326e:	5e                   	pop    %esi
  10326f:	5f                   	pop    %edi
  103270:	5d                   	pop    %ebp
  103271:	c3                   	ret    

00103272 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  103272:	55                   	push   %ebp
  103273:	89 e5                	mov    %esp,%ebp
  103275:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  103278:	8b 45 08             	mov    0x8(%ebp),%eax
  10327b:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  10327e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103281:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  103284:	eb 2e                	jmp    1032b4 <memcmp+0x42>
        if (*s1 != *s2) {
  103286:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103289:	0f b6 10             	movzbl (%eax),%edx
  10328c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10328f:	0f b6 00             	movzbl (%eax),%eax
  103292:	38 c2                	cmp    %al,%dl
  103294:	74 18                	je     1032ae <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  103296:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103299:	0f b6 00             	movzbl (%eax),%eax
  10329c:	0f b6 d0             	movzbl %al,%edx
  10329f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1032a2:	0f b6 00             	movzbl (%eax),%eax
  1032a5:	0f b6 c0             	movzbl %al,%eax
  1032a8:	29 c2                	sub    %eax,%edx
  1032aa:	89 d0                	mov    %edx,%eax
  1032ac:	eb 18                	jmp    1032c6 <memcmp+0x54>
        }
        s1 ++, s2 ++;
  1032ae:	ff 45 fc             	incl   -0x4(%ebp)
  1032b1:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  1032b4:	8b 45 10             	mov    0x10(%ebp),%eax
  1032b7:	8d 50 ff             	lea    -0x1(%eax),%edx
  1032ba:	89 55 10             	mov    %edx,0x10(%ebp)
  1032bd:	85 c0                	test   %eax,%eax
  1032bf:	75 c5                	jne    103286 <memcmp+0x14>
    }
    return 0;
  1032c1:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1032c6:	c9                   	leave  
  1032c7:	c3                   	ret    
