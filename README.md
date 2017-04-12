# ksulib

This package contains convenience functions for testing our site search.

First time R users will need to install the following packages:
```{r}
install.packages(c("devtools", "dplyr", "xml2", "rvest", "httr", "curl", "tidyr", "stringi"))
```

Installing this package:
```{r}
library(devtools)
install_github("kyeager4/ksulib")
```

Using this package:
```{r}
library(ksulib)

## Test a single query on the production site.
query_example1 <- run_ksu_search("hours")

## Test a single query on the test server.
query_example2 <- run_ksu_search("hours", production=FALSE)

## You can also test more than one query at a time by supplying a character vector.

myterms <- c("hours", "locations", "academic search complete")

query_example3 <- run_ksu_search(myterms)
query_example4 <- run_ksu_search(myterms, production=FALSE)
```

This package is a work in progress.

-------------------------

## To do

High priority:

- [ ] The "term" column in the output dataset should contain the original queries, rather than a number
- [ ] Handling queries with zero results
- [ ] Option of retrieving more than one page of hits for a query
- [ ] Option of retrieving just the top _n_ hits for a query