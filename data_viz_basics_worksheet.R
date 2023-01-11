############################################################################################
#### DATA VIZ BASICS WITH R AND GGPLOT2                                                 ####
#### ==================================                                                 ####
#### This worksheet contains an incomplete version of the code presented in the lesson. ####
#### Fill in all ... with code.                                                         ####
############################################################################################
############################################################################################


# Load packages and data

library(ggplot2)

WHR <- read.csv('https://github.com/qdread/data-viz-basics/raw/main/datasets/WHR_2015.csv')
cereal <- read.csv('https://github.com/qdread/data-viz-basics/raw/main/datasets/cereal.csv')
olympics <- read.csv('https://github.com/qdread/data-viz-basics/raw/main/datasets/olympics.csv')

# My first ggplot

...(data = ...)

ggplot(data = WHR, aes(x = ..., ...))

ggplot(data = WHR, aes(x = GDP.per.Capita, y = Happiness.Score)) + ...

ggplot(data = WHR, aes(x = GDP.per.Capita, y = Happiness.Score)) + ...

# Trendline

ggplot(data = WHR, aes(x = GDP.per.Capita, y = Happiness.Score)) + 
  ... +
  ...

ggplot(data = WHR, aes(x = GDP.per.Capita, y = Happiness.Score)) + 
  geom_point() +
  geom_smooth(..., ...)

ggplot(data = WHR, aes(x = GDP.per.Capita, y = Happiness.Score, ...)) + 
  geom_point() +
  geom_smooth(method = lm, se = FALSE)

ggplot(data = WHR, aes(x = GDP.per.Capita, y = Happiness.Score)) + 
  geom_point(aes(...)) +
  geom_smooth(method = lm, se = FALSE)

ggplot(data = WHR, aes(x = GDP.per.Capita, y = Happiness.Score)) + 
  geom_point(aes(color = Continent), ...) +
  geom_smooth(method = lm, se = FALSE, ...)

# Themes

... <- ggplot(data = WHR, aes(x = GDP.per.Capita, y = Happiness.Score)) + 
  geom_point(aes(color = Continent), size = 2) +
  geom_smooth(method = lm, se = FALSE, color = 'black')

happy_gdp_plot + ...

theme_set(theme_bw())

happy_gdp_plot <- happy_gdp_plot +
  theme(panel.grid = ...,
        legend.position = ...,
        axis.text = element_text(...),
        axis.title = element_text(...))

happy_gdp_plot

# Scales 

happy_gdp_plot +
  scale_x_continuous(... = 'GDP per capita', ... = c(0, 0.25, 0.5, 0.75, 1, 1.25, 1.5))

happy_gdp_plot +
  scale_x_continuous(name = 'GDP per capita', breaks = c(0, 0.25, 0.5, 0.75, 1, 1.25, 1.5)) +
  scale_y_continuous(name = ..., limits = ...)

happy_gdp_plot +
  scale_x_continuous(name = 'GDP per capita', breaks = c(0, 0.25, 0.5, 0.75, 1, 1.25, 1.5)) +
  scale_y_continuous(name = 'happiness score', limits = c(2, 8)) +
  scale_color_viridis_d()

# Boxplots

ggplot(data = WHR, aes(...)) +
  ...()


ggplot(data = WHR, aes(x = Continent, y = Happiness.Score)) +
  geom_boxplot(... = 'forestgreen', ... = 'gray25', ... = 1.5)

ggplot(data = WHR, aes(x = Continent, y = Happiness.Score)) +
  geom_boxplot(fill = 'forestgreen', color = 'gray25', size = 1.5,
               ...) 

# Histograms

ggplot(data = cereal, aes(...)) +
  ...()

ggplot(data = cereal, aes(x = sugars)) +
  geom_histogram(...)

ggplot(data = cereal, aes(x = sugars)) +
  geom_histogram(bins = 10) +
  ...(expand = expansion(add = c(0, 1)))

sugar_hist <- ggplot(data = cereal, aes(x = sugars)) +
  geom_histogram(bins = 10, ...) +
  scale_y_continuous(expand = expansion(add = c(0, 1))) +
  ggtitle('Distribution of grams of sugar per serving', 'for 77 brands of breakfast cereal')

sugar_hist

sugar_hist +
  ...(x = 'sugar (g/serving)')

# Density plots

ggplot(data = cereal, aes(x = ...)) +
  ...()

ggplot(data = cereal, aes(x = calories)) +
  stat_density(...)

ggplot(data = cereal, aes(x = calories)) +
  stat_density(adjust = 2, ...)


ggplot(data = cereal, aes(x = calories)) +
  stat_density(adjust = 2, geom = 'line', ... = 1.2, color = 'forestgreen') +
  ...(... = ...(... = c(0, 0.02))) +
  ...(... = expansion(mult = c(0, 0)), name = 'calories per serving') +
  ...('Distribution of calories per serving', 'for 77 brands of breakfast cereal')

# Faceted bar plot

olympics_best <- subset(olympics, Country %in% c('USA', 'GBR', 'URS', 'JAM'))

ggplot(olympics_best, ...) +
  geom_bar(...)

ggplot(olympics_best, aes(x = Medal)) +
  geom_bar(stat = 'count') +
  ...(~ ...)

ggplot(olympics_best, aes(x = Medal)) +
  geom_bar(stat = 'count') +
  facet_wrap(~ Country, scales = ...)

ggplot(olympics_best, aes(x = Medal)) +
  geom_bar(stat = 'count') +
  ...(..., scales = 'free_y')

olympics_best$Medal <- factor(olympics_best$Medal, levels = c('Bronze', 'Silver', 'Gold'))

ggplot(olympics_best, aes(x = Medal)) +
  geom_bar(stat = 'count') +
  facet_grid(Country ~ Gender, scales = 'free_y')

ggplot(olympics_best, aes(x = Medal, fill = Medal)) +
  geom_bar(stat = 'count') +
  facet_grid(Country ~ Gender, scales = 'free_y') +
  ...('Track and field medal tallies for selected countries, 1896-2014', ... = 'data source: The Guardian') +
  ...(expand = expansion(add = c(0, 2))) +
  ...(... = c(Bronze = 'chocolate4', Silver = 'gray60', Gold = 'goldenrod')) +
  theme(legend.position = 'none',
        strip.background = element_blank(),
        panel.grid = element_blank())

# Writing ggplots to files

ggsave('~/plots/sugar_histogram.png', sugar_hist)
ggsave('~/plots/sugar_histogram.png', sugar_hist, dpi = 400, height = 4, width = 4)
ggsave('~/plots/sugar_histogram.png', sugar_hist, dpi = 400, height = 9, width = 9, units = 'cm')
ggsave('~/plots/sugar_histogram.pdf', sugar_hist, height = 4, width = 4)
ggsave('~/plots/my_plot.pdf', height = 4, width = 4)


# Extension packages (example code not covered in detail in the lesson)

library(ggthemes)

sugar_hist + theme_economist()
sugar_hist + theme_fivethirtyeight()
sugar_hist + theme_tufte()

library(gghighlight)

ggplot(data = WHR, aes(x = GDP.per.Capita, y = Happiness.Score)) + 
  geom_point() +
  gghighlight(Happiness.Score < 3 | Happiness.Score > 7.55, label_key = Country, label_params = list(size = 5))

library(ggpubr)

ggboxplot(data = WHR, x = 'Continent', y = 'Happiness.Score', color = 'Continent', add = 'jitter',
          palette = unname(palette.colors(4)), 
          ylab = 'Happiness Score', ylim = c(2.5, 8.5)) +
  geom_bracket(xmin = 'Europe', xmax = 'Africa', label = '*', y.position = 8.3, label.size = 8) +
  geom_bracket(xmin = 'Americas', xmax = 'Africa', label = '*', y.position = 7.7, label.size = 8)

