#include <stdio.h>

int main(void)
{
	char cpuid_str[13];

	__asm__ (""
	/* TODO: Make cpuid call and copy string in cpuid_str.
	 * eax needs to be 0
	 * After cpuid call string is placed in (ebx, edx, ecx).
	 */
	"xor eax, eax\n\t"
	"cpuid\n\t"
	"mov edi, %0\n\t"
	"mov [edi], ebx\n\t"
	"mov [edi + 4], edx\n\t"
	"mov [edi + 8], ecx\n\t"
	"mov %0, edi\n\t"
	:
	: "r" (cpuid_str)
	: "edi", "ebx", "eax", "ecx", "edx"
	);

	cpuid_str[12] = '\0';

	printf("CPUID string: %s\n", cpuid_str);

	return 0;
}
