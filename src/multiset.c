/* Algorithm L of Knuth, fasc2b.pdf, 7.2.1.2, p1.

   Given a sequence of n elements a1,a2,...,an initially sorted so
   that a1 <=a2 <- ... <= an, generate all permutations of {a1,...,an}
   visiting them in lexicographic order.  For example, the
   permutations of 1223 are

  1223 1232 1322 2123 2132 2213 2231 2312 2321 3122 3212 3221


*/

int nextmultiset(int *a, const int n){

	int j,k,l,m;
	for(j=n-2  ; a[j] >= a[j+1] ; j--){} /* L2 */
	if(j<0){ return 1; } /* should not happen */   

	for(l=n-1 ; a[l] <= a[j] ; l--){}

	m    = a[l];
	a[l] = a[j];
	a[j] = m;

	k = j+1;   /* L4 */
	l = n-1;  /* off by one */
	
	while(k < l){
		m      = a[l];
		a[l--] = a[k];
		a[k++] = m;
	}

	/*	while(k < l){
		m    = a[l];
		a[l] = a[k];
		a[k] = m;
		k++;
		l--; 
		}*/


	return 0;
}

void c_multiset(const int *v, const int *n, const int *nn, int *a){
	int i;
	for(i=0 ; i < (*n) ; i++){
		a[i] = v[i];
	}

	for(i=1 ; i < (*nn) ; i++){
		for(int j=0 ; j < (*n) ; j++){
			a[i*(*n) + j] = a[(i-1)*(*n) + j];
	  }
		nextmultiset(a+i*(*n), *n); 
	}
}
