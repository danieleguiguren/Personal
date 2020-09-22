#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc, char* argv[], char* envp[]) 
{
	execv(argv[1],&argv[1]);
	
	printf("Wird nie erreicht");
	return 0;
}
