#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly=TRUE)
if (length(args) < 1) stop("Must provide a project path.")
project_path <- args[[1]]
project_name <- base::basename(project_path)
dir.create(project_path, showWarnings=FALSE)
dir.create(file.path(project_path, "data"), showWarnings=FALSE)
dir.create(file.path(project_path, "data-raw"), showWarnings=FALSE)
dir.create(file.path(project_path, "code"), showWarnings=FALSE)

project_file <- 
"Version: 1.0

RestoreWorkspace: Default
SaveWorkspace: Default
AlwaysSaveHistory: Default

EnableCodeIndexing: Yes
UseSpacesForTab: Yes
NumSpacesForTab: 4
Encoding: UTF-8

RnwWeave: Sweave
LaTeX: pdfLaTeX"

write(project_file, file.path(project_path, paste0(project_name, ".Rproj")), sep="")
suppressPackageStartupMessages(library(renv))
renv::activate(project=project_path)

# Install bioconductor
install.packages("BiocManager")
suppressPackageStartupMessages(library(BiocManager))
BiocManager::install()

# Install tidyverse
install.packages("tidyverse")
