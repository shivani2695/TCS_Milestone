#Write your code here
install.packages("tidyverse")
library(readr)
library(dplyr)
fda <- read_csv("fda.csv")
str(fda)

after2005 <- fda %>%
	filter(issued >= "2005-01-01") %>%
	arrange(issued)

count_letters <- fda %>%
	mutate(year = format(issued, "%Y")) %>%
	group_by(year) %>%
	summarize(letters=n())