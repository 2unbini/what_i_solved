#include <stdio.h>

int main(){
	int A, B, C;
	int multi;
	int i=0, n=1;
	int j, k, count;

	scanf("%d %d %d", &A, &B, &C);
	multi = A*B*C;

	while(multi/n!=0){
		n *= 10;
		i++;
	}

	j = i;
	n /= 10;
	int num[j];

	for(j=0; j<i; j++){
		num[j] = multi/n;
		multi = multi%n;
		n/=10;
	}

	for(j=0; j<10; j++){
		count = 0;
		for(k=0; k<i; k++){
			if(num[k]==j)
				count += 1;
		}
		printf("%d\n", count);
	}
	return 0;
}
