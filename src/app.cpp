#include"partitions.h"
#include<iostream>


using namespace prt;


extern "C" void c_wrap(int* t, int* n, int* r) {

 Tuple num(*n);

 int sum=0;

 for(int i=0 ; i<*n ; i++) {
  num[i]=t[i];
  sum+=  t[i];
 }

 Partitions parts(num,sum,r);
}


#ifdef ISMAIN
int main() {

 int tuple[]={3,3,1};
 int n=3;

 int result[10000];

 c_wrap(tuple,&n,result);

 for(int i=0;i<70;i++) {
  for(int j=0;j<7;j++) {
   std::cout << result[i*7+j] << " ";
  }
  std::cout << "\n";
 }

/*
 Tuple num(5);

 num[0]=3; num[1]=3; num[2]=2; num[3]=2; num[4]=1;

 Partitions parts(num,11);

 parts.doit(0,0);
 */

 return 0;
}
#endif
