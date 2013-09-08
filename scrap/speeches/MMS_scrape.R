#!/usr/bin/env Rscript
# R scraper to scrape data from pmindia.gov.in. 
# Author - Prahsanto 7-Sep-2013
# Modified - Dias L 7-Sep-2013

require(RCurl)

require(XML)

fileConn<-file("manspeech.txt")
corpus = c('');

#To be parameterized - Max Count, url

for(i in 1:1346)

{

url=paste("http://pmindia.gov.in/speech-details.php?nodeid=",i,sep="")

if(url.exists(url))

{

html <- getURL(url, followlocation = TRUE)

# parse html

doc = htmlParse(html, asText=TRUE);

plain.text <- xpathSApply(doc, "//p", xmlValue);

corpus[i]=paste(plain.text, collapse = "\n-------------------------------------------------------------------------------------------------");

}

}
writeLines(corpus, fileConn)
close(fileConn)

# Need to store the corpus in a File later extract and store in db.
# Also need to add date of retrieval
