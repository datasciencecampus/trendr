---
layout: docs
docid: "quick_start"
title: "Quick Start"
permalink: /docs/quick_start.html
subsections:
  - title: Software prerequisites
    id: software
  - title: Data prerequisites
    id: data
  - title: Using RStudio
    id: rstudio
---

This repository contains an R package called `trendr`, which fits a locally-linear state-space model (LLM-SSM) to time series data. trendr has been used on a number of research projects at the [Data Science Campus, Office for National Statistics](https://datasciencecampus.ons.gov.uk/) including [pygrams](https://github.com/datasciencecampus/pygrams). 

<a id="software"> </a>

### Software Prerequisites

* [R](https://www.r-project.org/) and your GUI of choice, such as [RStudio](https://www.rstudio.com/)


<a id="data"> </a>

### Data Prerequisites

All time series data must be loaded into R as a data frame comprising at least two columns:
* A sequential numeric column `1, 2, 3...` or sequential datetime column `01/01/2020, 02/01/2020, 3/01/2020...`
* A value column `43, 55, 76...`

The data must be equally spaced (daily) with no missing values. The CSV file must contain headers, the header names can be specified in `trendr()` using the `value.colname` and `time.colname` parameters.

<a id="rstudio"> </a>

### Using RStudio

As with any R package, it can be loaded in an R session using:

```R
# R
library(trendr)
```

Then you can use the trendr function:

```R
# R
trendr(
  df,
  value.colname,
  time.colname,
  output.dir,
  output.file,
  output.plot
)
```

