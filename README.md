# t r e n d R

## Introduction

This repository contains an R package called `trendr`, which fits a locally-linear state-space model (LLM-SSM) to time series data. `trendr` has been used on a number of research projects at the [Data Science Campus, Office for National Statistics](https://datasciencecampus.ons.gov.uk/) including [pygrams](https://github.com/datasciencecampus/pygrams). 

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

If neither method above works, or if you wish to make changes to the package, then you will need to build it. Building `trendr` requires `devtools` and `roxygen2`:

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

Once you have installed `trendr` using RStudio you can now [start using it in RStudio](#using-rstudio).

## Running trendr

### Data prerequisites

All time series data must be loaded into R as a data frame comprising of at least two columns:
* The first column is an indexing variable for the values in the second column. The values can be, for example, a numeric sequence (e.g. 1, 2, 3...) or sequential datetime column ("2020/01/01", "2020/01/02", "2020/01/03" ...).
* The second column contains the values of the process you want to extract the trend of. It is numeric (e.g. 43, 55, 76...)

The data must be equally spaced (e.g. daily, quarterly, yearly data) with no missing values. The CSV file must contain headers (column names). The header names can be specified in **`trendr()`** using the `value.colname` and `time.colname` parameters.

### Using RStudio

As with any R package, it can be loaded in an R session using:

```
#R
library(trendr)
```

Then you can use the `trendr` function:

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

In this package we have included a number of sample data sets. Please see the vignettes folder for analysis of them.
