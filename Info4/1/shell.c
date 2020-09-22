
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <string.h>

#include <readline/readline.h>
#include <readline/history.h>

void add_history (const char *line);

int main(int argc, char* argv[], char* envp[])
{

	pid_t pid=getpid();
	int sts;

	char *user_argv[256];//Gleichen TYp von argv[]

	printf("[E] Pid von Interpreterprozess: %d\n",pid);

	while(1){
		//Hole Benutzereingabe
		//user_arv irgendwie befuellen

		char *line, *tmp;

		line=readline("$");
		tmp=strdup(line);

		printf("[E] Benutzereingabe: %s\n",tmp);


		if(strcmp(line, "exit") == 0){

			break;
		}

		user_argv[0]=tmp;
		user_argv[1]=NULL;

		int i = 1;
		for(char*p = tmp; *p!=0&&i<256;p++){
			if(*p==' '){
				*p=0;
				user_argv[i]=p+1;
 				i++;
			}
		}

		user_argv[i]=NULL;

		pid=fork();
		if(pid!=0){//Im Interpreterprozess

			printf("[E] Interpreterprozess wartet jetzt auf Kind mit Pid: %d\n",pid);

			wait(&sts);

			if(WIFEXITED(sts)){
				int rc=WEXITSTATUS(sts);
				printf("[E] KIndprozess hat sich mit RC %d beendet\n",rc);

				if(rc==0){
					add_history(line);
				}
			}

			printf("[E] Kindprozess hat sich beendet\n");

		}
		else{//Im Kindprozess

			pid_t child_pid = getpid();

			printf("[K] Pid des Kindes: %d\n",child_pid);

			execv(user_argv[0],&user_argv[0]);//oder beim 2. Arg auch: user_argv

			printf("Wird nie erreicht\n");
		}
		free(tmp);

	}


	return 0;
}
