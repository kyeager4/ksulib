#' Get first page of search hits for a search term.
#' @description
#' aaa
#' @param nodelist xml node where direct children are all li.search-result elements
#' @return
#' Data frame containing the title text, actual link, search description, and displayed URL.
#' @details
#' - Need to handle situation when there are no hits for a search.
result_dataframe <- function(nodelist){

  ## works - gets h3 a text and href
  piece1 <- lapply(nodelist, function(x){
    rvest::html_nodes(x, "a") %>%
    {data.frame(link_title = html_text(.),
                link_href = html_attr(., "href"),
                stringsAsFactors=FALSE)}
  }) %>% bind_rows(.id="row")

  ## works - extracts search-snippet-info div and
  piece2 <- nodelist %>%
    rvest::html_nodes(., "div.search-snippet-info") %>%
    lapply(., extract_children_generic) %>%
    bind_rows(.id="row")

  ## works - merge together
  hits <- left_join(piece1, piece2, by="row") %>%
    mutate(class = html_attr(nodelist, "class")) %>%
    rename(snippet_desc = p,
           snippet_url = span,
           hit_order = row)

  return(hits)
}
