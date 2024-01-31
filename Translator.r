# -*- Author: Ali -*-
# -*- Info: Google Translate API Wrapper -*-

library(httr)

translate_text <- function(text, source_lang, target_lang) {
  url <- paste0("https://translate.googleapis.com/translate_a/single?client=gtx&sl=",
                source_lang, "&tl=", target_lang, "&dt=t&q=", URLencode(text))
  
  response <- GET(url)
  translation <- content(response, "text")
  
  return(translation)
}

cat("Enter the text you want to translate: ")
source_text <- readline(prompt = "")
cat("Enter the source language (e.g., en): ")
source_lang <- readline(prompt = "")
cat("Enter the target language (e.g., es): ")
target_lang <- readline(prompt = "")

translated_text <- translate_text(source_text, source_lang, target_lang)
cat("Translated Text:", translated_text, "\n")
