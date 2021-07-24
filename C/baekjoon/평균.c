#include <stdio.h>

int main(){
	int N;
	scanf("%d", &N);
	double arr[N];
	int i;
	double M, sum=0;

	for(i=0; i<N; i++)
		scanf("%lf", &arr[i]);

	M = arr[0];
	for(i=0; i<N; i++){
		if(arr[i]>M)
			M = arr[i];
	}

	for(i=0; i<N; i++){
		arr[i] = arr[i]/M*100;
		sum += arr[i];
	}
	printf("%lf", sum/N);
	return 0;
}
