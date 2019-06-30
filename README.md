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

and we might want to list all seven in a consistent format.

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
