#include <stdio.h>

int main(){
	int n, i=0;
	int score=0, sum=0;
	char str[80];

	scanf("%d", &n);
	while(n!=0){
		scanf("%s", str);
		score=sum=i=0;
		while (1){
			if(str[i]=='O')
				score+=1;
			else if(str[i]=='X')
				score=0;
			else
				break;
			sum += score;
			++i;
		}
		printf("%d\n", sum);
		--n;
	}
	return 0;
}
