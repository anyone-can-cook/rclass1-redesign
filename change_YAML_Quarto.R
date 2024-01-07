#Script to programmatically change YAML headers of R class 1 from beamer presentation to HTML output

#load libraries
library(tidyverse)
library(markdown)
library(fs)

#Create YAML header template as string
#The YAML header from the original lecture files is longer than this one 
#Because strings have to be same length, I am adding extra spaces as a workaround
yaml <- '---
title: ""
author: ""
date: ""
format: html
toc: true
toc-depth: 2
toc-location: left
number-sections: true
editor: visual
---












'

#set directory path to rmd files
#manually added .Rmd lecture files to the updated_lectures folder, however each .Rmd file has an associated folder
dir_path <- "lectures/updated_lectures"

#get name of rmd files
rmd_files <- list.files(dir_path, pattern = "\\.Rmd$", full.names = TRUE)


for (file_path in rmd_files) {
  # Read the .Rmd file
  rmd_content <- readLines(file_path, warn = FALSE)
  
  # Find the position of the existing YAML header
  yaml_dash <- grep("^-{3}", rmd_content)
  
  if (length(yaml_dash) >= 2) {
    # Replace the existing YAML header with the new YAML header
    rmd_content[yaml_dash[1]:yaml_dash[2]] <- strsplit(yaml, "\n")[[1]]
    
    # Save the modified content back to the file
    writeLines(rmd_content, con = file_path)
    cat("Modified:", file_path, "\n")
    
  } else {
    cat("No YAML header found in", file_path, "\n")
  }
  
}

#change R Markdown to Quarto .qmd extension

qmd_files <- str_replace(string = rmd_files,
                         pattern = "Rmd",
                         replacement = "qmd")


file_move(path = rmd_files,
          new_path = qmd_files)


#link to chatgot prompt that helped me with script:
#https://chat.openai.com/c/5978abeb-c3a8-4455-8b3a-03d79102ebd2