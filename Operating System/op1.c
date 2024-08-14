#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>
#include <windows.h>
#define MAX 5

int buffer[MAX];
sem_t mutex, full, empty;

void *producer(void *ag)
{
    int value, in = 0;
    while (1)
    {
        Sleep(1);
        printf("Enter the value of producer :");
        scanf("%d", value);
        sem_wait(&empty);
        sem_wait(&mutex);
        buffer[in] = value;
        if (in == MAX)
            in = 0;
        else
            in++;
        sem_post(&mutex);
        sem_post(&full);
    }
    return (void *)("Exit from producer");
}

void *consumer(void *ag)
{
    int value, out = 0;
    while (1)
    {
        Sleep(1);
        sem_wait(&full);
        sem_wait(&mutex);
        value = buffer[out];
        printf("The value of consumer is : %d\n", value);
        if (out == MAX)
            out = 0;
        else
            out++;
        sem_post(&mutex);
        sem_post(&empty);
    }
    return (void *)("Exit from consumer");
}

int main()
{
    int ch1, ch2;
    pthread_t t1, t2;
    void *arg;
    sem_init(&mutex, 0, 1);
    sem_init(&full, 0, 0);
    sem_init(&empty, 0, MAX);
    ch1 = pthread_create(&t1, NULL, producer, NULL);
    if (ch1 != 0)
    {
        printf("\n Thread creation is failed.");
        exit(-1);
    }
    ch2 = pthread_create(&t2, NULL, consumer, NULL);
    if (ch2 != 0)
    {
        printf("\n Thread creation is failed.");
        exit(-1);
    }
    ch1 = pthread_join(t1, &arg);
    if (ch1 != 0)
    {
        printf("\n Thread joining is failed.");
        exit(-1);
    }
    ch2 = pthread_join(t2, &arg);
    if (ch2 != 0)
    {
        printf("\n Thread joining is failed.");
        exit(-1);
    }
    sem_destroy(&mutex);
    sem_destroy(&full);
    sem_destroy(&empty);
    return 0;
}