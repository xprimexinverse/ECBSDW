The ECBSDW package
==========

This R package can be used to retrieve time-series from the European Central Bank [Statistical Data Warehouse](http://sdw.ecb.europa.eu/). 

The code behind this package also serves as a backend to an EViews add-in created by the author.

To cite the ECBSDW package in publications, use:

>  Graeme Walsh (2018). _ECBSDW_ R package version **0.1.0**.

Installation - Method 1
-----------

To install the package, use the [devtools package](http://cran.r-project.org/web/packages/devtools/index.html) as follows:

```r
install.packages("devtools")
library(devtools)
install_github(repo="xprimexinverse/ECBSDW")
```

Installation - Method 2
-----------

If you have trouble installing the package using devtools, here is a second method.

1. Go to [GitHub](https://github.com/xprimexinverse/ECBSDW)
2. Download the zip file (click on Clone or Download)
3. Unzip the file
4. In the unzipped file, open the R Project (.rproj) file
5. In RStudio, click Build (top right corner) then Build & Reload (this step may require installing Rtools)

Installation - Method 3
-----------

If you're really stuck, you can load the functions in the package as follows:

```r
source("https://raw.githubusercontent.com/xprimexinverse/ECBSDW/master/R/ECBSDW.R")
```

Quick Start
-----------

Begin by loading the package and reading some of the man pages:

```r
library(ECBSDW)
?ECBSDW
?getECBSDW
```

Examples
-----------

To quickly get a feel for how the package works, run the following examples.

The first example shows how to retrieve inflation data (monthly). The data is returned as a dataframe object containing both the time-series observations and the metadata. 

```r
# Example 1
INFL <- getECBSDW("ICP.M.U2.N.000000.4.ANR")
class(INFL)
names(INFL)
```

The first example demonstrates how to retrieve GDP growth rate data (quarterly).

```r
# Example 2
GDP <- getECBSDW("MNA.Q.Y.I8.W2.S1.S1.B.B1GQ._Z._Z._Z.EUR.LR.GY")
class(GDP)
names(GDP)
```

Feedback, Bugs, Suggestions
-----------

Please contact me at <graeme.walsh@centralbank.ie> or <graeme.walsh@hotmail.co.uk>


News (2018 - August)
-----------
This is the first release of the package. Future plans include adding helper functions for extracting variables from the dataset.

Disclaimer
-----------

I have no affiliation with the European Central Bank. This package is not official software of the European Central Bank nor is the package endorsed by the European Central Bank.
