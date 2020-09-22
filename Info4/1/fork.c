#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>

int main(int argc, char* argv[], char* envp[]) 
{
	
	pid_t pid=getpid();
	int sts;

	printf("[E] Pid von Elternprozess: %d\n",pid);

	pid=fork();
	if(pid!=0){//Im Elternprozess
		
		printf("[E] Elternprozess wartet jetzt auf Kind mit Pid: %d\n",pid);

		wait(&sts);	

		if(WIFEXITED(sts)){
			printf("[E] KIndprozess hat sich mit RC %d beendet\n",WEXITSTATUS(sts));
		}		

		printf("[E] Kindprozess hat sich beendet\n");

	}
	else{//Im Kindprozess

		pid_t child_pid = getpid();

		printf("[K] Pid des Kindes: %d\n",child_pid);

		execv(argv[1],&argv[1]);

		printf("Wird nie erreicht\n");
	}

		


	return 0;
}
