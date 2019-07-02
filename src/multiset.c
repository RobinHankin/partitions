/* Algorithm L of Knuth, fasc2b.pdf, 7.2.1.2, p1.

   Given a sequence of n elements a1,a2,...,an initially sorted so
   that a1 <=a2 <- ... <= an, generate all permutations of {a1,...,an}
   visiting them in lexicographic order.  For example, the
   permutations of 1223 are

  1223 1232 1322 2123 2132 2213 2231 2312 2321 3122 3212 3221


*/

int nextmultiset(int *a, const int n){

	int j,k,l,m;
	for(j=n-2 ; a[j] >= a[j+1] ; j--){continue;} /* L2 */
	if(j<0){ return 1; } /* should not happen */   
	
	for(l=n-1 ; a[l] <= a[j] ; l--){continue;}

	m    = a[l];
	a[l] = a[j];
	a[j] = m;

	k = j+1;   /* L4 */
	l = n-1;  /* off by one */
	
	for(; k<l ; m=a[l], a[l--]=a[k], a[k++]=m){continue;}
	return 0;
}

void c_multiset(const int *v, const int *n, const int *nn, int *a){
	
        const int nr = (*n);  /* nr = number of rows */ 
	const int ne = (*nn); /* ne = number of (matrix) elements */	
	int i;

	for(i=0 ; i < nr ; i++){
		a[i] = v[i];
	}

	for(i=1 ; i < ne ; i++){
		for(int j=0 ; j < nr ; j++){
			a[i*nr + j] = a[(i-1)*nr + j];
	  }
		nextmultiset(a+i*nr, nr); 
	}
}
