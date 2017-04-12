#' Given search query, return how many pages of search results there are
#' @param htm_input xml node containing the original html content of the page
#' @details
#' - The "page" query parameter isn't used on the first page of hits -- this means that page 2 of hits uses the query parameter ?page=1. So need to increment this number by 1.
#' - Need to handle situation when there are no hits for a search.
#' - Need to handle situation when there is only one page of hits for a search.
#' @export
count_pages <- function(htm_input){
  extract_pagination(htm_input) %>%
    rvest::html_nodes(., css="li.last>a") %>%
    html_attr(., "href") %>%
    stri_extract_last_regex(., "(?<=\\?page=)[0-9]+$") %>%
    as.numeric()
}
