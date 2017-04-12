#' Test of one or more search queries on either the live site or test site.
#' @description
#' Run a test of one or more search queries, using either the live (production) site or the test server.
#' @param term character vector containing search terms
#' @param production (logical) perform search on the production site? default is TRUE
#' @return
#' Dataframe containing the first page of hits for each search query.
#' @export
run_ksu_search <- function(search_terms, production=TRUE){
  results <- lapply(search_terms,
                    function(x){get_search_contents(x, production=production)$html}) %>%
    lapply(., extract_result_list) %>%
    lapply(., extract_search_result) %>%
    lapply(., result_dataframe) %>%
    bind_rows(.id="term")

  return(results)
}
