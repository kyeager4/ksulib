#' Get first page of search hits for a search term.
#' @description
#' aaa
#' @param query character vector of search terms
#' @return
#' Data frame containing the URLs and description excerpts for the first page of search hits.
#'

extract_result_list <- function(htm_input){
  rvest::html_nodes(htm_input, css="ol.search-results")
}

extract_search_result <- function(htm_input){
  rvest::html_nodes(htm_input, css="li.search-result")
  #rvest::html_nodes(htm_input, xpath='//li[@class="search-result"]')
}

extract_search_title <- function(htm_input){
  rvest::html_nodes(htm_input, xpath='//h3[@class="title"]') %>%
    rvest::html_text()
}

extract_search_href <- function(htm_input){
  rvest::html_nodes(htm_input, xpath='//h3[@class="title"]/a') %>%
    rvest::html_attr(., "href")
}

extract_search_snippet_p <- function(htm_input) {
  rvest::html_nodes(htm_input, xpath='//p[@class="search-snippet"]')
  # %>%
  #   rvest::html_text()
}

extract_search_snippet_url <- function(htm_input) {
  rvest::html_nodes(htm_input, xpath='//span[@class="search-snippet-url"]') %>%
    rvest::html_text()
}

extract_pagination <- function(htm_input){
  rvest::html_nodes(htm_input, css="*.pagination")
  #rvest::html_nodes(htm_input, xpath='//*[@class="pagination"]')
}

