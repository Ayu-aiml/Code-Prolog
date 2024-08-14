#include<stdio.h>
#include<stdlib.h>

int main(){
    printf("Running the ps with system\n");
    system("ps -ef");
    printf("Done\n");
    return 0;
}