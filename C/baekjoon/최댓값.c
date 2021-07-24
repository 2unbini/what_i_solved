#include <stdio.h>

int main(){
	int n[9];
	int i, max, num=0;
	scanf("%d", &n[0]);
	max=n[0];
	for(i=1; i<9; i++){
		scanf("%d", &n[i]);
		if(max<n[i]){
			max=n[i];
			num=i;
		}
	}
	printf("%d\n%d", max, num+1);
	return 0;
}
