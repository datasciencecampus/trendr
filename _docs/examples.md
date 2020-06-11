---
layout: docs
docid: "examples"
title: "Examples"
permalink: /docs/example.html
subsections:
  - title: Random
    id: random
  - title: Japan GDP
    id: japan-gdp
  - title: UK rainfall
    id: uk-rainfall
---

<a id="random"> </a>

## Random Data

randomData is a time series of increasing random numbers with a peak. 

```R
# R
trendr(df = randomData,
        value.colname = 'value',
        time.colname = 'date',
        output.dir = '', 
        output.file = 'randomData.csv',
        output.plot = T)
```

![png](/trendr/static/graphs/random.png) 


<a id="japan-gdp"> </a>

## Japan GDP

japanGDPData [is a subset of the World Banks Gross Domestic Product (GDP) data set for 1960 to 2018](https://data.worldbank.org/indicator/NY.GDP.MKTP.CD?end=2018&locations=JP). 

```R
# R
trendr(df = japanGDPData,
        value.colname = 'value',
        time.colname = 'year',
        output.dir = '', 
        output.file = 'japanGDPData.csv',
        output.plot = T)
```

![png](/trendr/static/graphs/japan.png) 


<a id="uk-rainfall"> </a>

## UK Rainfall

ukRainData [is a subset of DEFRA's uk rainfall data for 1980 to 2012](http://data.defra.gov.uk/statistics_2015/env/water/uk_rain_2014.csv). 

```R
# R
trendr(df = ukRainData,
        value.colname = 'rain_year',
        time.colname = 'year',
        output.dir = '', 
        output.file = 'ukRainData.csv',
        output.plot = T)
```

![png](/trendr/static/graphs/rain.png) 
