// DP
// 전역변수로 배열 선언 안하면 세그폴트 뜸
// 배열 선언 안하고 싶으면 그냥 P, T 배열 없이 dp 배열로만 갖고 풀기

#include <stdio.h>
#define MAX 1500000

int P[MAX + 1];
int T[MAX + 1];
int dp[MAX + 1] = {0, };

int main(void) {
    int N;
    int maxRet = 0;

    scanf("%d", &N);
    
    for (int i = 0; i < N; i++) {
        scanf("%d %d", &T[i], &P[i]);
    }

    for (int i = 0; i < N; i++) {
        if (i + T[i] <= N) {
            dp[i + T[i]] = (dp[i + T[i]] > dp[i] + P[i]) ? dp[i + T[i]] : dp[i] + P[i];
            maxRet = (maxRet > dp[i + T[i]]) ? maxRet : dp[i + T[i]];
        }
        dp[i + 1] = (dp[i + 1] > dp[i]) ? dp[i + 1] : dp[i];
        maxRet = (maxRet > dp[i + 1]) ? maxRet : dp[i + 1];
    }

    printf("%d\n", maxRet);
    return 0;
}

// dp 배열로만 풀기(이 땐 지역변수로 선언해도 문제 없음)

#include <stdio.h>
#define MAX 1500000

int main(void) {
    int N, T, P;
    int dp[MAX + 1] = {0, };
    int maxRet = 0;

    scanf("%d", &N);
    
    for (int i = 0; i < N; i++) {
        scanf("%d %d", &T, &P);

        if (i + T <= N) {
            dp[i + T] = (dp[i + T] > dp[i] + P) ? dp[i + T] : dp[i] + P;
            maxRet = (maxRet > dp[i + T]) ? maxRet : dp[i + T];
        }
        dp[i + 1] = (dp[i + 1] > dp[i]) ? dp[i + 1] : dp[i];
        maxRet = (maxRet > dp[i + 1]) ? maxRet : dp[i + 1];
    }

    printf("%d\n", maxRet);
    return 0;
}
