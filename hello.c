#include <stdio.h>
#include <unistd.h>

int main(void)
{
    printf("Hello Embedded Linux!\n");
    printf("Process ID: %ld\n", (long)getpid());
    return 0;
}
