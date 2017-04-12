#' Retrieve the first page of search results for a given query.
#' @description
#' Retrieves the HTML contents from the first page of search hits for a given query.
#' @param term character string containing search term
#' @param production (logical) perform search on the production site? default is TRUE
#' @return
#' List containing the following elements:
#' - html xml_node containing the search result page's HTML
#' - search_url character string displaying the query URL
#' @details
#' When using the test server (www-test.library.kent.edu), needed to
#' modify approach because of the SSL certificate.
#' - http://stackoverflow.com/questions/34551299/how-to-pass-ssl-verifypeer-in-rvest
#' - https://curl.haxx.se/docs/sslcerts.html
#' @export
get_search_contents <- function(solr_search_term, production=TRUE) {

  solr_search_url <- get_search_url(solr_search_term, production=production)

  if(!production){
    retrieved <- read_html(content(GET(solr_search_url,
                                       config=config(ssl_verifypeer=0L,
                                                     ssl_verifyhost=0L)),
                                   as="text"))
  }
  else{
    retrieved <- read_html(solr_search_url)
  }
  return(list(html = retrieved, search_url = solr_search_url))
}

