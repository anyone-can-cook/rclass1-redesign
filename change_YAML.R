#Script to programmatically change YAML headers of R class 1 from beamer presentation to HTML output

#load libraries
library(tidyverse)

#Create YAML header template as string

yaml <- '---
title: ""
author: 
date: 
urlcolor: blue
output: 
  html_document:
    toc: true
    toc_depth: 2
    toc_float: true # toc_float option to float the table of contents to the left of the main document content. floating table of contents will always be visible even when the document is scrolled
      #collapsed: false # collapsed (defaults to TRUE) controls whether the TOC appears with only the top-level (e.g., H2) headers. If collapsed initially, the TOC is automatically expanded inline when necessary
      #smooth_scroll: true # smooth_scroll (defaults to TRUE) controls whether page scrolls are animated when TOC items are navigated to via mouse clicks
    number_sections: true
    fig_caption: true # ? this option doesnt seem to be working for figure inserted below outside of r code chunk    
    highlight: tango # Supported styles include "default", "tango", "pygments", "kate", "monochrome", "espresso", "zenburn", and "haddock" (specify null to prevent syntax    
    theme: default # theme specifies the Bootstrap theme to use for the page. Valid themes include default, cerulean, journal, flatly, readable, spacelab, united, cosmo, lumen, paper, sandstone, simplex, and yeti.
    df_print: tibble #options: default, tibble, paged

---'

#set directory path to rmd files
dir_path <- "lectures/updated_lectures"

#list all lectures in the lectures folder
rmd_files <- list.files(dir_path, pattern="\\.Rmd$", full.names = TRUE)

for (file_path in rmd_files) {
  # Read the .Rmd file
  rmd_content <- readLines(file_path, warn = FALSE)
  
  # Find the position of the existing YAML header
  yaml_start <- grep("^---", rmd_content)
  yaml_end <- grep("---$", rmd_content)
  
  if (length(yaml_start) == 2 && length(yaml_end) >= 2) {
    # Replace the existing YAML header with the new YAML header
    rmd_content[yaml_start[1]:yaml_end[2]] <- strsplit(yaml, "\n")[[1]]
    
    # Save the modified content back to the file
    writeLines(rmd_content, con = file_path)
    cat("Modified:", file_path, "\n")
  } else {
    cat("No YAML header found in", file_path, "\n")
  }
}


#link to chatgot prompt that helped me with script:
#https://chat.openai.com/c/5978abeb-c3a8-4455-8b3a-03d79102ebd2