.data

msg:
addr = 13


.text

.globl _start
_start:
/* syscall write(int fd, const void *buf, size_t count) */
mov     %r0, $1		/* fancy operations here */
mov	pc, =addr	/* jump to the real code and continue onwards */ 
