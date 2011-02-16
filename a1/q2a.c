#include<stdio.h>

int main(){
  double a=0.1, b=1.1;

  for(a=0.1; a<=.5; a+=0.1){
    printf("a = %e\n", a);
  }

  for(b=1.1; b<=1.5; b+=0.1){
    printf("b = %e\n", b);
  }

  return 0;
}
