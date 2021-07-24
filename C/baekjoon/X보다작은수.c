#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n;
    int x;
    int *arr = malloc(sizeof(int)*n);

    scanf("%d %d", &n, &x);
    for (int i = 0; i < n; i++)
        scanf("%d", &arr[i]);
    for (int i = 0; i < n; i++)
    {
        if (arr[i] < x)
            printf("%d ", arr[i]);
        else
            continue;
    }
    free(arr);
    return 0;
}
