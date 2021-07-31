// 7 Runtime Error(Out of Bounds) 1 Compile Error
// and the last passed one

#include <stdio.h>

int max_len(int n, int m)
{
    return (n > m ? m : n);
}

int main(void)
{
    int n, m;
    int len;
    int max = 0;
    int map[51][51];
    
    scanf("%d %d", &n, &m);
    for (int i = 0; i < n; i++)
        for (int j = 0; j < m; j++)
            scanf("%1d", &map[i][j]);
    len = max_len(n, m);
    for (int i = 0; i < n; i++)
        for (int j = 0; j < m; j++)
            for (int k = 0; k < len; k++)
                if (i + k < n && j + k < m &&
                    map[i][j] == map[i][j + k] &&
                    map[i][j] == map[i + k][j] &&
                    map[i][j] == map[i + k][j + k] &&
                    k > max)
                    max = k;
    max += 1;
    printf("%d\n", max * max);
    return (0);
}
