# t r e n d R

## Introduction

This repository contains an R package called `trendr`, which fits a locally-linear state-space model (LLM-SSM) to time series data. trendr has been used on a number of research projects at the [Data Science Campus, Office for National Statistics](https://datasciencecampus.ons.gov.uk/) including [pygrams](https://github.com/datasciencecampus/pygrams). 

## Software Prerequisites

* [R](https://www.r-project.org/) and your GUI of choice, such as [RStudio](https://www.rstudio.com/)


## Installing trendr

### R installation

The easiest method is to install direct from this GitHub repository using:

```
library(devtools)
install_github("datasciencecampus/trendr")
```

Otherwise, you can pull this repository and install locally using:

```
install("path/to/trendr/dir")
```

#### R building

If neither method above works. Or you wish to make changes to the package. Then you will need to build the package. Building trendy requires devtools and roxygen2:

```
# R
install.packages("devtools")
install.packages("roxygen2")
```

Then:

```
build("path/to/trendr/dir")
install("path/to/trendr/dir")
```

Once you have installed trendr using RStudio you can now [start using it in RStudio](#using-rstudio).

## Running trendr

### Data prerequisites

All time series data must be loaded into R as a data frame comprising at least two columns:
* A sequential numeric column (e.g. 1, 2, 3...) or sequential datetime column (01/01/2020, 02/01/2020, 3/01/2020...)
* A value column (e.g. 43, 55, 76...)

The data must be equally spaced (daily) with no missing values. The CSV file must contain headers, the header names can be specified in **`trendr()`** using the `value.colname` and `time.colname` parameters.

### Using RStudio

As with any R package, it can be loaded in an R session using:

```
#R
library(trendr)
```

Then you can use the trendr function:

```{r}
trendr(
  df,
  value.colname,
  time.colname,
  output.dir,
  output.file,
  output.plot
)
```

## Examples

In this package we have included a number of sample data sets. Please see the vignettes folder for analysis on these.