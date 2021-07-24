#include <stdio.h>

int main(void)
{
    int t;
    int n, day;
    long long a, b, g;

    scanf("%d", &t);
    while (t--)
    {
        g = 1;
        day = 0;
        scanf("%d %lld %lld", &n, &a, &b);
        if (a % 2 == 1)
            printf("%d\n", n);
        else
        {
            for (int i = 0; i < n; i++)
                g *= 2;
            while (a)
            {
                if (a >= g)
                    a -= g;
                g /= 2;
                ++day;
            }
            printf("%d\n", day - 1);
        }
    }
    return (0);
}
