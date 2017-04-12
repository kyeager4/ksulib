#' Return the URL corresponding to a query using Kent State University Library's site search.
#'
#' @description
#' Returns URL corresponding to a chosen query string.
#' @param term character string containing search term
#' @param logical perform search on the production site? default is TRUE
#' @return
#' Character vector of search URLs.
#' @export
#' @examples
#' get_search_url("hours")
#' get_search_url("hours", production=FALSE)
get_search_url <- function(term="", production=TRUE) {
  if(term==""){
    warning("You must enter a non-empty query")
  }
  if(!is.character(term)){
    warning("Coercing to character")
    term <- as.character(term)
  }

  if(production)
    search_url_root <- "http://www.library.kent.edu/search/site/"
  else
    search_url_root <- "http://www-test.library.kent.edu/search/site/"

  solr_search_url <- paste0(search_url_root, url_escape(term))

  return(solr_search_url)
}
