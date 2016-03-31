#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

char *SC =  "\x01\x60\x8f\xe2"
"\x16\xff\x2f\xe1"
"\x0e\x22"
"\x79\x46"
"\x0e\x31"
"\x01\x20"
"\x04\x27"
"\x01\xdf"
"\x24\x1b"
"\x20\x1c"
"\x01\x27"
"\x01\xdf"
"\x48\x65"
"\x6c\x6c"
"\x6f\x2c"
"\x20\x57"
"\x6f\x72"
"\x6c\x64"
"\x21\x0a";

	void
main()
{
	printf("---\nHello from the stub!\n---\n");

	/* Declare pointer on function */
	int (*func) ();
	/* Cast shellcode into function */
	func = (int (*) ()) SC;
	/* Call function (Execute shellcode) */
	(int) (*func) ();
}

