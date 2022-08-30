
```{r}
PE08 <- read_excel(path = "Data/Export.xlsx")
PE08

SH7 <- read_csv2(file="Data/Data-SH7.csv")
SH7 <- SH7 %>% separate(col="Call ID", into=c("ERC","Year","Type") , sep="-")

SH7 <- SH7 %>% arrange(desc(Year))
names(SH7)

names(SH7)[3] <- "title"
names(SH7)[4] <- "abstract"
View(SH7)

write_csv(SH7 %>% select(`Project acronym`:title, abstract),
          file="Data/SH7-Screening.csv")

test <- read_csv(file="Data/SH7-Screening.csv")
```

```{r}
SH7 <- read_csv2(file="Data/Data-SH2.csv")
SH7 <- SH7 %>% separate(col="Call ID", into=c("ERC","Year","Type") , sep="-")

SH7 <- SH7 %>% arrange(desc(Year))
names(SH7)

names(SH7)[3] <- "title"
names(SH7)[4] <- "abstract"
View(SH7)

#write_csv(SH7 %>% select(`Project acronym`:title, abstract),
#                         file="Data/SH7-Screening.csv")

test <- read_csv(file="Data/SH7-Screening.csv")
```



```{r , include = FALSE, echo=FALSE, message=FALSE, eval=FALSE}
library(revtools)  # https://revtools.net/data.html#accepted-formats
# Initial database SCOPUS
data_initial <- read_bibliography("Data/SH7-Screening.csv")

# Screening App
screen_abstracts(data_initial)


```




```{r load, include=FALSE}
Data <- read_csv2(file="Data/Data-SH2.csv")
Data <- Data %>% separate(col="Call ID", into=c("ERC","Year","Type") , sep="-")

Data <- Data %>% arrange(desc(Year))

names(Data)[2] <- "acronym"
names(Data)[3] <- "title"
names(Data)[4] <- "abstract"
#View(Data)
#names(Data)
```

# Projects ERC 2012 -2022 Panel SH2




```{r, eval=TRUE, include=TRUE}

Data <- Data %>% select(acronym, title, abstract, Year)
Data <- Data %>% mutate(ID = paste(acronym,title, sep = '\n\n' )) %>% select(ID, abstract, Year)

#Data$acronym = cell_spec(Data$acronym, angle = 90)

kable(Data,
      #format    = "latex", 
      #escape = F,
      longtable = T, 
      booktabs  = T, 
      caption   = "ERC Abstracts") %>%  
   kable_paper("striped",full_width = F) %>%
   #column_spec(1, bold = T, border_right = T, latex_column_spec = ">{\\\\tiny}p{5em}") %>%
   column_spec(1, border_right = T,width = "8em") %>% 
   column_spec(2, border_right = T, width = "60em") %>% 
   row_spec(c(1:201), hline_after = T)


```

