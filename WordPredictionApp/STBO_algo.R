
library(RSQLite)
library(tm)
library(stringr)

##Stupid Backoff algorithim from Brants et al. is used as predction model
stbo<- function(entertext, db){
  text<-tolower(entertext)%>%
 removePunctuation %>%
 removeNumbers %>%
 stripWhitespace %>%
 str_trim %>%
 strsplit(split=" ")%>% 
unlist
  
  ##maximum = 2
  for (cNum in min(length(text), maximum):1){
    gettext<- paste(tail(text, cNum), collapse=" ")
  
  ##search through ngramsstorage.db for word 
    sql<-paste("SELECT word, frequency FROM NGram WHERE ", 
               "prediction=='", paste(gettext), "'", 
               " AND number==", cNum + 1, 
               " LIMIT 3", sep="")
  ##and get results
    result<-dbSendQuery(conn=db, sql)
    predicted<-dbFetch(result, n=-1)
    
    #predicted word output
    if(nrow(predicted)> 0) 
      return(predicted) 
    }
##for no predictions
return("Please try again")
}