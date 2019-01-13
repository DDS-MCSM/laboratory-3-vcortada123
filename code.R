#******************************************************************************#
#                                                                              #
#                    Lab 3 - Data Acquisition & Analysis                       #
#                                                                              #
#                     Víctor Cortada - Data Driven Securty                     #
#                                                                              #
#******************************************************************************#


if(!require("xml2")){
  install.packages("xml2")
  library("xml2")
}

if(!require("httr")){
  install.packages("httr")
  library("httr")
}

if(!require("rvest")){
  install.packages("rvest")
  library("rvest")
}

## Crawling y Scrapping

### 1.1 Obtención de la página web

get_web <- function(){
url_wiki <- "https://www.mediawiki.org/wiki/MediaWiki"
tmp <- read_html(url_wiki)
return(tmp)
}


### 1.2 Analisis de el contenido de la web

get_title <- function(c)
{
  page_title <- html_node(c, xpath = '//title')
  title <- html_text(page_title)
  return(title)
}

get_charset <- function()
{
  url.wiki <- "https://www.mediawiki.org/wiki/MediaWiki"
  charset <- charset(url.wiki)
  return(charset)
}


### 1.3.	Extracción de enlaces


get_link <- function(link){
  
  page <- content(link, "text", encoding = "ISO-8859-1")
  parse <- read_html(page)
  link <- xml_find_all(parse, "//@href") 
  link <- xml_text(link)
  df <- data.frame(url=character(), status=integer(), stringsAsFactors = F)
  df_list <- list()
  
}


### 1.4 Exploración de enlaces

get_explore_data <- function(link){
  for (it in link){
    df_list()
    htt_t <- select(it, "http")
    if(htt_t == T){
      s = HEAD(it)
      s = status_code(st)
      print(it)
      df_list <- c(df_list, it)
      df_list <- c(df_list, s = st)
      df[nrow(df)+1,] = df_list
    }
  }
      
}

### Gráficos en R

### 2.1 Histograma

hist(df$st)

### 2.2 Un gráfico de barras

barplot(df,col=c("blue"))

### 2.3 Pie Chart

pie(df, col = rainbow(length(x))) legend("topright", cex = 0.8, fill = rainbow(length(x)))
