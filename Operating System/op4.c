#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <windows.h>

int main()
{
    pid_t pid, pid2, pid3;
    pid = fork();
    if (pid < 0)
        printf("fork failed\n");
    else if (pid == 0)
    {
        printf("child process 1\n");
        printf("child process id :%d\n", getpid());
        printf("parent process id :%d\n", getppid());
        pid2 = fork();
        if (pid2 == 0)
        {
            printf("child process 2\n");
            printf("child process id :%d\n", getpid());
            printf("parent process id :%d\n", getppid());
            pid3 = fork();
            if (pid3 == 0)
            {
                printf("child process 3\n");
                printf("child process id :%d\n", getpid());
                printf("parent process id :%d\n", getppid());
            }
        }
    }
    else
    {
        printf("parent process\n");
        printf("parent process id :%d\n", getpid());
    }
    return 0;
}