#include <stdio.h>
#define MAX 10001

int main(void) {
    int N, K, val;
    int dp[MAX] = {0, };

    dp[0] = 1;
    scanf("%d %d", &N, &K);
    
    for (int i = 0; i < N; i++) {
        scanf("%d", &val);
        
        for (int j = val; j <= K; j++) {
            if (dp[j - val] != 0) {
                dp[j] += dp[j - val];
            }
        }
    }

    printf("%d\n", dp[K]);
    return 0;
}
