---
layout: docs
docid: "installation"
title: "Installation"
permalink: /docs/installation.html
subsections:
  - title: Install
    id: install
  - title: Build
    id: build
---

<a id="install"> </a>

### R installation

The easiest method is to install direct from this GitHub repository using:

```R
# R
library(devtools)
install_github("datasciencecampus/trendr")
```

Otherwise, you can pull this repository and install locally using:

```R
# R
install("path/to/trendr/dir")
```
<a id="build"> </a>

#### R building

If neither method above works. Or you wish to make changes to the package. Then you will need to build the package. Building trendy requires devtools and roxygen2:

```R
# R
install.packages("devtools")
install.packages("roxygen2")
```

Then:

```R
# R
build("path/to/trendr/dir")
install("path/to/trendr/dir")
```

Once you have installed trendr using RStudio you can now [start using it in RStudio](#using-rstudio).