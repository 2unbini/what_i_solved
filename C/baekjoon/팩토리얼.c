#include <stdio.h>

int factorial(int n)
{
    if (n == 0)
	return (1);
    return (factorial(n - 1) * n);
}

int main(void)
{
    int N;

    scanf("%d", &N);
    printf("%d\n", factorial(N));
    return (0);
}
