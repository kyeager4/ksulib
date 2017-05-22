# ksulibSearch

This package contains convenience functions for testing our site search.

## Installing and configuring R

1. Download R from [cran.r-project.org](https://cran.r-project.org/) and run it. You can use the default install options while using the install wizard.
2. (Optional) Download RStudio from [rstudio.com](https://www.rstudio.com/products/rstudio/download/).

After you have installed R, first time R users will need to install the following packages:
```{r}
install.packages(c("devtools", "dplyr", "xml2", "rvest", "httr", "curl", "tidyr", "stringi"))
```

You will then need to install this package:
```{r}
library(devtools)
install_github("kyeager4/ksulibSearch")
```

Once the packages are installed, you do not have to re-install them the next time you launch R.

If there are changes to the code in this package, you can rerun `install_github("kyeager4/ksulibSearch")` to update to the most recent version.

## Using this package

To use this package:
```{r}
## Load this package (only needs to be done once, at the start of your R session.)
library(ksulibSearch)

## Test a single query on the production site.
query_example1 <- run_ksu_search("hours")

## Test a single query on the test server.
query_example2 <- run_ksu_search("hours", production=FALSE)

## You can also test more than one query at a time by supplying a character vector. 
## Use quotations around each query, and separate each query by a comma.
myterms <- c("hours", "locations", "academic search complete")

query_example3 <- run_ksu_search(myterms)
query_example4 <- run_ksu_search(myterms, production=FALSE)
```

This package is a work in progress.

-------------------------

## To do

High priority:

- [X] The "term" column in the output dataset should contain the original queries, rather than a number (completed 2017-04-14)
- [ ] Handling queries with zero results
- [ ] Output dataframe should include URL for query, not just the query itself
- [ ] Option of retrieving more than one page of hits for a query
- [ ] Option of retrieving just the top _n_ hits for a query
