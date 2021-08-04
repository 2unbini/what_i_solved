// solved with DP
// first : using recursive function
#include <stdio.h>

int dp[50];

int fibo(int n) {
    if (n < 2) {
        return n;
    } else {
        if (dp[n] != 0) {
            return dp[n];
        } else {
            return dp[n] = fibo(n - 1) + fibo(n - 2);
        }
    }
}

int main(void) {
    int n;
    
    scanf("%d", &n);
    printf("%d\n", fibo(n));
    return 0;
}

// second : using loop
#include <stdio.h>

int main(void) {
    int n;
    int dp[50] = {0, };
    
    scanf("%d", &n);
    dp[0] = 0;
    dp[1] = 1;
    
    for (int i = 2; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    printf("%d\n", dp[n]);
    return 0;
}
