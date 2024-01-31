
library(WGCNA)
library(readxl)
library(clusterProfiler)
library(dplyr)

library(sva)
library(EnhancedVolcano)
library(limma)
library(ggVennDiagram)
library(org.Hs.eg.db)
library(DT)
library(igraph)
datatable_jm<-function(x,column=NULL){
  
  # if(is.na(column)){column<-0}

datatable(
  x,
  extensions = 'Buttons', 
  filter = list(
    position = 'top', clear = T
  ),
  options = list(dom = 'Blfrtip',buttons = list(list(extend = 'colvis')),
                 buttons = list('copy', 'print',
                                list(extend = 'collection',
                                     buttons = c('csv', 'excel', 'pdf'),
                                     text = 'Download')),
                 columnDefs = list(list(visible=FALSE, targets=column))))}






