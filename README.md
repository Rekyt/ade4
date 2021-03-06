[![Travis-CI Build Status](https://travis-ci.org/sdray/ade4.svg?branch=master)](https://travis-ci.org/sdray/ade4)
[![AppVeyor Build status](https://ci.appveyor.com/api/projects/status/d0hkq4c3f02bpvm0/branch/master?svg=true)](https://ci.appveyor.com/project/sdray/ade4/branch/master)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/ade4)](http://cran.r-project.org/package=ade4)


# [ade4](http://pbil.univ-lyon1.fr/ADE-4/)
Analysis of Ecological Data : Exploratory and Euclidean Methods in Environmental Sciences



Installing *ade4*
-------------

To install the development version from github:

1. Install the release version of `devtools` from CRAN with `install.packages("devtools")`.

2. Make sure you have a working development environment.
    * **Windows**: Install [Rtools](http://cran.r-project.org/bin/windows/Rtools/).
    * **Mac**: Install Xcode from the Mac App Store.
    * **Linux**: Install a compiler and various development libraries (details vary across different flavors of Linux).
    
Then:

```r
library(devtools)
install_github("sdray/ade4")
```

The stable version can be installed from CRAN using:

```r
install.packages("ade4")
```

Once installed, the package can be loaded using:

```r
library("ade4")
```


If you do not wish to install the development environments Rtools (Windows) / XCode (Mac), you can download and install the pre-compiled binary packages from this repository:

* **Windows**:
```r
install.packages("https://github.com/sdray/ade4/releases/download/v1.7-3/ade4_1.7-3.zip")
```

* **Mac**:
```r
install.packages("https://github.com/sdray/ade4/releases/download/v1.7-3/ade4_1.7-3.tgz")
```
