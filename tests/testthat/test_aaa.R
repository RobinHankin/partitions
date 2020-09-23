test_that("Test suite aaa",{

# a little function for equality:
minmax <- function(x){all.equal(min(x), max(x))}

# size of tests:
N <- 20

#first check that the parts sum correctly:

f <- function(n){
  if (length(n) > 1) {
    return(sapply(n, match.fun(sys.call()[[1]])))
  }

  m <- ceiling(n/2)

  minmax(apply(           parts(n  ) ,2,sum))          &
  minmax(apply(       diffparts(n  ) ,2,sum))          &
  minmax(apply( restrictedparts(n,m) ,2,sum))          &
  minmax(apply(conjugate(          parts(n  )),2,sum)) &
  minmax(apply(conjugate(      diffparts(n  )),2,sum)) &
  minmax(apply(conjugate(restrictedparts(n,m)),2,sum))
}

expect_true(all(f(3:N)))


# now check that parts() has rep(1,n) as the last partition:
g <- function(n){
  if (length(n) > 1) {
    return(sapply(n, match.fun(sys.call()[[1]])))
  }
  jj <- parts(n)
  minmax(c(1,jj[,ncol(jj)]))
}

expect_true(all(g(1:N)))

# now some spot checks:

# Andrews, page232:
expect_equal(R(5,12), 13)

# a couple of values taken from A&S, table 21.5, page 836:
expect_equal(P(100), 190569292)
expect_equal(Q(100), 444793)


# some checks of conjugation.  Because conjugation is a bijection, the
# conjugate of an (unrestricted) enumeration of partitions should be
# an enumeration of unrestricted partitions, possibly in a different
# order.  The rather longwinded compare() below checks this
# explicitly; see the online helppage for order() for an explanation
# of the use of do.call(); here it is used to provide an unambiguous
# ordering for the partitions.  Note also the need to coerce to a
# matrix so that we can set the dimnames to NULL to allow identical()
# to work as desired.


compare <- function(n){
   if (length(n) > 1) {
        return(sapply(n, match.fun(sys.call()[[1]])))
    }
  jj <- parts(n)

  a <- as.data.frame(as.matrix(t(jj)))
  b <- as.data.frame(as.matrix(t(conjugate(jj))))

  a <- as.matrix(a[do.call(order,a),])
  b <- as.matrix(b[do.call(order,b),])

  dimnames(a) <- NULL
  dimnames(b) <- NULL

  return(identical(a,b))
}

expect_true(all(compare(1:15)))





# some tests of durfee() and conjugate(), from p28 of Andrews:
a <- c(7,7,5,4,4,2,1)
expect_identical(conjugate(a),as.integer(c(7,6,5,5,3,2,2)))


# now verify that the conjugate of an unequal partition is of the form
# c(rep(p,a0),rep(p-1,a1), ... , rep(p-i,ai), ... , rep(1,ap)),
# that is, something like  4 3 2 2 2 2 1 1 1 1 1 0 0 0 0 0 0 0 0 0 ---
# this being  "conjugate(diffparts(20))[,30]".

f <- function(x){ #note second and third tests are the same
 (min(x)  %in%  0:1)            &
 all(diff(x) %in% -1:0)         &
 all(diff(x[cumsum(rle(x)$lengths)]) == -1)
}

g <- function(n){all(apply(conjugate(diffparts(n)),2,f))}

expect_true(g(10))
expect_true(g(11))
expect_true(g(20))

# Check for issue #9
expect_identical(conjugate(integer(0)), integer(0))
expect_identical(conjugate(NULL), integer(0))
expect_identical(conjugate(c()), integer(0))

# Accepting sorted data
set.seed(777)
a_rand <- sample(a)
expect_identical(conjugate(a), conjugate(a_rand, sorted = FALSE))
expect_identical(durfee(a), durfee(a_rand, sorted = FALSE))

new_matrix <- matrix(sample(30, replace = TRUE), nrow = 6)
sorted_matrix <- apply(new_matrix, 2, sort, decreasing = TRUE)
expect_identical(conjugate(sorted_matrix), conjugate(new_matrix, sorted = FALSE))
expect_identical(durfee(sorted_matrix), durfee(new_matrix, sorted = FALSE))

# See issue #11
expect_identical(durfee(matrix(rep(9, 9), nrow = 3)), rep(3L, 3L))


# Now verify that S() is independent of the order of y:
jj <- S(rep(1:4,each=2),5)
expect_equal(jj, 474)
expect_equal(jj, S(rep(1:4,each=2),5))



# Now some tests on compositions():
jj <- compositions(7)
expect_true(all(apply(jj,2,sum)==7))

# test that the bug has been corrected:
expect_true(all(apply(compositions(15,4,TRUE ),2,sum)==15))
expect_true(all(apply(compositions(15,4,FALSE),2,sum)==15))




# some tests of setparts:
f <- function(jj){all(apply(setparts(jj),2,table)==jj)}
expect_true(f(c(3,2)))
expect_true(f(c(3,1)))
expect_true(f(c(3,2,1)))

# Issue 7
expect_equal(
  setparts(as.matrix(c(2,1,1))),
  structure(
    c(1L, 2L, 3L, 1L, 1L, 1L, 2L, 3L, 1L, 2L, 1L, 3L, 2L, 1L, 3L, 1L, 2L, 1L,
      1L, 3L, 2L, 3L, 1L, 1L), .Dim = c(4L, 6L), class = "partition"
    )
)


# some tests of the comptobin(); not run because it needs the elliptic package:
f <- function(n){
  jj <- as.integer(mobius(seq_len(n))==0)
  return(
         identical(jj , comptobin(bintocomp(jj,TRUE ))) &
         identical(jj , comptobin(bintocomp(jj,FALSE)))
         )
}
if(FALSE){
  f(1000)
}

})
