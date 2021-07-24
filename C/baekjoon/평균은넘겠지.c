#include <stdio.h>

int main(){
	int C, N;
	int score[1000];
	int i, sum=0;
	float percent, over=0;

	scanf("%d", &C);
	while(C!=0){
		scanf("%d", &N);
		for(i=0; i<N; i++){
			scanf("%d", &score[i]);
			sum += score[i];
		}
		for(i=0; i<N; i++){
			if(score[i]>(sum/N))
				over += 1;
		}
		percent = over/N*100;
		printf("%.3f%%\n", percent);
		--C;
		sum=over=0;
	}
	return 0;
}
