
_test_7:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   exit(); \
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 14             	sub    $0x14,%esp
   ppid = getpid();
  11:	e8 e5 03 00 00       	call   3fb <getpid>
  16:	a3 f8 0b 00 00       	mov    %eax,0xbf8

   int fork_pid = fork();
  1b:	e8 53 03 00 00       	call   373 <fork>
   if(fork_pid == 0) {
  20:	85 c0                	test   %eax,%eax
  22:	74 79                	je     9d <main+0x9d>
     exit();
   }
   assert(fork_pid > 0);
  24:	7e 5a                	jle    80 <main+0x80>

   void *join_stack;
   int join_pid = join(&join_stack);
  26:	83 ec 0c             	sub    $0xc,%esp
  29:	8d 45 f4             	lea    -0xc(%ebp),%eax
  2c:	50                   	push   %eax
  2d:	e8 f1 03 00 00       	call   423 <join>
   assert(join_pid == -1);
  32:	83 c4 10             	add    $0x10,%esp
  35:	83 c0 01             	add    $0x1,%eax
  38:	74 68                	je     a2 <main+0xa2>
  3a:	6a 22                	push   $0x22
  3c:	68 08 08 00 00       	push   $0x808
  41:	68 11 08 00 00       	push   $0x811
  46:	6a 01                	push   $0x1
  48:	e8 93 04 00 00       	call   4e0 <printf>
  4d:	83 c4 0c             	add    $0xc,%esp
  50:	68 47 08 00 00       	push   $0x847
  55:	68 26 08 00 00       	push   $0x826
  5a:	6a 01                	push   $0x1
  5c:	e8 7f 04 00 00       	call   4e0 <printf>
  61:	5a                   	pop    %edx
  62:	59                   	pop    %ecx
  63:	68 3a 08 00 00       	push   $0x83a
  68:	6a 01                	push   $0x1
  6a:	e8 71 04 00 00       	call   4e0 <printf>
  6f:	58                   	pop    %eax
  70:	ff 35 f8 0b 00 00    	push   0xbf8
  76:	e8 30 03 00 00       	call   3ab <kill>
  7b:	e8 fb 02 00 00       	call   37b <exit>
   assert(fork_pid > 0);
  80:	6a 1e                	push   $0x1e
  82:	68 08 08 00 00       	push   $0x808
  87:	68 11 08 00 00       	push   $0x811
  8c:	6a 01                	push   $0x1
  8e:	e8 4d 04 00 00       	call   4e0 <printf>
  93:	83 c4 0c             	add    $0xc,%esp
  96:	68 19 08 00 00       	push   $0x819
  9b:	eb b8                	jmp    55 <main+0x55>
     exit();
  9d:	e8 d9 02 00 00       	call   37b <exit>

   assert(wait() > 0);
  a2:	e8 dc 02 00 00       	call   383 <wait>
  a7:	85 c0                	test   %eax,%eax
  a9:	7e 13                	jle    be <main+0xbe>
   printf(1, "TEST PASSED\n");
  ab:	50                   	push   %eax
  ac:	50                   	push   %eax
  ad:	68 61 08 00 00       	push   $0x861
  b2:	6a 01                	push   $0x1
  b4:	e8 27 04 00 00       	call   4e0 <printf>
   exit();
  b9:	e8 bd 02 00 00       	call   37b <exit>
   assert(wait() > 0);
  be:	6a 24                	push   $0x24
  c0:	68 08 08 00 00       	push   $0x808
  c5:	68 11 08 00 00       	push   $0x811
  ca:	6a 01                	push   $0x1
  cc:	e8 0f 04 00 00       	call   4e0 <printf>
  d1:	83 c4 0c             	add    $0xc,%esp
  d4:	68 56 08 00 00       	push   $0x856
  d9:	e9 77 ff ff ff       	jmp    55 <main+0x55>
  de:	66 90                	xchg   %ax,%ax

000000e0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  e0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  e1:	31 c0                	xor    %eax,%eax
{
  e3:	89 e5                	mov    %esp,%ebp
  e5:	53                   	push   %ebx
  e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  f0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  f4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  f7:	83 c0 01             	add    $0x1,%eax
  fa:	84 d2                	test   %dl,%dl
  fc:	75 f2                	jne    f0 <strcpy+0x10>
    ;
  return os;
}
  fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 101:	89 c8                	mov    %ecx,%eax
 103:	c9                   	leave  
 104:	c3                   	ret    
 105:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000110 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	53                   	push   %ebx
 114:	8b 55 08             	mov    0x8(%ebp),%edx
 117:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 11a:	0f b6 02             	movzbl (%edx),%eax
 11d:	84 c0                	test   %al,%al
 11f:	75 17                	jne    138 <strcmp+0x28>
 121:	eb 3a                	jmp    15d <strcmp+0x4d>
 123:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 127:	90                   	nop
 128:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 12c:	83 c2 01             	add    $0x1,%edx
 12f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 132:	84 c0                	test   %al,%al
 134:	74 1a                	je     150 <strcmp+0x40>
    p++, q++;
 136:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 138:	0f b6 19             	movzbl (%ecx),%ebx
 13b:	38 c3                	cmp    %al,%bl
 13d:	74 e9                	je     128 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 13f:	29 d8                	sub    %ebx,%eax
}
 141:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 144:	c9                   	leave  
 145:	c3                   	ret    
 146:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 150:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 154:	31 c0                	xor    %eax,%eax
 156:	29 d8                	sub    %ebx,%eax
}
 158:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 15b:	c9                   	leave  
 15c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 15d:	0f b6 19             	movzbl (%ecx),%ebx
 160:	31 c0                	xor    %eax,%eax
 162:	eb db                	jmp    13f <strcmp+0x2f>
 164:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 16f:	90                   	nop

00000170 <strlen>:

uint
strlen(const char *s)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 176:	80 3a 00             	cmpb   $0x0,(%edx)
 179:	74 15                	je     190 <strlen+0x20>
 17b:	31 c0                	xor    %eax,%eax
 17d:	8d 76 00             	lea    0x0(%esi),%esi
 180:	83 c0 01             	add    $0x1,%eax
 183:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 187:	89 c1                	mov    %eax,%ecx
 189:	75 f5                	jne    180 <strlen+0x10>
    ;
  return n;
}
 18b:	89 c8                	mov    %ecx,%eax
 18d:	5d                   	pop    %ebp
 18e:	c3                   	ret    
 18f:	90                   	nop
  for(n = 0; s[n]; n++)
 190:	31 c9                	xor    %ecx,%ecx
}
 192:	5d                   	pop    %ebp
 193:	89 c8                	mov    %ecx,%eax
 195:	c3                   	ret    
 196:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19d:	8d 76 00             	lea    0x0(%esi),%esi

000001a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ad:	89 d7                	mov    %edx,%edi
 1af:	fc                   	cld    
 1b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1b2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1b5:	89 d0                	mov    %edx,%eax
 1b7:	c9                   	leave  
 1b8:	c3                   	ret    
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001c0 <strchr>:

char*
strchr(const char *s, char c)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 45 08             	mov    0x8(%ebp),%eax
 1c6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ca:	0f b6 10             	movzbl (%eax),%edx
 1cd:	84 d2                	test   %dl,%dl
 1cf:	75 12                	jne    1e3 <strchr+0x23>
 1d1:	eb 1d                	jmp    1f0 <strchr+0x30>
 1d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1d7:	90                   	nop
 1d8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1dc:	83 c0 01             	add    $0x1,%eax
 1df:	84 d2                	test   %dl,%dl
 1e1:	74 0d                	je     1f0 <strchr+0x30>
    if(*s == c)
 1e3:	38 d1                	cmp    %dl,%cl
 1e5:	75 f1                	jne    1d8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1e7:	5d                   	pop    %ebp
 1e8:	c3                   	ret    
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1f0:	31 c0                	xor    %eax,%eax
}
 1f2:	5d                   	pop    %ebp
 1f3:	c3                   	ret    
 1f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1ff:	90                   	nop

00000200 <gets>:

char*
gets(char *buf, int max)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 205:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 208:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 209:	31 db                	xor    %ebx,%ebx
{
 20b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 20e:	eb 27                	jmp    237 <gets+0x37>
    cc = read(0, &c, 1);
 210:	83 ec 04             	sub    $0x4,%esp
 213:	6a 01                	push   $0x1
 215:	57                   	push   %edi
 216:	6a 00                	push   $0x0
 218:	e8 76 01 00 00       	call   393 <read>
    if(cc < 1)
 21d:	83 c4 10             	add    $0x10,%esp
 220:	85 c0                	test   %eax,%eax
 222:	7e 1d                	jle    241 <gets+0x41>
      break;
    buf[i++] = c;
 224:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 228:	8b 55 08             	mov    0x8(%ebp),%edx
 22b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 22f:	3c 0a                	cmp    $0xa,%al
 231:	74 1d                	je     250 <gets+0x50>
 233:	3c 0d                	cmp    $0xd,%al
 235:	74 19                	je     250 <gets+0x50>
  for(i=0; i+1 < max; ){
 237:	89 de                	mov    %ebx,%esi
 239:	83 c3 01             	add    $0x1,%ebx
 23c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 23f:	7c cf                	jl     210 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 241:	8b 45 08             	mov    0x8(%ebp),%eax
 244:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 248:	8d 65 f4             	lea    -0xc(%ebp),%esp
 24b:	5b                   	pop    %ebx
 24c:	5e                   	pop    %esi
 24d:	5f                   	pop    %edi
 24e:	5d                   	pop    %ebp
 24f:	c3                   	ret    
  buf[i] = '\0';
 250:	8b 45 08             	mov    0x8(%ebp),%eax
 253:	89 de                	mov    %ebx,%esi
 255:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 259:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25c:	5b                   	pop    %ebx
 25d:	5e                   	pop    %esi
 25e:	5f                   	pop    %edi
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret    
 261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 268:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop

00000270 <stat>:

int
stat(const char *n, struct stat *st)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
 274:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 275:	83 ec 08             	sub    $0x8,%esp
 278:	6a 00                	push   $0x0
 27a:	ff 75 08             	push   0x8(%ebp)
 27d:	e8 39 01 00 00       	call   3bb <open>
  if(fd < 0)
 282:	83 c4 10             	add    $0x10,%esp
 285:	85 c0                	test   %eax,%eax
 287:	78 27                	js     2b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 289:	83 ec 08             	sub    $0x8,%esp
 28c:	ff 75 0c             	push   0xc(%ebp)
 28f:	89 c3                	mov    %eax,%ebx
 291:	50                   	push   %eax
 292:	e8 3c 01 00 00       	call   3d3 <fstat>
  close(fd);
 297:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 29a:	89 c6                	mov    %eax,%esi
  close(fd);
 29c:	e8 02 01 00 00       	call   3a3 <close>
  return r;
 2a1:	83 c4 10             	add    $0x10,%esp
}
 2a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a7:	89 f0                	mov    %esi,%eax
 2a9:	5b                   	pop    %ebx
 2aa:	5e                   	pop    %esi
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2b5:	eb ed                	jmp    2a4 <stat+0x34>
 2b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2be:	66 90                	xchg   %ax,%ax

000002c0 <atoi>:

int
atoi(const char *s)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2c7:	0f be 02             	movsbl (%edx),%eax
 2ca:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2cd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2d0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2d5:	77 1e                	ja     2f5 <atoi+0x35>
 2d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2de:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2e0:	83 c2 01             	add    $0x1,%edx
 2e3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2e6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ea:	0f be 02             	movsbl (%edx),%eax
 2ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2f0:	80 fb 09             	cmp    $0x9,%bl
 2f3:	76 eb                	jbe    2e0 <atoi+0x20>
  return n;
}
 2f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2f8:	89 c8                	mov    %ecx,%eax
 2fa:	c9                   	leave  
 2fb:	c3                   	ret    
 2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000300 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	8b 45 10             	mov    0x10(%ebp),%eax
 307:	8b 55 08             	mov    0x8(%ebp),%edx
 30a:	56                   	push   %esi
 30b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 30e:	85 c0                	test   %eax,%eax
 310:	7e 13                	jle    325 <memmove+0x25>
 312:	01 d0                	add    %edx,%eax
  dst = vdst;
 314:	89 d7                	mov    %edx,%edi
 316:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 320:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 321:	39 f8                	cmp    %edi,%eax
 323:	75 fb                	jne    320 <memmove+0x20>
  return vdst;
}
 325:	5e                   	pop    %esi
 326:	89 d0                	mov    %edx,%eax
 328:	5f                   	pop    %edi
 329:	5d                   	pop    %ebp
 32a:	c3                   	ret    
 32b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 32f:	90                   	nop

00000330 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
	return 0;
}
 330:	31 c0                	xor    %eax,%eax
 332:	c3                   	ret    
 333:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000340 <lock_acquire>:

void lock_acquire(lock_t * lock){
	
}
 340:	c3                   	ret    
 341:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 348:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <lock_release>:
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	8b 45 08             	mov    0x8(%ebp),%eax
 356:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 35c:	5d                   	pop    %ebp
 35d:	c3                   	ret    
 35e:	66 90                	xchg   %ax,%ax

00000360 <lock_init>:

void lock_release(lock_t * lock){
	lock->state = 0;
}

void lock_init(lock_t * lock){
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
	//lock = malloc(sizeof(lock_t));
	lock->state = 0;
 363:	8b 45 08             	mov    0x8(%ebp),%eax
 366:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 36c:	5d                   	pop    %ebp
 36d:	c3                   	ret    
 36e:	66 90                	xchg   %ax,%ax

00000370 <thread_join>:

int thread_join(){

return 0;
}
 370:	31 c0                	xor    %eax,%eax
 372:	c3                   	ret    

00000373 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 373:	b8 01 00 00 00       	mov    $0x1,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <exit>:
SYSCALL(exit)
 37b:	b8 02 00 00 00       	mov    $0x2,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <wait>:
SYSCALL(wait)
 383:	b8 03 00 00 00       	mov    $0x3,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <pipe>:
SYSCALL(pipe)
 38b:	b8 04 00 00 00       	mov    $0x4,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <read>:
SYSCALL(read)
 393:	b8 05 00 00 00       	mov    $0x5,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <write>:
SYSCALL(write)
 39b:	b8 10 00 00 00       	mov    $0x10,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <close>:
SYSCALL(close)
 3a3:	b8 15 00 00 00       	mov    $0x15,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <kill>:
SYSCALL(kill)
 3ab:	b8 06 00 00 00       	mov    $0x6,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <exec>:
SYSCALL(exec)
 3b3:	b8 07 00 00 00       	mov    $0x7,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <open>:
SYSCALL(open)
 3bb:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <mknod>:
SYSCALL(mknod)
 3c3:	b8 11 00 00 00       	mov    $0x11,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <unlink>:
SYSCALL(unlink)
 3cb:	b8 12 00 00 00       	mov    $0x12,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <fstat>:
SYSCALL(fstat)
 3d3:	b8 08 00 00 00       	mov    $0x8,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <link>:
SYSCALL(link)
 3db:	b8 13 00 00 00       	mov    $0x13,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <mkdir>:
SYSCALL(mkdir)
 3e3:	b8 14 00 00 00       	mov    $0x14,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <chdir>:
SYSCALL(chdir)
 3eb:	b8 09 00 00 00       	mov    $0x9,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <dup>:
SYSCALL(dup)
 3f3:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <getpid>:
SYSCALL(getpid)
 3fb:	b8 0b 00 00 00       	mov    $0xb,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <sbrk>:
SYSCALL(sbrk)
 403:	b8 0c 00 00 00       	mov    $0xc,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <sleep>:
SYSCALL(sleep)
 40b:	b8 0d 00 00 00       	mov    $0xd,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <uptime>:
SYSCALL(uptime)
 413:	b8 0e 00 00 00       	mov    $0xe,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <clone>:
SYSCALL(clone)
 41b:	b8 16 00 00 00       	mov    $0x16,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <join>:
SYSCALL(join)
 423:	b8 17 00 00 00       	mov    $0x17,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    
 42b:	66 90                	xchg   %ax,%ax
 42d:	66 90                	xchg   %ax,%ax
 42f:	90                   	nop

00000430 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
 436:	83 ec 3c             	sub    $0x3c,%esp
 439:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 43c:	89 d1                	mov    %edx,%ecx
{
 43e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 441:	85 d2                	test   %edx,%edx
 443:	0f 89 7f 00 00 00    	jns    4c8 <printint+0x98>
 449:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 44d:	74 79                	je     4c8 <printint+0x98>
    neg = 1;
 44f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 456:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 458:	31 db                	xor    %ebx,%ebx
 45a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 45d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 460:	89 c8                	mov    %ecx,%eax
 462:	31 d2                	xor    %edx,%edx
 464:	89 cf                	mov    %ecx,%edi
 466:	f7 75 c4             	divl   -0x3c(%ebp)
 469:	0f b6 92 d0 08 00 00 	movzbl 0x8d0(%edx),%edx
 470:	89 45 c0             	mov    %eax,-0x40(%ebp)
 473:	89 d8                	mov    %ebx,%eax
 475:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 478:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 47b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 47e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 481:	76 dd                	jbe    460 <printint+0x30>
  if(neg)
 483:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 486:	85 c9                	test   %ecx,%ecx
 488:	74 0c                	je     496 <printint+0x66>
    buf[i++] = '-';
 48a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 48f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 491:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 496:	8b 7d b8             	mov    -0x48(%ebp),%edi
 499:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 49d:	eb 07                	jmp    4a6 <printint+0x76>
 49f:	90                   	nop
    putc(fd, buf[i]);
 4a0:	0f b6 13             	movzbl (%ebx),%edx
 4a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4a6:	83 ec 04             	sub    $0x4,%esp
 4a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4ac:	6a 01                	push   $0x1
 4ae:	56                   	push   %esi
 4af:	57                   	push   %edi
 4b0:	e8 e6 fe ff ff       	call   39b <write>
  while(--i >= 0)
 4b5:	83 c4 10             	add    $0x10,%esp
 4b8:	39 de                	cmp    %ebx,%esi
 4ba:	75 e4                	jne    4a0 <printint+0x70>
}
 4bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4bf:	5b                   	pop    %ebx
 4c0:	5e                   	pop    %esi
 4c1:	5f                   	pop    %edi
 4c2:	5d                   	pop    %ebp
 4c3:	c3                   	ret    
 4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 4cf:	eb 87                	jmp    458 <printint+0x28>
 4d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4df:	90                   	nop

000004e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 4ec:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 4ef:	0f b6 13             	movzbl (%ebx),%edx
 4f2:	84 d2                	test   %dl,%dl
 4f4:	74 6a                	je     560 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 4f6:	8d 45 10             	lea    0x10(%ebp),%eax
 4f9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 4fc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 4ff:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 501:	89 45 d0             	mov    %eax,-0x30(%ebp)
 504:	eb 36                	jmp    53c <printf+0x5c>
 506:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50d:	8d 76 00             	lea    0x0(%esi),%esi
 510:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 513:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 518:	83 f8 25             	cmp    $0x25,%eax
 51b:	74 15                	je     532 <printf+0x52>
  write(fd, &c, 1);
 51d:	83 ec 04             	sub    $0x4,%esp
 520:	88 55 e7             	mov    %dl,-0x19(%ebp)
 523:	6a 01                	push   $0x1
 525:	57                   	push   %edi
 526:	56                   	push   %esi
 527:	e8 6f fe ff ff       	call   39b <write>
 52c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 52f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 532:	0f b6 13             	movzbl (%ebx),%edx
 535:	83 c3 01             	add    $0x1,%ebx
 538:	84 d2                	test   %dl,%dl
 53a:	74 24                	je     560 <printf+0x80>
    c = fmt[i] & 0xff;
 53c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 53f:	85 c9                	test   %ecx,%ecx
 541:	74 cd                	je     510 <printf+0x30>
      }
    } else if(state == '%'){
 543:	83 f9 25             	cmp    $0x25,%ecx
 546:	75 ea                	jne    532 <printf+0x52>
      if(c == 'd'){
 548:	83 f8 25             	cmp    $0x25,%eax
 54b:	0f 84 07 01 00 00    	je     658 <printf+0x178>
 551:	83 e8 63             	sub    $0x63,%eax
 554:	83 f8 15             	cmp    $0x15,%eax
 557:	77 17                	ja     570 <printf+0x90>
 559:	ff 24 85 78 08 00 00 	jmp    *0x878(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 560:	8d 65 f4             	lea    -0xc(%ebp),%esp
 563:	5b                   	pop    %ebx
 564:	5e                   	pop    %esi
 565:	5f                   	pop    %edi
 566:	5d                   	pop    %ebp
 567:	c3                   	ret    
 568:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56f:	90                   	nop
  write(fd, &c, 1);
 570:	83 ec 04             	sub    $0x4,%esp
 573:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 576:	6a 01                	push   $0x1
 578:	57                   	push   %edi
 579:	56                   	push   %esi
 57a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 57e:	e8 18 fe ff ff       	call   39b <write>
        putc(fd, c);
 583:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 587:	83 c4 0c             	add    $0xc,%esp
 58a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 58d:	6a 01                	push   $0x1
 58f:	57                   	push   %edi
 590:	56                   	push   %esi
 591:	e8 05 fe ff ff       	call   39b <write>
        putc(fd, c);
 596:	83 c4 10             	add    $0x10,%esp
      state = 0;
 599:	31 c9                	xor    %ecx,%ecx
 59b:	eb 95                	jmp    532 <printf+0x52>
 59d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5a0:	83 ec 0c             	sub    $0xc,%esp
 5a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5a8:	6a 00                	push   $0x0
 5aa:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5ad:	8b 10                	mov    (%eax),%edx
 5af:	89 f0                	mov    %esi,%eax
 5b1:	e8 7a fe ff ff       	call   430 <printint>
        ap++;
 5b6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 5ba:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5bd:	31 c9                	xor    %ecx,%ecx
 5bf:	e9 6e ff ff ff       	jmp    532 <printf+0x52>
 5c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5cb:	8b 10                	mov    (%eax),%edx
        ap++;
 5cd:	83 c0 04             	add    $0x4,%eax
 5d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 5d3:	85 d2                	test   %edx,%edx
 5d5:	0f 84 8d 00 00 00    	je     668 <printf+0x188>
        while(*s != 0){
 5db:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 5de:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 5e0:	84 c0                	test   %al,%al
 5e2:	0f 84 4a ff ff ff    	je     532 <printf+0x52>
 5e8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5eb:	89 d3                	mov    %edx,%ebx
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5f0:	83 ec 04             	sub    $0x4,%esp
          s++;
 5f3:	83 c3 01             	add    $0x1,%ebx
 5f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5f9:	6a 01                	push   $0x1
 5fb:	57                   	push   %edi
 5fc:	56                   	push   %esi
 5fd:	e8 99 fd ff ff       	call   39b <write>
        while(*s != 0){
 602:	0f b6 03             	movzbl (%ebx),%eax
 605:	83 c4 10             	add    $0x10,%esp
 608:	84 c0                	test   %al,%al
 60a:	75 e4                	jne    5f0 <printf+0x110>
      state = 0;
 60c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 60f:	31 c9                	xor    %ecx,%ecx
 611:	e9 1c ff ff ff       	jmp    532 <printf+0x52>
 616:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 620:	83 ec 0c             	sub    $0xc,%esp
 623:	b9 0a 00 00 00       	mov    $0xa,%ecx
 628:	6a 01                	push   $0x1
 62a:	e9 7b ff ff ff       	jmp    5aa <printf+0xca>
 62f:	90                   	nop
        putc(fd, *ap);
 630:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 633:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 636:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 638:	6a 01                	push   $0x1
 63a:	57                   	push   %edi
 63b:	56                   	push   %esi
        putc(fd, *ap);
 63c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 63f:	e8 57 fd ff ff       	call   39b <write>
        ap++;
 644:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 648:	83 c4 10             	add    $0x10,%esp
      state = 0;
 64b:	31 c9                	xor    %ecx,%ecx
 64d:	e9 e0 fe ff ff       	jmp    532 <printf+0x52>
 652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 658:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 65b:	83 ec 04             	sub    $0x4,%esp
 65e:	e9 2a ff ff ff       	jmp    58d <printf+0xad>
 663:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 667:	90                   	nop
          s = "(null)";
 668:	ba 6e 08 00 00       	mov    $0x86e,%edx
        while(*s != 0){
 66d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 670:	b8 28 00 00 00       	mov    $0x28,%eax
 675:	89 d3                	mov    %edx,%ebx
 677:	e9 74 ff ff ff       	jmp    5f0 <printf+0x110>
 67c:	66 90                	xchg   %ax,%ax
 67e:	66 90                	xchg   %ax,%ax

00000680 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 680:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 681:	a1 fc 0b 00 00       	mov    0xbfc,%eax
{
 686:	89 e5                	mov    %esp,%ebp
 688:	57                   	push   %edi
 689:	56                   	push   %esi
 68a:	53                   	push   %ebx
 68b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 68e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 698:	89 c2                	mov    %eax,%edx
 69a:	8b 00                	mov    (%eax),%eax
 69c:	39 ca                	cmp    %ecx,%edx
 69e:	73 30                	jae    6d0 <free+0x50>
 6a0:	39 c1                	cmp    %eax,%ecx
 6a2:	72 04                	jb     6a8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a4:	39 c2                	cmp    %eax,%edx
 6a6:	72 f0                	jb     698 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ae:	39 f8                	cmp    %edi,%eax
 6b0:	74 30                	je     6e2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 6b2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6b5:	8b 42 04             	mov    0x4(%edx),%eax
 6b8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6bb:	39 f1                	cmp    %esi,%ecx
 6bd:	74 3a                	je     6f9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 6bf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6c1:	5b                   	pop    %ebx
  freep = p;
 6c2:	89 15 fc 0b 00 00    	mov    %edx,0xbfc
}
 6c8:	5e                   	pop    %esi
 6c9:	5f                   	pop    %edi
 6ca:	5d                   	pop    %ebp
 6cb:	c3                   	ret    
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d0:	39 c2                	cmp    %eax,%edx
 6d2:	72 c4                	jb     698 <free+0x18>
 6d4:	39 c1                	cmp    %eax,%ecx
 6d6:	73 c0                	jae    698 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 6d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6de:	39 f8                	cmp    %edi,%eax
 6e0:	75 d0                	jne    6b2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 6e2:	03 70 04             	add    0x4(%eax),%esi
 6e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6e8:	8b 02                	mov    (%edx),%eax
 6ea:	8b 00                	mov    (%eax),%eax
 6ec:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 6ef:	8b 42 04             	mov    0x4(%edx),%eax
 6f2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6f5:	39 f1                	cmp    %esi,%ecx
 6f7:	75 c6                	jne    6bf <free+0x3f>
    p->s.size += bp->s.size;
 6f9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 6fc:	89 15 fc 0b 00 00    	mov    %edx,0xbfc
    p->s.size += bp->s.size;
 702:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 705:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 708:	89 0a                	mov    %ecx,(%edx)
}
 70a:	5b                   	pop    %ebx
 70b:	5e                   	pop    %esi
 70c:	5f                   	pop    %edi
 70d:	5d                   	pop    %ebp
 70e:	c3                   	ret    
 70f:	90                   	nop

00000710 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	57                   	push   %edi
 714:	56                   	push   %esi
 715:	53                   	push   %ebx
 716:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 719:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 71c:	8b 3d fc 0b 00 00    	mov    0xbfc,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 722:	8d 70 07             	lea    0x7(%eax),%esi
 725:	c1 ee 03             	shr    $0x3,%esi
 728:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 72b:	85 ff                	test   %edi,%edi
 72d:	0f 84 9d 00 00 00    	je     7d0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 733:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 735:	8b 4a 04             	mov    0x4(%edx),%ecx
 738:	39 f1                	cmp    %esi,%ecx
 73a:	73 6a                	jae    7a6 <malloc+0x96>
 73c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 741:	39 de                	cmp    %ebx,%esi
 743:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 746:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 74d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 750:	eb 17                	jmp    769 <malloc+0x59>
 752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 758:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 75a:	8b 48 04             	mov    0x4(%eax),%ecx
 75d:	39 f1                	cmp    %esi,%ecx
 75f:	73 4f                	jae    7b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 761:	8b 3d fc 0b 00 00    	mov    0xbfc,%edi
 767:	89 c2                	mov    %eax,%edx
 769:	39 d7                	cmp    %edx,%edi
 76b:	75 eb                	jne    758 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 76d:	83 ec 0c             	sub    $0xc,%esp
 770:	ff 75 e4             	push   -0x1c(%ebp)
 773:	e8 8b fc ff ff       	call   403 <sbrk>
  if(p == (char*)-1)
 778:	83 c4 10             	add    $0x10,%esp
 77b:	83 f8 ff             	cmp    $0xffffffff,%eax
 77e:	74 1c                	je     79c <malloc+0x8c>
  hp->s.size = nu;
 780:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 783:	83 ec 0c             	sub    $0xc,%esp
 786:	83 c0 08             	add    $0x8,%eax
 789:	50                   	push   %eax
 78a:	e8 f1 fe ff ff       	call   680 <free>
  return freep;
 78f:	8b 15 fc 0b 00 00    	mov    0xbfc,%edx
      if((p = morecore(nunits)) == 0)
 795:	83 c4 10             	add    $0x10,%esp
 798:	85 d2                	test   %edx,%edx
 79a:	75 bc                	jne    758 <malloc+0x48>
        return 0;
  }
}
 79c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 79f:	31 c0                	xor    %eax,%eax
}
 7a1:	5b                   	pop    %ebx
 7a2:	5e                   	pop    %esi
 7a3:	5f                   	pop    %edi
 7a4:	5d                   	pop    %ebp
 7a5:	c3                   	ret    
    if(p->s.size >= nunits){
 7a6:	89 d0                	mov    %edx,%eax
 7a8:	89 fa                	mov    %edi,%edx
 7aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7b0:	39 ce                	cmp    %ecx,%esi
 7b2:	74 4c                	je     800 <malloc+0xf0>
        p->s.size -= nunits;
 7b4:	29 f1                	sub    %esi,%ecx
 7b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7bc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 7bf:	89 15 fc 0b 00 00    	mov    %edx,0xbfc
}
 7c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7c8:	83 c0 08             	add    $0x8,%eax
}
 7cb:	5b                   	pop    %ebx
 7cc:	5e                   	pop    %esi
 7cd:	5f                   	pop    %edi
 7ce:	5d                   	pop    %ebp
 7cf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 7d0:	c7 05 fc 0b 00 00 00 	movl   $0xc00,0xbfc
 7d7:	0c 00 00 
    base.s.size = 0;
 7da:	bf 00 0c 00 00       	mov    $0xc00,%edi
    base.s.ptr = freep = prevp = &base;
 7df:	c7 05 00 0c 00 00 00 	movl   $0xc00,0xc00
 7e6:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 7eb:	c7 05 04 0c 00 00 00 	movl   $0x0,0xc04
 7f2:	00 00 00 
    if(p->s.size >= nunits){
 7f5:	e9 42 ff ff ff       	jmp    73c <malloc+0x2c>
 7fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 800:	8b 08                	mov    (%eax),%ecx
 802:	89 0a                	mov    %ecx,(%edx)
 804:	eb b9                	jmp    7bf <malloc+0xaf>
