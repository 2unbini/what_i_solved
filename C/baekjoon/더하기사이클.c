#include <stdio.h>

int main(){
	int N, X=0;
	int a, b, temp, i=0;

	scanf("%d", &N);
	X = N;
	while (1)
	{
		a = X/10;
		b = X%10;
		temp=b;
		b=(a+b)%10;
		a=temp;
		X=10*a+b;
		i++;
		if(X==N)
			break;
	}
	printf("%d", i);
	return 0;
}
