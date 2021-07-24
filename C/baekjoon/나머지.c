#include <stdio.h>

int main(){
	int N;
	int arr[42]={0, };
	int i, j, result=0;

	for(i=0; i<10; i++){
		scanf("%d", &N);
		arr[(N%42)] = 1;
	}

	for(i=0; i<42; i++){
			if(arr[i]==1)
				result++;
	}

	printf("%d", result);
	return 0;
}
