#' For a given html node, extract the names and text values of its children.
#' @description
#' aaa
#' @param x xml_node with name/text to extract
#' @return
#' Data frame with one column per html element.
extract_children_generic <- function(x){
  data.frame(varname = html_name(xml_children(x)),
             valname = html_text(xml_children(x)),
             stringsAsFactors=FALSE) %>%
    spread(varname, valname)
}
