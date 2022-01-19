# choose a draft year and summarize draft numbers for the two halves of the year
# https://stat-jet-asu.github.io/Datasets/InstructorDescriptions/vietnamdraft.html
# created: 2022-01-12
# updated: 2022-01-12
# changes: ---

library(tidyverse)

draft <- read_csv("https://raw.githubusercontent.com/STAT-JET-ASU/Datasets/master/Instructor/vietnamdraft.csv")

# --- choose a draft year (1970 through 1976) ---

year <- 1970

# -----------------------------------------------

# subset the data for the selected year

draft_sub <- draft %>%
  filter(draftyear == year, !is.na(draftnumber))

# -----------------------------------------------

# summarize and visualize draft numbers

draft_sub %>%
  group_by(halfyear) %>%
  summarize(
    n = n(),
    xbar = mean(draftnumber),
    s = sd(draftnumber),
    prop = mean(draftnumber <= 195)
  )

ggplot(draft_sub, aes(x = draftnumber, y = halfyear)) +
  geom_boxplot()

ggplot(draft_sub, aes(x = draftnumber)) +
  geom_histogram(bins = 10) +
  facet_grid(halfyear ~ .)
