// recursive function -> failed..
// dynamic programming

#include <stdio.h>

int main(void) {
    int T, tcase;
    int zeroCnt[41] = {0, };
    int oneCnt[41] = {0, };
    
    zeroCnt[0] = 1;
    oneCnt[1] = 1;
    for (int i = 2; i <= 40; i++) {
        zeroCnt[i] = zeroCnt[i - 1] + zeroCnt[i - 2];
        oneCnt[i] = oneCnt[i - 1] + oneCnt[i - 2];
    }
    scanf("%d", &T);
    while (T--) {
        scanf("%d", &tcase);
        printf("%d %d\n", zeroCnt[tcase], oneCnt[tcase]);
    }
    return 0;
}
