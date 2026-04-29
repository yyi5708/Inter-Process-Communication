#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>

int return_code = 0;

void sigint_handler(int _sig) {
	printf("SIGINT received!\n");
	return_code = 1;
}

void sigusr1_handler(int _sig) {
	printf("SIGUSR1 received!\n");
	return_code = 0;
}

int main(){
	printf("Listener PID: %i\n", getpid());
	signal(SIGINT, sigint_handler);
	signal(SIGUSR1, sigusr1_handler);
	pause();
	return return_code;
}
