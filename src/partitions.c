#include <stdio.h>

void c_nextpart(int *x)
{
        int i, yy, n, a, b;

        a=0;
	while(x[++a] >0){} 
	a--; /* a position of last nonzero */

	b=a;
	while(x[b--] == 1){ }
	b++; /* b: pos of last elt >1 */
	
        if(x[a]>1){ /* if last nonzero number >1 */
                x[a]-- ; /* subtract one from it */
                x[a+1] = 1; /* and put a 1 next to it */
                return ;
        } 
        n = a-b;   /* n: number of 1s*/
        x[b]--;    /* decrement final nonzero digit (perforce >1) */
        yy = x[b]; /* and add 1 to the next place */

        n++;           /* n is now number of 1s plus 1 (thus "n" is to
			* to be distributed as evenly as possible
			* after x[a]) */ 
	i = b;        
	while(n >= yy){        /* distribute n among elements x[a] onwards */
		x[++i] = yy;   /* by repeatedly adding yy until no longer */
		n -= yy;       /* possible */ 
	}
	if(n){
		x[++i] = n;    /* add the remainder to x */
	}
	while(i < a){          /* set remaining elements to 0 */
		x[++i] = 0;
	}
	
	return;
}

void c_nextdiffpart(int *x, const int *ntri)
{
        int yy, a, aa, d, n;
	
	a = *ntri;
	while(x[--a] ==0){ }
	aa=a; /* position of last nonzero */

	d=1;
	n=0;
	while ( (x[a]-d) < 2) {
		n += x[a--];  /* n is running total */
		d++;
	} 
        yy= --x[a++];  
	n++; /* add one to n to compensate for decrementing x[a+1] */
	while(n >= yy){   /*now add a decreasing sequence to x[a],x[a+1],...*/
		x[a++] = --yy;  
		n -= yy;       
	};
	x[a] = n;            /* add the remainder to x */
	while(a < aa){       /* set remaining elements to 0 */
		x[++a] = 0;
	}
	return;
}

int c_nextrestrictedpart(int *x, const int *len) /* algorithm on p232 of Andrews */
{
	int a, j, m, r;

	a = *len -1;

/*	while(  (m-x[--a]) < 2 ){ } */

	for(m=x[a] ; m-x[a]<2 ; ){
		if(--a < 0){
			return 1;
		}
	}
	
     	                               /* thus a is Andrews's Lambda_j.
	                                 The diagnostic for existence
					 of a next partition is a >= 0;
					 otherwise recursion has
					 "bottomed out" and we return
					 1*/

	x[a]++;
	j=x[a];

	r= -1;  /* r is the residual */
	do {
		r += x[a] - j;
		x[a] = j;
	} while (++a < *len-1);
	x[*len-1] += r;
	return 0;
}

void c_numbparts(const int *n, double *p){/* p(1)...p(n) calculated using
				     Euler's recursive formula on p825
				     of Abramowitz & Stegun */
	int i, s, f, r;
	unsigned long long int *ip;
	unsigned long long int pp[*n];

	pp[0] = pp[1] = 1;
	for(i=2 ; i< *n ; i++){
		/* first do r = m(3m+1)/2  */
		s = 1;  /* "s" for "sign" */
		f = 5;  /* f is first difference  */
		r = 2;  /* initial value (viz m(3m+1)/2 for m=1) */

		ip = pp+i;
		*ip = 0;
		while(i-r >= 0){
			*ip += s*pp[i-r];
			r += f;
			f += 3;  /* 3 is the second difference */
			/* change sign of s */
			s *= -1;
		}
		/* now do r = m(3m-1)/2 */
		s = 1;
		f = 4; /*first difference now 4 */
		r = 1; /* initial value (viz m(3m-1)/2 for m=1) */
		while(i-r >= 0){
			*ip += s*pp[i-r];
			r += f;
			f += 3;
			s *= -1;
		}
	}
	for(i=0 ; i < *n ; i++){
                p[i] = (double) pp[i];
        }
}

void c_numbdiffparts(const int *n, double *q){/* q(1)...q(n) calculated using
					 the recursion on p826 of
					 Abramowitz and Stegun*/
	int i,s,f,r;
	unsigned long long int qq[*n];
	qq[0] = qq[1] = 1;
	for(i=2 ; i < *n ; i++){
		qq[i] = 0;
		/* first do r = m(3m+1)/2  */
		s = 1;  /* "s" for "sign" */
		f = 5;  /* f is first difference  */
		r = 2;  /* initial value (viz m(3m+1)/2 for m=1) */
		while(i >= r){
			qq[i] += s*qq[i-r] ;
			/* change q[i] by 1 if i=m(3m+1): */
			if(i==r*2){
				qq[i] -= s;
			}
			r += f;
			f += 3;  /* 3 is the second difference */
			s *= -1; /* change sign of s */
		}
		/* now do r = m(3m-1)/2 */
		s = 1;
		f = 4; /* first difference now 4 */
		r = 1; /* initial value (viz m(3m-1)/2 for m=1) */
		while(i >= r){
			qq[i] += s*qq[i-r] ;
			if(i==r*2){
				qq[i] -= s;
			}
			r += f;
			f += 3;
			s *= -1;
		}
	}
	for(i=0 ; i < *n ; i++){
                q[i] = (double) qq[i];
        }
}

int numbrestrictedparts(int *x, const int m){ /* array x is  c(rep(1,m-1),n-m+1) */
	int count=1;
	while(c_nextrestrictedpart(x, &m)==0)
	{
		count++;
	} 
	return count;
}

void numbrestrictedparts_R(int *x, const int *m, int *ans){
	*ans = numbrestrictedparts(x, *m);
}

void c_allparts(const int *n, const int *len, int *x){
	int i,j;
	x[0] = *n;
	for(i=1 /* sic */ ; i < *n ;  i++){ 
		x[i] = 0 ;
	}
	
	for(i= *n ; i < *len ; i += *n){
		for(j=0 ; j < *n ; j++){
			x[i+j] = x[i+j - *n];
		}
		c_nextpart(x+i);
	}
}

void c_alldiffparts(const int *n, const int *len, const int *ntri, int *x){
	int i,j;
	x[0] = *n;
	
	for(i= *ntri ; i < *len ; i += *ntri){
		for(j=0 ; j < *ntri ; j++){
			x[i+j] = x[i+j - *ntri];
		}
		c_nextdiffpart(x+i , ntri);
	}
}

void c_allrestrictedparts(const int *m, const int *n, const int *len, const int *inc, int *x){
	int i,j;
	if(*inc == 0){
		for(i=0 ; i < (*m)-1 ; i++){ 
			x[i] = 1 ;
		}
		x[*m-1] = *n - *m + 1;
	} else {
		for(i=0 ; i < (*m)-1 ; i++){ 
			x[i] = 0 ;
		}
		x[*m-1] = *n ;
	}

	for(i= *m ; i < *len ; i += *m){
		for(j=0 ; j < *m ; j++){
			x[i+j] = x[i+j - *m];
		}
		c_nextrestrictedpart(x+i , m);
	}
}


void conjugate_vector(int *x, const int len, int *y)
{
	int i,j;
	for(j=0 ; x[0]>0 ; j++)
	{
		for(i=0; (i<len) && (x[i]>0) ; i++)
		{
			x[i]--;
			y[j]++;
		} 
	}
}

void c_conjugate(int *x, const int *nrow, const int *ncol, const int *nmax, int *y)
{
	int i;
	for(i=0 ; i< (*ncol) ; i++){
		conjugate_vector(x+ (i*(*nrow)) , *nrow, y+i*(*nmax));
	}
}

int durfee_vector(const int *x)
{
      int i;
      for(i=0 ; x[i]>i ; i++){}
      return i;
}

void c_durfee(const int *x, const int *nrow, const int *ncol, int *y)
{
	int i;
	for(i=0 ; i< (*ncol) ; i++){
   	       y[i] = durfee_vector(x +  i*(*nrow));
	}
}

int c_nextblockpart(int *x, const int *y, const int *inlen)
{ /* "x" is the vector of numbers of blocks, "y" is
    the vector of maximum number of blocks,  "len"
    is the length of these vectors */
        int a,i,j;
	const int len = *inlen;
	for(i=0 , a=x[0] ; (!x[i++]) || (x[i] ==y[i]) ; a += x[i]){};
	/* i: position of first stack into which a block can be moved */ 
	/* a: number of blocks in stacks up to and including the first movable one */

	if(i >= len){  /* check for all elements being at the right (ie x is the
			last partition; the recursion has ended so return 1) */
		return 1;
	}

	a--; /* a: number of blocks below and to the left of the first movable one */

	/* Now move the block one stack rightward, leaving "i" unchanged: */
	x[i--]++;
	x[i++]--;


	/* Now reallocate the "a" blocks by filling up the stack one by one from x[0] to x[i]:*/
	for(j=0 ; j<i ; j++){
	  if(a < y[j]){  /* empty all "a" blocks into x[j] */
	    x[j] = a;   
	    a = 0;
	  } else {
	    x[j]=y[j];
	    a -= y[j];
	  }
	}
	
	/* Getting here means that the function executed correctly: return 0 */
	return 0;
}


void c_allblockparts(int *x, const int *y, const int *nb, const int *len, const int *total){
/* arguments: "x" is the initial block arrangements, "y" is the stack,
   "nb" is the number of block arrangements (from numbblockparts()),
   "len" is the length of vectors "x" and "y", and "total" is the number
   of blocks to play with"
*/
	int a,i,j;
	/* First fill array "x" from x[0] to x[n-1]: */

	a = *total;
	for(i=0 ; i< (*len) ; i++){
	  if(a < y[i]){  /* empty all "a" blocks into x[j] */
	    x[i] = a;   
	    a = 0;
	  } else {
	    x[i]=y[i];
	    a -= y[i];
	  }
	}

	for(i= *len ; i < (*len) * (*nb) ; i += *len){
	  for(j=0 ; j < *len ; j++){
	    x[i+j] = x[i+j - *len];
	  }
	  c_nextblockpart(x+i, y, len); 
	}
}

/*
int nextperm(int *x, const int len)
{
	int i,j,m;
	for(i=len ; x[i]<x[i-1] ; i--){ }
	if(i==0){
		return 1;
	}

	for(j=len ; j>i & x[i]<x[j] ; j--){ }
	m    = x[j];
	x[j] = x[i];
	x[i] = m;

	for(j=len; j>i ; j--){
		m        = x[len-j];
		x[len-j] = x[j];
		x[j]     = m;
	}
	return 0;

}

void allperms(int *x, int *len, int *nb){
	int i,j;
			
	for(i= *len ; i < (*len) * (*nb) ; i += *len){
		for(j=0 ; j < *len ; j++){
			x[i+j] = x[i+j - *len];
		}
		nextperm(x+i, *len); 
	}
}
*/

void c_tobin(const int *num, int *out, const int *len){
	int i = *len -1;
	int n = *num;
	while(i >= 0){
		out[i--] = n%2;
		n /= 2;
	}
}

void c_comptobin(int *comp, const int *lencomp, int *ans){
	int p=0;
	for(int i=0 ; i < *lencomp ; i++){
		while(--comp[i]){
			ans[p++] = 0;
		}
		ans[p++] = 1;
	}
}

void c_bintocomp(const int *bin, const int *lenbin, int *comp){
	int p=0;
	for(int i=0 ; i < *lenbin; i++){
		if(bin[i]){
			p++;
		} else {
			comp[p]++;
		}
	}
}
