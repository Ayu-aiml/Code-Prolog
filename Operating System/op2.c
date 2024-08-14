#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <windows.h>

int thread_finished = 0;

void *thread_function(void *ag)
{
    printf("Thread function is running ,Argument was %s\n", (char *)ag);
    Sleep(4);
    printf("Second thread setting finished flag and exiting now\n");
    thread_finished = 1;
    pthread_exit(NULL);
}

char message[] = "HELLO WORLD";
int main()
{
    int res;
    pthread_t athread;
    pthread_attr_t thread_attr;
    res = pthread_attr_init(&thread_attr);
    if (res != 0)
    {
        printf("\n Attribute creation is failed.");
        exit(EXIT_FAILURE);
    }
    res = pthread_attr_setdetachstate(&thread_attr, PTHREAD_CREATE_DETACHED);
    if (res != 0)
    {
        printf("\n Setting detached attribute is failed.");
        exit(EXIT_FAILURE);
    }
    res = pthread_create(&athread, &thread_attr, thread_function, (void *)message);
    if (res != 0)
    {
        printf("\n Thread creation is failed.");
        exit(EXIT_FAILURE);
    }
    (void)pthread_attr_destroy(&thread_attr);
    while (!thread_finished)
    {
        printf("waiting for thread to say it's finished\n");
        Sleep(1);
    }
    printf("Other thread finished, bye !\n");
}
