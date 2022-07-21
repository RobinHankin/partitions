The partitions package: enumeration in R
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="man/figures/partitions.png" width = "150" align="right" />

<!-- badges: start -->

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/partitions)](https://cran.r-project.org/package=partitions)
[![](http://cranlogs.r-pkg.org/badges/grand-total/onion?color=blue)](https://cran.r-project.org/package=onion)

<!-- badges: end -->

# Overview

The `partitions` package provides efficient vectorized code to enumerate
solutions to various integer equations. For example, we might note that

![
5 = 4+1 = 3+2 = 3+1+1 = 2+2+1 = 2+1+1+1 = 1+1+1+1+1
](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%0A5%20%3D%204%2B1%20%3D%203%2B2%20%3D%203%2B1%2B1%20%3D%202%2B2%2B1%20%3D%202%2B1%2B1%2B1%20%3D%201%2B1%2B1%2B1%2B1%0A "
5 = 4+1 = 3+2 = 3+1+1 = 2+2+1 = 2+1+1+1 = 1+1+1+1+1
")

and we might want to list all seven in a consistent format (note here
that each sum is written in nonincreasing order, so
![3+1](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;3%2B1 "3+1")
is considered to be the same as
![1+3](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;1%2B3 "1+3")).

# Installation

You can install the released version of wedge from
[CRAN](https://CRAN.R-project.org) with:

``` r
# install.packages("partitions")  # uncomment this to install the package
library("partitions")
```

# The `partitions` package in use

To enumerate the partitions of 5:

``` r
parts(5)
#>                   
#> [1,] 5 4 3 3 2 2 1
#> [2,] 0 1 2 1 2 1 1
#> [3,] 0 0 0 1 1 1 1
#> [4,] 0 0 0 0 0 1 1
#> [5,] 0 0 0 0 0 0 1
```

(each column is padded with zeros). Of course, larger integers have many
more partitions and in this case we can use `summary()`:

``` r
summary(parts(16))
#>                                                            
#>  [1,] 16 15 14 14 13 13 13 12 12 12 ... 3 2 2 2 2 2 2 2 2 1
#>  [2,] 0  1  2  1  3  2  1  4  3  2  ... 1 2 2 2 2 2 2 2 1 1
#>  [3,] 0  0  0  1  0  1  1  0  1  2  ... 1 2 2 2 2 2 2 1 1 1
#>  [4,] 0  0  0  0  0  0  1  0  0  0  ... 1 2 2 2 2 2 1 1 1 1
#>  [5,] 0  0  0  0  0  0  0  0  0  0  ... 1 2 2 2 2 1 1 1 1 1
#>  [6,] 0  0  0  0  0  0  0  0  0  0  ... 1 2 2 2 1 1 1 1 1 1
#>  [7,] 0  0  0  0  0  0  0  0  0  0  ... 1 2 2 1 1 1 1 1 1 1
#>  [8,] 0  0  0  0  0  0  0  0  0  0  ... 1 2 1 1 1 1 1 1 1 1
#>  [9,] 0  0  0  0  0  0  0  0  0  0  ... 1 0 1 1 1 1 1 1 1 1
#> [10,] 0  0  0  0  0  0  0  0  0  0  ... 1 0 0 1 1 1 1 1 1 1
#> [11,] 0  0  0  0  0  0  0  0  0  0  ... 1 0 0 0 1 1 1 1 1 1
#> [12,] 0  0  0  0  0  0  0  0  0  0  ... 1 0 0 0 0 1 1 1 1 1
#> [13,] 0  0  0  0  0  0  0  0  0  0  ... 1 0 0 0 0 0 1 1 1 1
#> [14,] 0  0  0  0  0  0  0  0  0  0  ... 1 0 0 0 0 0 0 1 1 1
#> [15,] 0  0  0  0  0  0  0  0  0  0  ... 0 0 0 0 0 0 0 0 1 1
#> [16,] 0  0  0  0  0  0  0  0  0  0  ... 0 0 0 0 0 0 0 0 0 1
```

Sometimes we want to find the unequal partitions (that is, partitions
without repeats):

``` r
summary(diffparts(16))
#>                                                           
#> [1,] 16 15 14 13 13 12 12 11 11 11 ... 8 8 7 7 7 7 7 6 6 6
#> [2,] 0  1  2  3  2  4  3  5  4  3  ... 5 4 6 6 5 5 4 5 5 4
#> [3,] 0  0  0  0  1  0  1  0  1  2  ... 2 3 3 2 4 3 3 4 3 3
#> [4,] 0  0  0  0  0  0  0  0  0  0  ... 1 1 0 1 0 1 2 1 2 2
#> [5,] 0  0  0  0  0  0  0  0  0  0  ... 0 0 0 0 0 0 0 0 0 1
```

## Restricted partitions

Sometimes we have restrictions on the partition. For example, to
enumerate the partitions of 9 into 5 parts we would use
`restrictedparts()`:

``` r
summary(restrictedparts(9,5))
#>                                                 
#> [1,] 9 8 7 6 5 7 6 5 4 5 ... 5 4 4 3 3 5 4 3 3 2
#> [2,] 0 1 2 3 4 1 2 3 4 2 ... 2 3 2 3 2 1 2 3 2 2
#> [3,] 0 0 0 0 0 1 1 1 1 2 ... 1 1 2 2 2 1 1 1 2 2
#> [4,] 0 0 0 0 0 0 0 0 0 0 ... 1 1 1 1 2 1 1 1 1 2
#> [5,] 0 0 0 0 0 0 0 0 0 0 ... 0 0 0 0 0 1 1 1 1 1
```

and if we want the partitions of 9 into parts not exceeding 5 we would
use the conjugate of this:

``` r
summary(conjugate(restrictedparts(9,5)))
#>                                                  
#>  [1,] 1 2 2 2 2 3 3 3 3 3 ... 4 4 4 4 4 5 5 5 5 5
#>  [2,] 1 1 2 2 2 1 2 2 2 3 ... 2 2 3 3 4 1 2 2 3 4
#>  [3,] 1 1 1 2 2 1 1 2 2 1 ... 1 2 1 2 1 1 1 2 1 0
#>  [4,] 1 1 1 1 2 1 1 1 2 1 ... 1 1 1 0 0 1 1 0 0 0
#>  [5,] 1 1 1 1 1 1 1 1 0 1 ... 1 0 0 0 0 1 0 0 0 0
#>  [6,] 1 1 1 1 0 1 1 0 0 0 ... 0 0 0 0 0 0 0 0 0 0
#>  [7,] 1 1 1 0 0 1 0 0 0 0 ... 0 0 0 0 0 0 0 0 0 0
#>  [8,] 1 1 0 0 0 0 0 0 0 0 ... 0 0 0 0 0 0 0 0 0 0
#>  [9,] 1 0 0 0 0 0 0 0 0 0 ... 0 0 0 0 0 0 0 0 0 0
```

## Block parts

Sometimes we have restrictions on each element of a partition and in
this case we would use `blockparts()`:

``` r
summary(blockparts(1:6,10))
#>                                                 
#> [1,] 1 1 1 1 0 1 1 1 0 1 ... 0 1 0 0 0 1 0 0 0 0
#> [2,] 2 2 2 1 2 2 2 1 2 2 ... 0 0 1 0 0 0 1 0 0 0
#> [3,] 3 3 2 3 3 3 2 3 3 1 ... 2 0 0 1 0 0 0 1 0 0
#> [4,] 4 3 4 4 4 2 3 3 3 4 ... 0 1 1 1 2 0 0 0 1 0
#> [5,] 0 1 1 1 1 2 2 2 2 2 ... 2 2 2 2 2 3 3 3 3 4
#> [6,] 0 0 0 0 0 0 0 0 0 0 ... 6 6 6 6 6 6 6 6 6 6
```

which would show all solutions to
![\\sum\_{i=1}^6a_i=9](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%5Csum_%7Bi%3D1%7D%5E6a_i%3D9 "\sum_{i=1}^6a_i=9"),
![a_i\\leq i](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;a_i%5Cleq%20i "a_i\leq i").

## Compositions

Above we considered
![3+2](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;3%2B2 "3+2")
and
![2+3](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;2%2B3 "2+3")
to be the same partition, but if these are considered to be distinct, we
need the *compositions*, not partitions:

``` r
compositions(4)
#>                     
#> [1,] 4 1 2 1 3 1 2 1
#> [2,] 0 3 2 1 1 2 1 1
#> [3,] 0 0 0 2 0 1 1 1
#> [4,] 0 0 0 0 0 0 0 1
```

## Set partitions

A set of 4 elements, WLOG
![\\{1,2,3,4\\}](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%5C%7B1%2C2%2C3%2C4%5C%7D "\{1,2,3,4\}"),
may be partitioned into subsets in a number of ways and these are
enumerated with the `setparts()` function:

``` r
setparts(4)
#>                                   
#> [1,] 1 1 1 1 2 1 1 1 1 1 1 2 2 2 1
#> [2,] 1 1 1 2 1 2 1 2 2 1 2 1 1 3 2
#> [3,] 1 2 1 1 1 2 2 1 3 2 1 3 1 1 3
#> [4,] 1 1 2 1 1 1 2 2 1 3 3 1 3 1 4
```

In the above, column `2 3 1 1` would correspond to the set partition
![\\{\\{3,4\\},\\{1\\},\\{2\\}\\}](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%5C%7B%5C%7B3%2C4%5C%7D%2C%5C%7B1%5C%7D%2C%5C%7B2%5C%7D%5C%7D "\{\{3,4\},\{1\},\{2\}\}").

## Multiset

Knuth deals with multisets (that is, a generalization of the concept of
set, in which elements may appear more than once) and gives an algorithm
for enumerating a multiset. His simplest example is the permutations of
![\\{1,2,2,3\\}](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%5C%7B1%2C2%2C2%2C3%5C%7D "\{1,2,2,3\}"):

``` r
multiset(c(1,2,2,3))
#>                             
#> [1,] 1 1 1 2 2 2 2 2 2 3 3 3
#> [2,] 2 2 3 1 1 2 2 3 3 1 2 2
#> [3,] 2 3 2 2 3 1 3 1 2 2 1 2
#> [4,] 3 2 2 3 2 3 1 2 1 2 2 1
```

It is possible to answer questions such as the permutations of the word
“pepper”:

``` r
library("magrittr")

"pepper"    %>%
strsplit("") %>%
unlist        %>%
match(letters) %>%
multiset        %>%
apply(2,function(x){x %>% `[`(letters,.) %>% paste(collapse="")})
#>  [1] "eepppr" "eepprp" "eeprpp" "eerppp" "epeppr" "epeprp" "eperpp" "eppepr"
#>  [9] "epperp" "eppper" "epppre" "epprep" "epprpe" "eprepp" "eprpep" "eprppe"
#> [17] "ereppp" "erpepp" "erppep" "erpppe" "peeppr" "peeprp" "peerpp" "pepepr"
#> [25] "peperp" "pepper" "peppre" "peprep" "peprpe" "perepp" "perpep" "perppe"
#> [33] "ppeepr" "ppeerp" "ppeper" "ppepre" "pperep" "pperpe" "pppeer" "pppere"
#> [41] "pppree" "ppreep" "pprepe" "pprpee" "preepp" "prepep" "preppe" "prpeep"
#> [49] "prpepe" "prppee" "reeppp" "repepp" "reppep" "repppe" "rpeepp" "rpepep"
#> [57] "rpeppe" "rppeep" "rppepe" "rpppee"
```

## Riffle shuffles

A
![(p,q)](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%28p%2Cq%29 "(p,q)")
riffle shuffle is an ordering
![\\sigma](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%5Csigma "\sigma")
of integers
![1,2,\\ldots,p+q](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;1%2C2%2C%5Cldots%2Cp%2Bq "1,2,\ldots,p+q")
such that
![1,\\ldots p](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;1%2C%5Cldots%20p "1,\ldots p")
and
![p+1,\\ldots p+q](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;p%2B1%2C%5Cldots%20p%2Bq "p+1,\ldots p+q")
appear in their original order: if
![1\\leq i_1 \< i_2\\leq p](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;1%5Cleq%20i_1%20%3C%20i_2%5Cleq%20p "1\leq i_1 < i_2\leq p"),
then
![\\sigma(i_1) \< \\sigma(i_2)](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%5Csigma%28i_1%29%20%3C%20%5Csigma%28i_2%29 "\sigma(i_1) < \sigma(i_2)"),
and if
![p+1\\leq j_1 \< j_2\\leq p+q](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;p%2B1%5Cleq%20j_1%20%3C%20j_2%5Cleq%20p%2Bq "p+1\leq j_1 < j_2\leq p+q"),
then
![\\sigma(j_1) \< \\sigma(i_j)](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%5Csigma%28j_1%29%20%3C%20%5Csigma%28i_j%29 "\sigma(j_1) < \sigma(i_j)").
The two groups of integers appear in their original order. To enumerate
all
![(p,q)](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%28p%2Cq%29 "(p,q)")
riffles, use `riffle()`:

``` r
riffle(2,4)
#>                                   
#> [1,] 1 1 1 1 1 3 3 3 3 3 3 3 3 3 3
#> [2,] 2 3 3 3 3 1 1 1 1 4 4 4 4 4 4
#> [3,] 3 2 4 4 4 2 4 4 4 1 1 1 5 5 5
#> [4,] 4 4 2 5 5 4 2 5 5 2 5 5 1 1 6
#> [5,] 5 5 5 2 6 5 5 2 6 5 2 6 2 6 1
#> [6,] 6 6 6 6 2 6 6 6 2 6 6 2 6 2 2
```

To enumerate all riffles with sizes
![v_1,v_2,\\ldots,v_r](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;v_1%2Cv_2%2C%5Cldots%2Cv_r "v_1,v_2,\ldots,v_r"),
use `genrif()`:

``` r
genrif(1:3)
#>                                                                               
#> [1,] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 4 4 4 4 4 4 4
#> [2,] 2 2 2 2 4 4 4 4 4 4 1 1 1 1 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 1 1 1 1 1 1 2
#> [3,] 3 4 4 4 2 2 2 5 5 5 3 4 4 4 1 4 4 4 1 1 1 3 3 3 5 5 5 5 5 5 2 2 2 5 5 5 1
#> [4,] 4 3 5 5 3 5 5 2 2 6 4 3 5 5 4 1 5 5 3 5 5 1 5 5 1 1 3 3 6 6 3 5 5 2 2 6 3
#> [5,] 5 5 3 6 5 3 6 3 6 2 5 5 3 6 5 5 1 6 5 3 6 5 1 6 3 6 1 6 1 3 5 3 6 3 6 2 5
#> [6,] 6 6 6 3 6 6 3 6 3 3 6 6 6 3 6 6 6 1 6 6 3 6 6 1 6 3 6 1 3 1 6 6 3 6 3 3 6
#>                                                   
#> [1,] 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
#> [2,] 2 2 2 2 2 2 2 2 2 2 2 5 5 5 5 5 5 5 5 5 5 5 5
#> [3,] 1 1 3 3 3 5 5 5 5 5 5 1 1 1 2 2 2 2 2 2 6 6 6
#> [4,] 5 5 1 5 5 1 1 3 3 6 6 2 2 6 1 1 3 3 6 6 1 2 2
#> [5,] 3 6 5 1 6 3 6 1 6 1 3 3 6 2 3 6 1 6 1 3 2 1 3
#> [6,] 6 3 6 6 1 6 3 6 1 3 1 6 3 3 6 3 6 1 3 1 3 3 1
```

# Further information

For more detail, see the package vignettes

    vignette("partitionspaper")
    vignette("setpartitions")
    vignette("scrabble")
