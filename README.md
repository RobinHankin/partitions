The partitions package: enumeration in R
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

# partitions

<!-- badges: start -->

[![Build
Status](https://travis-ci.org/RobinHankin/partitions.svg?branch=master)](https://travis-ci.org/RobinHankin/partitions)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/partitions)](https://cran.r-project.org/package=partitions)
[![Rdoc](http://www.rdocumentation.org/badges/version/partitions)](http://www.rdocumentation.org/packages/partitions)

<!-- badges: end -->

# Overview

The `partitions` package provides efficient vectorized code to enumerate
solutions to various integer equations. For example, we might note that

  
![
5 = 4+1 = 3+2 = 3+1+1 = 2+2+1 = 2+1+1+1 = 1+1+1+1+1
](https://latex.codecogs.com/png.latex?%0A5%20%3D%204%2B1%20%3D%203%2B2%20%3D%203%2B1%2B1%20%3D%202%2B2%2B1%20%3D%202%2B1%2B1%2B1%20%3D%201%2B1%2B1%2B1%2B1%0A
"
5 = 4+1 = 3+2 = 3+1+1 = 2+2+1 = 2+1+1+1 = 1+1+1+1+1
")  

and we might want to list all seven in a consistent format (note here
that each sum is written in nonincreasing order, so
![3+1](https://latex.codecogs.com/png.latex?3%2B1 "3+1") is considered
to be the same as ![1+3](https://latex.codecogs.com/png.latex?1%2B3
"1+3")).

# Installation

You can install the released version of wedge from
[CRAN](https://CRAN.R-project.org)
with:

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
![\\sum\_{i=1}^6a\_i=9](https://latex.codecogs.com/png.latex?%5Csum_%7Bi%3D1%7D%5E6a_i%3D9
"\\sum_{i=1}^6a_i=9"), ![a\_i\\leq
i](https://latex.codecogs.com/png.latex?a_i%5Cleq%20i "a_i\\leq i").

## Compositions

Above we considered ![3+2](https://latex.codecogs.com/png.latex?3%2B2
"3+2") and ![2+3](https://latex.codecogs.com/png.latex?2%2B3 "2+3") to
be the same partition, but if these are considered to be distinct, we
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
![\\{1,2,3,4\\}](https://latex.codecogs.com/png.latex?%5C%7B1%2C2%2C3%2C4%5C%7D
"\\{1,2,3,4\\}"), may be partitioned into subsets in a number of ways
and these are enumerated with the `setparts()` function:

``` r
setparts(4)
#>                                   
#> [1,] 1 1 1 1 2 1 1 1 1 1 1 2 2 2 1
#> [2,] 1 1 1 2 1 2 1 2 2 1 2 1 1 3 2
#> [3,] 1 2 1 1 1 2 2 1 3 2 1 3 1 1 3
#> [4,] 1 1 2 1 1 1 2 2 1 3 3 1 3 1 4
```

In the above, column `2 3 1 1` would correspond to the set partition
![\\{\\{3,4\\},\\{1\\},\\{2\\}\\}](https://latex.codecogs.com/png.latex?%5C%7B%5C%7B3%2C4%5C%7D%2C%5C%7B1%5C%7D%2C%5C%7B2%5C%7D%5C%7D
"\\{\\{3,4\\},\\{1\\},\\{2\\}\\}").

## Multiset

Knuth deals with multisets (that is, a generalization of the concept of
set, in which elements may appear more than once) and gives an algorithm
for enumerating a multiset. His simplest example is the permutations of
![\\{1,2,2,3\\}](https://latex.codecogs.com/png.latex?%5C%7B1%2C2%2C2%2C3%5C%7D
"\\{1,2,2,3\\}"):

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
#>  [1] "eepppr" "eepprp" "eeprpp" "eerppp" "epeppr" "epeprp" "eperpp"
#>  [8] "eppepr" "epperp" "eppper" "epppre" "epprep" "epprpe" "eprepp"
#> [15] "eprpep" "eprppe" "ereppp" "erpepp" "erppep" "erpppe" "peeppr"
#> [22] "peeprp" "peerpp" "pepepr" "peperp" "pepper" "peppre" "peprep"
#> [29] "peprpe" "perepp" "perpep" "perppe" "ppeepr" "ppeerp" "ppeper"
#> [36] "ppepre" "pperep" "pperpe" "pppeer" "pppere" "pppree" "ppreep"
#> [43] "pprepe" "pprpee" "preepp" "prepep" "preppe" "prpeep" "prpepe"
#> [50] "prppee" "reeppp" "repepp" "reppep" "repppe" "rpeepp" "rpepep"
#> [57] "rpeppe" "rppeep" "rppepe" "rpppee"
```

# Further information

For more detail, see the package vignettes

    vignette("partitionspaper")
    vignette("setpartitions")
    vignette("scrabble")
