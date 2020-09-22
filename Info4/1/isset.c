#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[], char* envp[]) 
{
	char *name=argv[1];
	int verbose=0;
	char *value;

	if(argc==3){
		if(strcmp("-v",argv[1])==0)
			verbose=1;
		name=argv[2];
	}

	value=getenv(name);

	if(verbose){
		if(value!=NULL)
			printf("%s=%s\n",name,value);
		else
			printf("%s is not set\n",name);
	}
					

	return (getenv(name)==NULL)?1:0;
  
}
