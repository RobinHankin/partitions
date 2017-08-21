/* Algorithm P of Knuth, fasc2b.pdf, 7.2.1.2, p4.

   Given integer n, generate all factorial(n) permutations.

   Off-by-one alert: Knuth uses 1 to n; I use 0 to n-1.
*/

int nextperm(int *a, const int n){

  int j,k, l=n-1, m;

  for(j=n-2 ; a[j]>a[j+1] ; j--){ } /* L2 */

  if(j<0){
    return 1;  /* algorithm terminated: no successor */
  }

  while(a[j] >= a[l]){ l--; } /* <L3> */
  m    = a[l];
  a[l] = a[j];
  a[j] = m;
  /*  </L3> */  

  k = j+1;
  l = n-1;

  /* <L4> */
  while(k<l){
    m    = a[l];
    a[l] = a[k];
    a[k] = m;
    
    k++;
    l--;
  } 
  /* </L4> */
  return 0;

}
void c_allperms(int *a, const int *nin, const int *fn){
	const int n = *nin;
	int i;

	for(i=0 ; i<n  ;i++){
		a[i] = i+1;
	}

	for(i=1 ; i < (*fn) ; i++){
	  for(int j=0 ; j<n ; j++){
	    a[i*n + j] = a[(i-1)*n+j];
	  }
	  nextperm (a+i*n, n); 
	}
}

void c_plainperms(int *x, const int *nin, const int *fn){
  const int n = *nin;
  int i,j,m,q,s,i1,i2;
  int c[n], o[n];

  for(int j=0 ; j<n ; j++){
	  c[j]=0; /* P1 */
	  o[j]=1;
	  x[j]=j+1;
  }
  
  for(i=1 /*sic*/ ; i < (*fn) ; i++){
    /* P1: */
	  for(int j=0 ; j<n ; j++){
		  x[i*n + j] = x[(i-1)*n + j]; /* P2 */
	  }
	  
	  /* P3: */
	  j=n-1;  /* off-by-one: Knuth's 'n' = my n-1.*/
	  s=0; 
	  
	  /* P4: */
	  for(;;){
		  q = c[j] + o[j]; /* P4 */
		  if(q >= 0){
			  if(q != (j+1)){ /* off-by-one */
			    /* P5: */
				  i1 = (i*n)+j-c[j]+s;
				  i2 = (i*n)+j-q   +s;
				  m     = x[i1]; /* P5 */
				  x[i1] = x[i2];
				  x[i2] = m;
				  c[j]= q;
				  break;
			  } 
			  /* P6: */
			  s++;
		  } 
		  /* P7: */
		  o[j] = -o[j]; 
		  j--;
	  }
  }
}

