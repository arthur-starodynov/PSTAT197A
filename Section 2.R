library(tidyverse)

# retrieve class survey data
url <- 'https://raw.githubusercontent.com/pstat197/pstat197a/main/materials/labs/lab2-tidyverse/data/'

background <- paste(url, 'background-clean.csv', sep = '') %>%
  read_csv()

interest <- paste(url, 'interest-clean.csv', sep = '') %>%
  read_csv()

metadata <- paste(url, 'survey-metadata.csv', sep = '') %>%
  read_csv()


background

background %>%
  filter(math.comf > 3)
background %>%
  select(math.comf)

background %>%
  pull(rsrch)

background %>%
  mutate(avg.comf = (math.comf + prog.comf + stat.comf)/3)

background %>%
  filter(stat.prof == 'Adv') %>%
  mutate(avg.comf = (math.comf + prog.comf + stat.comf)/3) %>%
  select(avg.comf, rsrch) 


background %>%
  filter(rsrch = TRUE)%>%
  select([11:29] == "yes")

background %>%
  group_by(math.comf, stat.comf, prog.comf) %>%
  summarize_all(.funs = median)

background %>% 
  group_by(updv.num)%>%
  group_by(math.comf, stat.comf, prog.comf) %>%
  summarize_all(.funs = median)


