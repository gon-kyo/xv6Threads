
_test_12:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}

void worker(void *arg1, void *arg2);

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
   ppid = getpid();
  14:	e8 e2 06 00 00       	call   6fb <getpid>

   int arg1 = 11, arg2 = 22;

   lock_init(&lock);
  19:	83 ec 0c             	sub    $0xc,%esp
   int arg1 = 11, arg2 = 22;
  1c:	c7 45 e0 0b 00 00 00 	movl   $0xb,-0x20(%ebp)
   lock_init(&lock);
  23:	68 70 0f 00 00       	push   $0xf70
   ppid = getpid();
  28:	a3 7c 0f 00 00       	mov    %eax,0xf7c
   int arg1 = 11, arg2 = 22;
  2d:	c7 45 e4 16 00 00 00 	movl   $0x16,-0x1c(%ebp)
   lock_init(&lock);
  34:	e8 27 06 00 00       	call   660 <lock_init>
   lock_init(&lock2);
  39:	c7 04 24 6c 0f 00 00 	movl   $0xf6c,(%esp)
  40:	e8 1b 06 00 00       	call   660 <lock_init>
   lock_acquire(&lock);
  45:	c7 04 24 70 0f 00 00 	movl   $0xf70,(%esp)
  4c:	e8 ef 05 00 00       	call   640 <lock_acquire>
   lock_acquire(&lock2);
  51:	c7 04 24 6c 0f 00 00 	movl   $0xf6c,(%esp)
  58:	e8 e3 05 00 00       	call   640 <lock_acquire>

   for (int i = 0; i < num_threads; i++) {
  5d:	8b 35 68 0f 00 00    	mov    0xf68,%esi
  63:	83 c4 10             	add    $0x10,%esp
  66:	85 f6                	test   %esi,%esi
  68:	7e 75                	jle    df <main+0xdf>
  6a:	31 db                	xor    %ebx,%ebx
  6c:	8d 7d e4             	lea    -0x1c(%ebp),%edi
  6f:	8d 75 e0             	lea    -0x20(%ebp),%esi
  72:	eb 0f                	jmp    83 <main+0x83>
  74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  78:	83 c3 01             	add    $0x1,%ebx
  7b:	39 1d 68 0f 00 00    	cmp    %ebx,0xf68
  81:	7e 5c                	jle    df <main+0xdf>
      int thread_pid = thread_create(worker, &arg1, &arg2);
  83:	83 ec 04             	sub    $0x4,%esp
  86:	57                   	push   %edi
  87:	56                   	push   %esi
  88:	68 20 02 00 00       	push   $0x220
  8d:	e8 9e 05 00 00       	call   630 <thread_create>
      assert(thread_pid > 0);
  92:	83 c4 10             	add    $0x10,%esp
  95:	85 c0                	test   %eax,%eax
  97:	7f df                	jg     78 <main+0x78>
  99:	6a 28                	push   $0x28
  9b:	68 08 0b 00 00       	push   $0xb08
  a0:	68 12 0b 00 00       	push   $0xb12
  a5:	6a 01                	push   $0x1
  a7:	e8 34 07 00 00       	call   7e0 <printf>
  ac:	83 c4 0c             	add    $0xc,%esp
  af:	68 59 0b 00 00       	push   $0xb59
   }
   lock_release(&lock2);

   for (int i = 0; i < num_threads; i++) {
      int join_pid = thread_join();
      assert(join_pid > 0);
  b4:	68 38 0b 00 00       	push   $0xb38
  b9:	6a 01                	push   $0x1
  bb:	e8 20 07 00 00       	call   7e0 <printf>
  c0:	5a                   	pop    %edx
  c1:	59                   	pop    %ecx
  c2:	68 4c 0b 00 00       	push   $0xb4c
  c7:	6a 01                	push   $0x1
  c9:	e8 12 07 00 00       	call   7e0 <printf>
  ce:	5b                   	pop    %ebx
  cf:	ff 35 7c 0f 00 00    	push   0xf7c
  d5:	e8 d1 05 00 00       	call   6ab <kill>
  da:	e8 9c 05 00 00       	call   67b <exit>
   size = (unsigned int)sbrk(0);
  df:	83 ec 0c             	sub    $0xc,%esp
  e2:	6a 00                	push   $0x0
  e4:	e8 1a 06 00 00       	call   703 <sbrk>
   while (global < num_threads) {
  e9:	83 c4 10             	add    $0x10,%esp
   size = (unsigned int)sbrk(0);
  ec:	a3 74 0f 00 00       	mov    %eax,0xf74
   while (global < num_threads) {
  f1:	a1 68 0f 00 00       	mov    0xf68,%eax
  f6:	39 05 78 0f 00 00    	cmp    %eax,0xf78
  fc:	7d 37                	jge    135 <main+0x135>
  fe:	66 90                	xchg   %ax,%ax
      lock_release(&lock);
 100:	83 ec 0c             	sub    $0xc,%esp
 103:	68 70 0f 00 00       	push   $0xf70
 108:	e8 43 05 00 00       	call   650 <lock_release>
      sleep(100);
 10d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 114:	e8 f2 05 00 00       	call   70b <sleep>
      lock_acquire(&lock);
 119:	c7 04 24 70 0f 00 00 	movl   $0xf70,(%esp)
 120:	e8 1b 05 00 00       	call   640 <lock_acquire>
   while (global < num_threads) {
 125:	a1 68 0f 00 00       	mov    0xf68,%eax
 12a:	83 c4 10             	add    $0x10,%esp
 12d:	39 05 78 0f 00 00    	cmp    %eax,0xf78
 133:	7c cb                	jl     100 <main+0x100>
   global = 0;
 135:	c7 05 78 0f 00 00 00 	movl   $0x0,0xf78
 13c:	00 00 00 
   sbrk(10000);
 13f:	83 ec 0c             	sub    $0xc,%esp
 142:	68 10 27 00 00       	push   $0x2710
 147:	e8 b7 05 00 00       	call   703 <sbrk>
   size = (unsigned int)sbrk(0);
 14c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 153:	e8 ab 05 00 00       	call   703 <sbrk>
   lock_release(&lock);
 158:	c7 04 24 70 0f 00 00 	movl   $0xf70,(%esp)
   size = (unsigned int)sbrk(0);
 15f:	a3 74 0f 00 00       	mov    %eax,0xf74
   lock_release(&lock);
 164:	e8 e7 04 00 00       	call   650 <lock_release>
   while (global < num_threads) {
 169:	a1 68 0f 00 00       	mov    0xf68,%eax
 16e:	83 c4 10             	add    $0x10,%esp
 171:	39 05 78 0f 00 00    	cmp    %eax,0xf78
 177:	7d 3c                	jge    1b5 <main+0x1b5>
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      lock_release(&lock2);
 180:	83 ec 0c             	sub    $0xc,%esp
 183:	68 6c 0f 00 00       	push   $0xf6c
 188:	e8 c3 04 00 00       	call   650 <lock_release>
      sleep(100);
 18d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 194:	e8 72 05 00 00       	call   70b <sleep>
      lock_acquire(&lock2);
 199:	c7 04 24 6c 0f 00 00 	movl   $0xf6c,(%esp)
 1a0:	e8 9b 04 00 00       	call   640 <lock_acquire>
   while (global < num_threads) {
 1a5:	a1 68 0f 00 00       	mov    0xf68,%eax
 1aa:	83 c4 10             	add    $0x10,%esp
 1ad:	39 05 78 0f 00 00    	cmp    %eax,0xf78
 1b3:	7c cb                	jl     180 <main+0x180>
   lock_release(&lock2);
 1b5:	83 ec 0c             	sub    $0xc,%esp
 1b8:	68 6c 0f 00 00       	push   $0xf6c
 1bd:	e8 8e 04 00 00       	call   650 <lock_release>
   for (int i = 0; i < num_threads; i++) {
 1c2:	83 c4 10             	add    $0x10,%esp
 1c5:	83 3d 68 0f 00 00 00 	cmpl   $0x0,0xf68
 1cc:	7e 3e                	jle    20c <main+0x20c>
 1ce:	31 db                	xor    %ebx,%ebx
 1d0:	eb 11                	jmp    1e3 <main+0x1e3>
 1d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1d8:	83 c3 01             	add    $0x1,%ebx
 1db:	39 1d 68 0f 00 00    	cmp    %ebx,0xf68
 1e1:	7e 29                	jle    20c <main+0x20c>
      int join_pid = thread_join();
 1e3:	e8 88 04 00 00       	call   670 <thread_join>
      assert(join_pid > 0);
 1e8:	85 c0                	test   %eax,%eax
 1ea:	7f ec                	jg     1d8 <main+0x1d8>
 1ec:	6a 41                	push   $0x41
 1ee:	68 08 0b 00 00       	push   $0xb08
 1f3:	68 12 0b 00 00       	push   $0xb12
 1f8:	6a 01                	push   $0x1
 1fa:	e8 e1 05 00 00       	call   7e0 <printf>
 1ff:	83 c4 0c             	add    $0xc,%esp
 202:	68 68 0b 00 00       	push   $0xb68
 207:	e9 a8 fe ff ff       	jmp    b4 <main+0xb4>
   }

   printf(1, "TEST PASSED\n");
 20c:	50                   	push   %eax
 20d:	50                   	push   %eax
 20e:	68 75 0b 00 00       	push   $0xb75
 213:	6a 01                	push   $0x1
 215:	e8 c6 05 00 00       	call   7e0 <printf>
   exit();
 21a:	e8 5c 04 00 00       	call   67b <exit>
 21f:	90                   	nop

00000220 <worker>:
   
   exit();
}


void worker(void *arg1, void *arg2) {
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
 226:	68 70 0f 00 00       	push   $0xf70
 22b:	e8 10 04 00 00       	call   640 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 230:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 237:	e8 c7 04 00 00       	call   703 <sbrk>
 23c:	83 c4 10             	add    $0x10,%esp
 23f:	3b 05 74 0f 00 00    	cmp    0xf74,%eax
 245:	74 46                	je     28d <worker+0x6d>
 247:	6a 5b                	push   $0x5b

   


   lock_acquire(&lock2);
   assert((unsigned int)sbrk(0) == size);
 249:	68 08 0b 00 00       	push   $0xb08
 24e:	68 12 0b 00 00       	push   $0xb12
 253:	6a 01                	push   $0x1
 255:	e8 86 05 00 00       	call   7e0 <printf>
 25a:	83 c4 0c             	add    $0xc,%esp
 25d:	68 1a 0b 00 00       	push   $0xb1a
 262:	68 38 0b 00 00       	push   $0xb38
 267:	6a 01                	push   $0x1
 269:	e8 72 05 00 00       	call   7e0 <printf>
 26e:	58                   	pop    %eax
 26f:	5a                   	pop    %edx
 270:	68 4c 0b 00 00       	push   $0xb4c
 275:	6a 01                	push   $0x1
 277:	e8 64 05 00 00       	call   7e0 <printf>
 27c:	59                   	pop    %ecx
 27d:	ff 35 7c 0f 00 00    	push   0xf7c
 283:	e8 23 04 00 00       	call   6ab <kill>
 288:	e8 ee 03 00 00       	call   67b <exit>
   lock_release(&lock);
 28d:	83 ec 0c             	sub    $0xc,%esp
   global++;
 290:	83 05 78 0f 00 00 01 	addl   $0x1,0xf78
   lock_release(&lock);
 297:	68 70 0f 00 00       	push   $0xf70
 29c:	e8 af 03 00 00       	call   650 <lock_release>
   lock_acquire(&lock2);
 2a1:	c7 04 24 6c 0f 00 00 	movl   $0xf6c,(%esp)
 2a8:	e8 93 03 00 00       	call   640 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 2ad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2b4:	e8 4a 04 00 00       	call   703 <sbrk>
 2b9:	83 c4 10             	add    $0x10,%esp
 2bc:	3b 05 74 0f 00 00    	cmp    0xf74,%eax
 2c2:	74 04                	je     2c8 <worker+0xa8>
 2c4:	6a 63                	push   $0x63
 2c6:	eb 81                	jmp    249 <worker+0x29>
   global++;
   sbrk(10000);
 2c8:	83 ec 0c             	sub    $0xc,%esp
   global++;
 2cb:	83 05 78 0f 00 00 01 	addl   $0x1,0xf78
   sbrk(10000);
 2d2:	68 10 27 00 00       	push   $0x2710
 2d7:	e8 27 04 00 00       	call   703 <sbrk>
   size = (unsigned int)sbrk(0);
 2dc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2e3:	e8 1b 04 00 00       	call   703 <sbrk>
   lock_release(&lock2);
 2e8:	c7 04 24 6c 0f 00 00 	movl   $0xf6c,(%esp)
   size = (unsigned int)sbrk(0);
 2ef:	a3 74 0f 00 00       	mov    %eax,0xf74
   lock_release(&lock2);
 2f4:	e8 57 03 00 00       	call   650 <lock_release>



   exit();
 2f9:	e8 7d 03 00 00       	call   67b <exit>
 2fe:	66 90                	xchg   %ax,%ax

00000300 <worker2>:
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	83 ec 08             	sub    $0x8,%esp
   int arg2_int = *(int*)arg2;
 306:	8b 45 0c             	mov    0xc(%ebp),%eax
 309:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 11);
 30b:	8b 45 08             	mov    0x8(%ebp),%eax
 30e:	83 38 0b             	cmpl   $0xb,(%eax)
 311:	75 4b                	jne    35e <worker2+0x5e>
   assert(arg2_int == 22);
 313:	83 fa 16             	cmp    $0x16,%edx
 316:	74 63                	je     37b <worker2+0x7b>
 318:	6a 4d                	push   $0x4d
 31a:	68 08 0b 00 00       	push   $0xb08
 31f:	68 12 0b 00 00       	push   $0xb12
 324:	6a 01                	push   $0x1
 326:	e8 b5 04 00 00       	call   7e0 <printf>
 32b:	83 c4 0c             	add    $0xc,%esp
 32e:	68 91 0b 00 00       	push   $0xb91
 333:	68 38 0b 00 00       	push   $0xb38
 338:	6a 01                	push   $0x1
 33a:	e8 a1 04 00 00       	call   7e0 <printf>
 33f:	58                   	pop    %eax
 340:	5a                   	pop    %edx
 341:	68 4c 0b 00 00       	push   $0xb4c
 346:	6a 01                	push   $0x1
 348:	e8 93 04 00 00       	call   7e0 <printf>
 34d:	59                   	pop    %ecx
 34e:	ff 35 7c 0f 00 00    	push   0xf7c
 354:	e8 52 03 00 00       	call   6ab <kill>
 359:	e8 1d 03 00 00       	call   67b <exit>
   assert(arg1_int == 11);
 35e:	6a 4c                	push   $0x4c
 360:	68 08 0b 00 00       	push   $0xb08
 365:	68 12 0b 00 00       	push   $0xb12
 36a:	6a 01                	push   $0x1
 36c:	e8 6f 04 00 00       	call   7e0 <printf>
 371:	83 c4 0c             	add    $0xc,%esp
 374:	68 82 0b 00 00       	push   $0xb82
 379:	eb b8                	jmp    333 <worker2+0x33>
   lock_acquire(&lock2);
 37b:	83 ec 0c             	sub    $0xc,%esp
 37e:	68 6c 0f 00 00       	push   $0xf6c
 383:	e8 b8 02 00 00       	call   640 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 388:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 38f:	e8 6f 03 00 00       	call   703 <sbrk>
 394:	83 c4 10             	add    $0x10,%esp
 397:	3b 05 74 0f 00 00    	cmp    0xf74,%eax
 39d:	74 20                	je     3bf <worker2+0xbf>
 39f:	6a 50                	push   $0x50
 3a1:	68 08 0b 00 00       	push   $0xb08
 3a6:	68 12 0b 00 00       	push   $0xb12
 3ab:	6a 01                	push   $0x1
 3ad:	e8 2e 04 00 00       	call   7e0 <printf>
 3b2:	83 c4 0c             	add    $0xc,%esp
 3b5:	68 1a 0b 00 00       	push   $0xb1a
 3ba:	e9 74 ff ff ff       	jmp    333 <worker2+0x33>
   lock_release(&lock2);
 3bf:	83 ec 0c             	sub    $0xc,%esp
   global++;
 3c2:	83 05 78 0f 00 00 01 	addl   $0x1,0xf78
   lock_release(&lock2);
 3c9:	68 6c 0f 00 00       	push   $0xf6c
 3ce:	e8 7d 02 00 00       	call   650 <lock_release>
   exit();
 3d3:	e8 a3 02 00 00       	call   67b <exit>
 3d8:	66 90                	xchg   %ax,%ax
 3da:	66 90                	xchg   %ax,%ax
 3dc:	66 90                	xchg   %ax,%ax
 3de:	66 90                	xchg   %ax,%ax

000003e0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 3e0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3e1:	31 c0                	xor    %eax,%eax
{
 3e3:	89 e5                	mov    %esp,%ebp
 3e5:	53                   	push   %ebx
 3e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 3f0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 3f4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 3f7:	83 c0 01             	add    $0x1,%eax
 3fa:	84 d2                	test   %dl,%dl
 3fc:	75 f2                	jne    3f0 <strcpy+0x10>
    ;
  return os;
}
 3fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 401:	89 c8                	mov    %ecx,%eax
 403:	c9                   	leave  
 404:	c3                   	ret    
 405:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000410 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	53                   	push   %ebx
 414:	8b 55 08             	mov    0x8(%ebp),%edx
 417:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 41a:	0f b6 02             	movzbl (%edx),%eax
 41d:	84 c0                	test   %al,%al
 41f:	75 17                	jne    438 <strcmp+0x28>
 421:	eb 3a                	jmp    45d <strcmp+0x4d>
 423:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 427:	90                   	nop
 428:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 42c:	83 c2 01             	add    $0x1,%edx
 42f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 432:	84 c0                	test   %al,%al
 434:	74 1a                	je     450 <strcmp+0x40>
    p++, q++;
 436:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 438:	0f b6 19             	movzbl (%ecx),%ebx
 43b:	38 c3                	cmp    %al,%bl
 43d:	74 e9                	je     428 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 43f:	29 d8                	sub    %ebx,%eax
}
 441:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 444:	c9                   	leave  
 445:	c3                   	ret    
 446:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 450:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 454:	31 c0                	xor    %eax,%eax
 456:	29 d8                	sub    %ebx,%eax
}
 458:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 45b:	c9                   	leave  
 45c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 45d:	0f b6 19             	movzbl (%ecx),%ebx
 460:	31 c0                	xor    %eax,%eax
 462:	eb db                	jmp    43f <strcmp+0x2f>
 464:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop

00000470 <strlen>:

uint
strlen(const char *s)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 476:	80 3a 00             	cmpb   $0x0,(%edx)
 479:	74 15                	je     490 <strlen+0x20>
 47b:	31 c0                	xor    %eax,%eax
 47d:	8d 76 00             	lea    0x0(%esi),%esi
 480:	83 c0 01             	add    $0x1,%eax
 483:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 487:	89 c1                	mov    %eax,%ecx
 489:	75 f5                	jne    480 <strlen+0x10>
    ;
  return n;
}
 48b:	89 c8                	mov    %ecx,%eax
 48d:	5d                   	pop    %ebp
 48e:	c3                   	ret    
 48f:	90                   	nop
  for(n = 0; s[n]; n++)
 490:	31 c9                	xor    %ecx,%ecx
}
 492:	5d                   	pop    %ebp
 493:	89 c8                	mov    %ecx,%eax
 495:	c3                   	ret    
 496:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49d:	8d 76 00             	lea    0x0(%esi),%esi

000004a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ad:	89 d7                	mov    %edx,%edi
 4af:	fc                   	cld    
 4b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4b2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4b5:	89 d0                	mov    %edx,%eax
 4b7:	c9                   	leave  
 4b8:	c3                   	ret    
 4b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004c0 <strchr>:

char*
strchr(const char *s, char c)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	8b 45 08             	mov    0x8(%ebp),%eax
 4c6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4ca:	0f b6 10             	movzbl (%eax),%edx
 4cd:	84 d2                	test   %dl,%dl
 4cf:	75 12                	jne    4e3 <strchr+0x23>
 4d1:	eb 1d                	jmp    4f0 <strchr+0x30>
 4d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4d7:	90                   	nop
 4d8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 4dc:	83 c0 01             	add    $0x1,%eax
 4df:	84 d2                	test   %dl,%dl
 4e1:	74 0d                	je     4f0 <strchr+0x30>
    if(*s == c)
 4e3:	38 d1                	cmp    %dl,%cl
 4e5:	75 f1                	jne    4d8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 4e7:	5d                   	pop    %ebp
 4e8:	c3                   	ret    
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 4f0:	31 c0                	xor    %eax,%eax
}
 4f2:	5d                   	pop    %ebp
 4f3:	c3                   	ret    
 4f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4ff:	90                   	nop

00000500 <gets>:

char*
gets(char *buf, int max)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 505:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 508:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 509:	31 db                	xor    %ebx,%ebx
{
 50b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 50e:	eb 27                	jmp    537 <gets+0x37>
    cc = read(0, &c, 1);
 510:	83 ec 04             	sub    $0x4,%esp
 513:	6a 01                	push   $0x1
 515:	57                   	push   %edi
 516:	6a 00                	push   $0x0
 518:	e8 76 01 00 00       	call   693 <read>
    if(cc < 1)
 51d:	83 c4 10             	add    $0x10,%esp
 520:	85 c0                	test   %eax,%eax
 522:	7e 1d                	jle    541 <gets+0x41>
      break;
    buf[i++] = c;
 524:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 528:	8b 55 08             	mov    0x8(%ebp),%edx
 52b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 52f:	3c 0a                	cmp    $0xa,%al
 531:	74 1d                	je     550 <gets+0x50>
 533:	3c 0d                	cmp    $0xd,%al
 535:	74 19                	je     550 <gets+0x50>
  for(i=0; i+1 < max; ){
 537:	89 de                	mov    %ebx,%esi
 539:	83 c3 01             	add    $0x1,%ebx
 53c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 53f:	7c cf                	jl     510 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 541:	8b 45 08             	mov    0x8(%ebp),%eax
 544:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 548:	8d 65 f4             	lea    -0xc(%ebp),%esp
 54b:	5b                   	pop    %ebx
 54c:	5e                   	pop    %esi
 54d:	5f                   	pop    %edi
 54e:	5d                   	pop    %ebp
 54f:	c3                   	ret    
  buf[i] = '\0';
 550:	8b 45 08             	mov    0x8(%ebp),%eax
 553:	89 de                	mov    %ebx,%esi
 555:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 559:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55c:	5b                   	pop    %ebx
 55d:	5e                   	pop    %esi
 55e:	5f                   	pop    %edi
 55f:	5d                   	pop    %ebp
 560:	c3                   	ret    
 561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 568:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56f:	90                   	nop

00000570 <stat>:

int
stat(const char *n, struct stat *st)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	56                   	push   %esi
 574:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 575:	83 ec 08             	sub    $0x8,%esp
 578:	6a 00                	push   $0x0
 57a:	ff 75 08             	push   0x8(%ebp)
 57d:	e8 39 01 00 00       	call   6bb <open>
  if(fd < 0)
 582:	83 c4 10             	add    $0x10,%esp
 585:	85 c0                	test   %eax,%eax
 587:	78 27                	js     5b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 589:	83 ec 08             	sub    $0x8,%esp
 58c:	ff 75 0c             	push   0xc(%ebp)
 58f:	89 c3                	mov    %eax,%ebx
 591:	50                   	push   %eax
 592:	e8 3c 01 00 00       	call   6d3 <fstat>
  close(fd);
 597:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 59a:	89 c6                	mov    %eax,%esi
  close(fd);
 59c:	e8 02 01 00 00       	call   6a3 <close>
  return r;
 5a1:	83 c4 10             	add    $0x10,%esp
}
 5a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5a7:	89 f0                	mov    %esi,%eax
 5a9:	5b                   	pop    %ebx
 5aa:	5e                   	pop    %esi
 5ab:	5d                   	pop    %ebp
 5ac:	c3                   	ret    
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 5b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5b5:	eb ed                	jmp    5a4 <stat+0x34>
 5b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5be:	66 90                	xchg   %ax,%ax

000005c0 <atoi>:

int
atoi(const char *s)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	53                   	push   %ebx
 5c4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5c7:	0f be 02             	movsbl (%edx),%eax
 5ca:	8d 48 d0             	lea    -0x30(%eax),%ecx
 5cd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 5d0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 5d5:	77 1e                	ja     5f5 <atoi+0x35>
 5d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5de:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 5e0:	83 c2 01             	add    $0x1,%edx
 5e3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 5e6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 5ea:	0f be 02             	movsbl (%edx),%eax
 5ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5f0:	80 fb 09             	cmp    $0x9,%bl
 5f3:	76 eb                	jbe    5e0 <atoi+0x20>
  return n;
}
 5f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5f8:	89 c8                	mov    %ecx,%eax
 5fa:	c9                   	leave  
 5fb:	c3                   	ret    
 5fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000600 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	8b 45 10             	mov    0x10(%ebp),%eax
 607:	8b 55 08             	mov    0x8(%ebp),%edx
 60a:	56                   	push   %esi
 60b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 60e:	85 c0                	test   %eax,%eax
 610:	7e 13                	jle    625 <memmove+0x25>
 612:	01 d0                	add    %edx,%eax
  dst = vdst;
 614:	89 d7                	mov    %edx,%edi
 616:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 620:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 621:	39 f8                	cmp    %edi,%eax
 623:	75 fb                	jne    620 <memmove+0x20>
  return vdst;
}
 625:	5e                   	pop    %esi
 626:	89 d0                	mov    %edx,%eax
 628:	5f                   	pop    %edi
 629:	5d                   	pop    %ebp
 62a:	c3                   	ret    
 62b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 62f:	90                   	nop

00000630 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
	return 0;
}
 630:	31 c0                	xor    %eax,%eax
 632:	c3                   	ret    
 633:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000640 <lock_acquire>:

void lock_acquire(lock_t * lock){
	
}
 640:	c3                   	ret    
 641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop

00000650 <lock_release>:
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	8b 45 08             	mov    0x8(%ebp),%eax
 656:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 65c:	5d                   	pop    %ebp
 65d:	c3                   	ret    
 65e:	66 90                	xchg   %ax,%ax

00000660 <lock_init>:

void lock_release(lock_t * lock){
	lock->state = 0;
}

void lock_init(lock_t * lock){
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
	//lock = malloc(sizeof(lock_t));
	lock->state = 0;
 663:	8b 45 08             	mov    0x8(%ebp),%eax
 666:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 66c:	5d                   	pop    %ebp
 66d:	c3                   	ret    
 66e:	66 90                	xchg   %ax,%ax

00000670 <thread_join>:

int thread_join(){

return 0;
}
 670:	31 c0                	xor    %eax,%eax
 672:	c3                   	ret    

00000673 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 673:	b8 01 00 00 00       	mov    $0x1,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    

0000067b <exit>:
SYSCALL(exit)
 67b:	b8 02 00 00 00       	mov    $0x2,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret    

00000683 <wait>:
SYSCALL(wait)
 683:	b8 03 00 00 00       	mov    $0x3,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret    

0000068b <pipe>:
SYSCALL(pipe)
 68b:	b8 04 00 00 00       	mov    $0x4,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret    

00000693 <read>:
SYSCALL(read)
 693:	b8 05 00 00 00       	mov    $0x5,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret    

0000069b <write>:
SYSCALL(write)
 69b:	b8 10 00 00 00       	mov    $0x10,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret    

000006a3 <close>:
SYSCALL(close)
 6a3:	b8 15 00 00 00       	mov    $0x15,%eax
 6a8:	cd 40                	int    $0x40
 6aa:	c3                   	ret    

000006ab <kill>:
SYSCALL(kill)
 6ab:	b8 06 00 00 00       	mov    $0x6,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret    

000006b3 <exec>:
SYSCALL(exec)
 6b3:	b8 07 00 00 00       	mov    $0x7,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret    

000006bb <open>:
SYSCALL(open)
 6bb:	b8 0f 00 00 00       	mov    $0xf,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret    

000006c3 <mknod>:
SYSCALL(mknod)
 6c3:	b8 11 00 00 00       	mov    $0x11,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret    

000006cb <unlink>:
SYSCALL(unlink)
 6cb:	b8 12 00 00 00       	mov    $0x12,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret    

000006d3 <fstat>:
SYSCALL(fstat)
 6d3:	b8 08 00 00 00       	mov    $0x8,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret    

000006db <link>:
SYSCALL(link)
 6db:	b8 13 00 00 00       	mov    $0x13,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    

000006e3 <mkdir>:
SYSCALL(mkdir)
 6e3:	b8 14 00 00 00       	mov    $0x14,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret    

000006eb <chdir>:
SYSCALL(chdir)
 6eb:	b8 09 00 00 00       	mov    $0x9,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret    

000006f3 <dup>:
SYSCALL(dup)
 6f3:	b8 0a 00 00 00       	mov    $0xa,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret    

000006fb <getpid>:
SYSCALL(getpid)
 6fb:	b8 0b 00 00 00       	mov    $0xb,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret    

00000703 <sbrk>:
SYSCALL(sbrk)
 703:	b8 0c 00 00 00       	mov    $0xc,%eax
 708:	cd 40                	int    $0x40
 70a:	c3                   	ret    

0000070b <sleep>:
SYSCALL(sleep)
 70b:	b8 0d 00 00 00       	mov    $0xd,%eax
 710:	cd 40                	int    $0x40
 712:	c3                   	ret    

00000713 <uptime>:
SYSCALL(uptime)
 713:	b8 0e 00 00 00       	mov    $0xe,%eax
 718:	cd 40                	int    $0x40
 71a:	c3                   	ret    

0000071b <clone>:
SYSCALL(clone)
 71b:	b8 16 00 00 00       	mov    $0x16,%eax
 720:	cd 40                	int    $0x40
 722:	c3                   	ret    

00000723 <join>:
SYSCALL(join)
 723:	b8 17 00 00 00       	mov    $0x17,%eax
 728:	cd 40                	int    $0x40
 72a:	c3                   	ret    
 72b:	66 90                	xchg   %ax,%ax
 72d:	66 90                	xchg   %ax,%ax
 72f:	90                   	nop

00000730 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 3c             	sub    $0x3c,%esp
 739:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 73c:	89 d1                	mov    %edx,%ecx
{
 73e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 741:	85 d2                	test   %edx,%edx
 743:	0f 89 7f 00 00 00    	jns    7c8 <printint+0x98>
 749:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 74d:	74 79                	je     7c8 <printint+0x98>
    neg = 1;
 74f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 756:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 758:	31 db                	xor    %ebx,%ebx
 75a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 75d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 760:	89 c8                	mov    %ecx,%eax
 762:	31 d2                	xor    %edx,%edx
 764:	89 cf                	mov    %ecx,%edi
 766:	f7 75 c4             	divl   -0x3c(%ebp)
 769:	0f b6 92 00 0c 00 00 	movzbl 0xc00(%edx),%edx
 770:	89 45 c0             	mov    %eax,-0x40(%ebp)
 773:	89 d8                	mov    %ebx,%eax
 775:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 778:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 77b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 77e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 781:	76 dd                	jbe    760 <printint+0x30>
  if(neg)
 783:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 786:	85 c9                	test   %ecx,%ecx
 788:	74 0c                	je     796 <printint+0x66>
    buf[i++] = '-';
 78a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 78f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 791:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 796:	8b 7d b8             	mov    -0x48(%ebp),%edi
 799:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 79d:	eb 07                	jmp    7a6 <printint+0x76>
 79f:	90                   	nop
    putc(fd, buf[i]);
 7a0:	0f b6 13             	movzbl (%ebx),%edx
 7a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 7a6:	83 ec 04             	sub    $0x4,%esp
 7a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 7ac:	6a 01                	push   $0x1
 7ae:	56                   	push   %esi
 7af:	57                   	push   %edi
 7b0:	e8 e6 fe ff ff       	call   69b <write>
  while(--i >= 0)
 7b5:	83 c4 10             	add    $0x10,%esp
 7b8:	39 de                	cmp    %ebx,%esi
 7ba:	75 e4                	jne    7a0 <printint+0x70>
}
 7bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7bf:	5b                   	pop    %ebx
 7c0:	5e                   	pop    %esi
 7c1:	5f                   	pop    %edi
 7c2:	5d                   	pop    %ebp
 7c3:	c3                   	ret    
 7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 7c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 7cf:	eb 87                	jmp    758 <printint+0x28>
 7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7df:	90                   	nop

000007e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	57                   	push   %edi
 7e4:	56                   	push   %esi
 7e5:	53                   	push   %ebx
 7e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 7ec:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 7ef:	0f b6 13             	movzbl (%ebx),%edx
 7f2:	84 d2                	test   %dl,%dl
 7f4:	74 6a                	je     860 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 7f6:	8d 45 10             	lea    0x10(%ebp),%eax
 7f9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 7fc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 7ff:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 801:	89 45 d0             	mov    %eax,-0x30(%ebp)
 804:	eb 36                	jmp    83c <printf+0x5c>
 806:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80d:	8d 76 00             	lea    0x0(%esi),%esi
 810:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 813:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 818:	83 f8 25             	cmp    $0x25,%eax
 81b:	74 15                	je     832 <printf+0x52>
  write(fd, &c, 1);
 81d:	83 ec 04             	sub    $0x4,%esp
 820:	88 55 e7             	mov    %dl,-0x19(%ebp)
 823:	6a 01                	push   $0x1
 825:	57                   	push   %edi
 826:	56                   	push   %esi
 827:	e8 6f fe ff ff       	call   69b <write>
 82c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 82f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 832:	0f b6 13             	movzbl (%ebx),%edx
 835:	83 c3 01             	add    $0x1,%ebx
 838:	84 d2                	test   %dl,%dl
 83a:	74 24                	je     860 <printf+0x80>
    c = fmt[i] & 0xff;
 83c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 83f:	85 c9                	test   %ecx,%ecx
 841:	74 cd                	je     810 <printf+0x30>
      }
    } else if(state == '%'){
 843:	83 f9 25             	cmp    $0x25,%ecx
 846:	75 ea                	jne    832 <printf+0x52>
      if(c == 'd'){
 848:	83 f8 25             	cmp    $0x25,%eax
 84b:	0f 84 07 01 00 00    	je     958 <printf+0x178>
 851:	83 e8 63             	sub    $0x63,%eax
 854:	83 f8 15             	cmp    $0x15,%eax
 857:	77 17                	ja     870 <printf+0x90>
 859:	ff 24 85 a8 0b 00 00 	jmp    *0xba8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 860:	8d 65 f4             	lea    -0xc(%ebp),%esp
 863:	5b                   	pop    %ebx
 864:	5e                   	pop    %esi
 865:	5f                   	pop    %edi
 866:	5d                   	pop    %ebp
 867:	c3                   	ret    
 868:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 86f:	90                   	nop
  write(fd, &c, 1);
 870:	83 ec 04             	sub    $0x4,%esp
 873:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 876:	6a 01                	push   $0x1
 878:	57                   	push   %edi
 879:	56                   	push   %esi
 87a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 87e:	e8 18 fe ff ff       	call   69b <write>
        putc(fd, c);
 883:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 887:	83 c4 0c             	add    $0xc,%esp
 88a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 88d:	6a 01                	push   $0x1
 88f:	57                   	push   %edi
 890:	56                   	push   %esi
 891:	e8 05 fe ff ff       	call   69b <write>
        putc(fd, c);
 896:	83 c4 10             	add    $0x10,%esp
      state = 0;
 899:	31 c9                	xor    %ecx,%ecx
 89b:	eb 95                	jmp    832 <printf+0x52>
 89d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 8a0:	83 ec 0c             	sub    $0xc,%esp
 8a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 8a8:	6a 00                	push   $0x0
 8aa:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8ad:	8b 10                	mov    (%eax),%edx
 8af:	89 f0                	mov    %esi,%eax
 8b1:	e8 7a fe ff ff       	call   730 <printint>
        ap++;
 8b6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 8ba:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8bd:	31 c9                	xor    %ecx,%ecx
 8bf:	e9 6e ff ff ff       	jmp    832 <printf+0x52>
 8c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 8c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8cb:	8b 10                	mov    (%eax),%edx
        ap++;
 8cd:	83 c0 04             	add    $0x4,%eax
 8d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 8d3:	85 d2                	test   %edx,%edx
 8d5:	0f 84 8d 00 00 00    	je     968 <printf+0x188>
        while(*s != 0){
 8db:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 8de:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 8e0:	84 c0                	test   %al,%al
 8e2:	0f 84 4a ff ff ff    	je     832 <printf+0x52>
 8e8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 8eb:	89 d3                	mov    %edx,%ebx
 8ed:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 8f0:	83 ec 04             	sub    $0x4,%esp
          s++;
 8f3:	83 c3 01             	add    $0x1,%ebx
 8f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8f9:	6a 01                	push   $0x1
 8fb:	57                   	push   %edi
 8fc:	56                   	push   %esi
 8fd:	e8 99 fd ff ff       	call   69b <write>
        while(*s != 0){
 902:	0f b6 03             	movzbl (%ebx),%eax
 905:	83 c4 10             	add    $0x10,%esp
 908:	84 c0                	test   %al,%al
 90a:	75 e4                	jne    8f0 <printf+0x110>
      state = 0;
 90c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 90f:	31 c9                	xor    %ecx,%ecx
 911:	e9 1c ff ff ff       	jmp    832 <printf+0x52>
 916:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 91d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 920:	83 ec 0c             	sub    $0xc,%esp
 923:	b9 0a 00 00 00       	mov    $0xa,%ecx
 928:	6a 01                	push   $0x1
 92a:	e9 7b ff ff ff       	jmp    8aa <printf+0xca>
 92f:	90                   	nop
        putc(fd, *ap);
 930:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 933:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 936:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 938:	6a 01                	push   $0x1
 93a:	57                   	push   %edi
 93b:	56                   	push   %esi
        putc(fd, *ap);
 93c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 93f:	e8 57 fd ff ff       	call   69b <write>
        ap++;
 944:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 948:	83 c4 10             	add    $0x10,%esp
      state = 0;
 94b:	31 c9                	xor    %ecx,%ecx
 94d:	e9 e0 fe ff ff       	jmp    832 <printf+0x52>
 952:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 958:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 95b:	83 ec 04             	sub    $0x4,%esp
 95e:	e9 2a ff ff ff       	jmp    88d <printf+0xad>
 963:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 967:	90                   	nop
          s = "(null)";
 968:	ba a0 0b 00 00       	mov    $0xba0,%edx
        while(*s != 0){
 96d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 970:	b8 28 00 00 00       	mov    $0x28,%eax
 975:	89 d3                	mov    %edx,%ebx
 977:	e9 74 ff ff ff       	jmp    8f0 <printf+0x110>
 97c:	66 90                	xchg   %ax,%ax
 97e:	66 90                	xchg   %ax,%ax

00000980 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 980:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 981:	a1 80 0f 00 00       	mov    0xf80,%eax
{
 986:	89 e5                	mov    %esp,%ebp
 988:	57                   	push   %edi
 989:	56                   	push   %esi
 98a:	53                   	push   %ebx
 98b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 98e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 991:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 998:	89 c2                	mov    %eax,%edx
 99a:	8b 00                	mov    (%eax),%eax
 99c:	39 ca                	cmp    %ecx,%edx
 99e:	73 30                	jae    9d0 <free+0x50>
 9a0:	39 c1                	cmp    %eax,%ecx
 9a2:	72 04                	jb     9a8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9a4:	39 c2                	cmp    %eax,%edx
 9a6:	72 f0                	jb     998 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9ae:	39 f8                	cmp    %edi,%eax
 9b0:	74 30                	je     9e2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 9b2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 9b5:	8b 42 04             	mov    0x4(%edx),%eax
 9b8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9bb:	39 f1                	cmp    %esi,%ecx
 9bd:	74 3a                	je     9f9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 9bf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 9c1:	5b                   	pop    %ebx
  freep = p;
 9c2:	89 15 80 0f 00 00    	mov    %edx,0xf80
}
 9c8:	5e                   	pop    %esi
 9c9:	5f                   	pop    %edi
 9ca:	5d                   	pop    %ebp
 9cb:	c3                   	ret    
 9cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9d0:	39 c2                	cmp    %eax,%edx
 9d2:	72 c4                	jb     998 <free+0x18>
 9d4:	39 c1                	cmp    %eax,%ecx
 9d6:	73 c0                	jae    998 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 9d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9de:	39 f8                	cmp    %edi,%eax
 9e0:	75 d0                	jne    9b2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 9e2:	03 70 04             	add    0x4(%eax),%esi
 9e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9e8:	8b 02                	mov    (%edx),%eax
 9ea:	8b 00                	mov    (%eax),%eax
 9ec:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 9ef:	8b 42 04             	mov    0x4(%edx),%eax
 9f2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9f5:	39 f1                	cmp    %esi,%ecx
 9f7:	75 c6                	jne    9bf <free+0x3f>
    p->s.size += bp->s.size;
 9f9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 9fc:	89 15 80 0f 00 00    	mov    %edx,0xf80
    p->s.size += bp->s.size;
 a02:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 a05:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 a08:	89 0a                	mov    %ecx,(%edx)
}
 a0a:	5b                   	pop    %ebx
 a0b:	5e                   	pop    %esi
 a0c:	5f                   	pop    %edi
 a0d:	5d                   	pop    %ebp
 a0e:	c3                   	ret    
 a0f:	90                   	nop

00000a10 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a10:	55                   	push   %ebp
 a11:	89 e5                	mov    %esp,%ebp
 a13:	57                   	push   %edi
 a14:	56                   	push   %esi
 a15:	53                   	push   %ebx
 a16:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a19:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a1c:	8b 3d 80 0f 00 00    	mov    0xf80,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a22:	8d 70 07             	lea    0x7(%eax),%esi
 a25:	c1 ee 03             	shr    $0x3,%esi
 a28:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a2b:	85 ff                	test   %edi,%edi
 a2d:	0f 84 9d 00 00 00    	je     ad0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a33:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 a35:	8b 4a 04             	mov    0x4(%edx),%ecx
 a38:	39 f1                	cmp    %esi,%ecx
 a3a:	73 6a                	jae    aa6 <malloc+0x96>
 a3c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a41:	39 de                	cmp    %ebx,%esi
 a43:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a46:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a4d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a50:	eb 17                	jmp    a69 <malloc+0x59>
 a52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a58:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a5a:	8b 48 04             	mov    0x4(%eax),%ecx
 a5d:	39 f1                	cmp    %esi,%ecx
 a5f:	73 4f                	jae    ab0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a61:	8b 3d 80 0f 00 00    	mov    0xf80,%edi
 a67:	89 c2                	mov    %eax,%edx
 a69:	39 d7                	cmp    %edx,%edi
 a6b:	75 eb                	jne    a58 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 a6d:	83 ec 0c             	sub    $0xc,%esp
 a70:	ff 75 e4             	push   -0x1c(%ebp)
 a73:	e8 8b fc ff ff       	call   703 <sbrk>
  if(p == (char*)-1)
 a78:	83 c4 10             	add    $0x10,%esp
 a7b:	83 f8 ff             	cmp    $0xffffffff,%eax
 a7e:	74 1c                	je     a9c <malloc+0x8c>
  hp->s.size = nu;
 a80:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a83:	83 ec 0c             	sub    $0xc,%esp
 a86:	83 c0 08             	add    $0x8,%eax
 a89:	50                   	push   %eax
 a8a:	e8 f1 fe ff ff       	call   980 <free>
  return freep;
 a8f:	8b 15 80 0f 00 00    	mov    0xf80,%edx
      if((p = morecore(nunits)) == 0)
 a95:	83 c4 10             	add    $0x10,%esp
 a98:	85 d2                	test   %edx,%edx
 a9a:	75 bc                	jne    a58 <malloc+0x48>
        return 0;
  }
}
 a9c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a9f:	31 c0                	xor    %eax,%eax
}
 aa1:	5b                   	pop    %ebx
 aa2:	5e                   	pop    %esi
 aa3:	5f                   	pop    %edi
 aa4:	5d                   	pop    %ebp
 aa5:	c3                   	ret    
    if(p->s.size >= nunits){
 aa6:	89 d0                	mov    %edx,%eax
 aa8:	89 fa                	mov    %edi,%edx
 aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 ab0:	39 ce                	cmp    %ecx,%esi
 ab2:	74 4c                	je     b00 <malloc+0xf0>
        p->s.size -= nunits;
 ab4:	29 f1                	sub    %esi,%ecx
 ab6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 ab9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 abc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 abf:	89 15 80 0f 00 00    	mov    %edx,0xf80
}
 ac5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 ac8:	83 c0 08             	add    $0x8,%eax
}
 acb:	5b                   	pop    %ebx
 acc:	5e                   	pop    %esi
 acd:	5f                   	pop    %edi
 ace:	5d                   	pop    %ebp
 acf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 ad0:	c7 05 80 0f 00 00 84 	movl   $0xf84,0xf80
 ad7:	0f 00 00 
    base.s.size = 0;
 ada:	bf 84 0f 00 00       	mov    $0xf84,%edi
    base.s.ptr = freep = prevp = &base;
 adf:	c7 05 84 0f 00 00 84 	movl   $0xf84,0xf84
 ae6:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ae9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 aeb:	c7 05 88 0f 00 00 00 	movl   $0x0,0xf88
 af2:	00 00 00 
    if(p->s.size >= nunits){
 af5:	e9 42 ff ff ff       	jmp    a3c <malloc+0x2c>
 afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 b00:	8b 08                	mov    (%eax),%ecx
 b02:	89 0a                	mov    %ecx,(%edx)
 b04:	eb b9                	jmp    abf <malloc+0xaf>
