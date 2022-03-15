library(tidyverse)
library(ggimage)

batman <- tibble(actor = c(
  "Christian Bale",
  "Christian Bale",
  "Christian Bale",
  "Christian Bale",
  "Christian Bale",
  "Christian Bale",
  "Christian Bale",
  "Christian Bale",
  "Christian Bale",
  "Christian Bale",
  "Christian Bale",
  "Christian Bale",
  "Christian Bale",
  "Christian Bale",
  "Christian Bale",
  "Christian Bale",
  "Michael Keaton",
  "Michael Keaton",
  "Michael Keaton",
  "George Clooney",
  "I have no opinion.",
  "I have no opinion.",
  "I have no opinion.",
  "I have no opinion.",
  "I have no opinion.",
  "Adam West",
  "Adam West",
  "Adam West",
  "Robert Pattinson"
)) %>%
  mutate(
    actor = factor(actor,
      levels = c(
        "Adam West",
        "Christian Bale",
        "George Clooney",
        "Michael Keaton",
        "Robert Pattinson",
        "I have no opinion."
      )
    ),
    actor2 = case_when(
      actor == "Christian Bale" ~ "Christian Bale",
      actor == "I have no opinion." ~ "I have no opinion.",
      TRUE ~ "Not Christian Bale"
    ),
    actor2 = factor(actor2,
      levels = c(
        "Christian Bale",
        "Not Christian Bale",
        "I have no opinion."
      )
    )
  )

ggplot(batman, aes(x = actor2, fill = actor)) +
  geom_bar(color = "black") +
  scale_fill_manual(values = c(
    "yellow",
    "black",
    "yellow3",
    "gold",
    "gold3",
    "gray"
  )) +
  scale_y_continuous(breaks = seq(from = 0, to = 20, by = 2)) +
  geom_image(aes(
    image = "https://stat-jet-asu.github.io/Moodlepics/batman_logo.png",
    x = "Christian Bale",
    y = 12
  ),
  size = 0.25
  ) +
  annotate(
    geom = "text",
    x = "Not Christian Bale",
    y = c(0.5, 2.5, 4.5, 6.5),
    label = c(
      "Robert Pattinson",
      "Michael Keaton",
      "George Clooney",
      "Adam West"
    )
  ) +
  labs(
    title = "Who is the best Batman?",
    subtitle = "According to a recent class poll",
    x = NULL,
    y = "number of votes",
    fill = "Batman Portrayer"
  ) +
  theme_linedraw() +
  theme(
    axis.text.x = element_text(size = 12),
    axis.title.y = element_text(size = 12)
  )
