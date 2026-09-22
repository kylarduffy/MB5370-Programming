#------------------------------------#
# MB5370: Techniques in Marine Science 1
# Programming Fundamentals
# Kylar Duffy
# 16/09/2026
#------------------------------------#

# Workshop 02. Visualisation ####
# Turning data into graphics with code ####
library(tidyverse)
mpg #view ggplot example dataset, displ = engine size of the cars in litres, hwy = car's fuel efficiency in miles per gallon (mpg)
?mpg # more info on the dataset
# First plot, size of engine (displ) on x axis and fuel effieiciency (hwy) on y axis
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
# ggplot() starts a plot then data = creates empty graph, then complete your graph by adding more layers
# geom_point() adds a layer of points to the plot, mapping arguments are always paired with aes() and x and y arguments specify the variables

# Understand the 'grammar of graphics' ####
# Best way to use ggplots is to use a template, always call ggplot, offer data and provide a geom function. 
#ggplot(data = <DATA>) +
#  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>)) # you can slowly add complexity as you develop more advanced visualisations
ggplot() # without data argument the plot window is empty
ggplot(data = mpg)
# Aesthetic mappings
# you can add a third variable such as class by mapping it to an aesthetic represented as aes()
# an aesthetic is a visual property of the objects plotted; size, shape, colour
# to associate the name of the aesthetic to the name of the variable inside aes()
# ggplot2 will automatically assign a unique level of the aesthetic to each unique value of the variable
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))
# we mapped class to colour but can map to the size aesthetic in same way
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class)) # using size for a discrete variable is not advised
# change point transparency by class (alpha)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
# change point shape by class
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
# can also set these properties manually 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), colour = "blue")
# range of manual aesthetics you can set to manually alter the appearance of your plot; name of a colour as a character string, size of a point in mm, shape of a point as a number
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = displ < 5))

# Troubleshooting ####
# It’s very common for data scientists or analysts to have to keep testing and trying.
# common error with ggplot the + must go at the end of the line

# Facet and panel plots ####
# Common practice with sceintific lit is to have many sub plots (panels), to show a subset of your data
# in ggplot use facets, facet_wrap(), ~ dictates which variable you want to subset your data with
# only use facet_wrap() for discrete variables
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~class, nrow = 2)
# if you want to do with more than one variable then use facet_grid(), you need two variables using ~ to split them up
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)
# use a . if you dont want to facet in the rows or column dimension
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
?facet_wrap
# nrow & ncol is number of rows and columns

# Fitting simple lines ####
# Use a variety of visual objects to represent your data
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) # geom_point() for data displayed as points
# ggplot can use a variety of geom objects to represent the data; bar plots, line charts, boxplots etc
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy)) # geom_smooth() for smooth line fit through the points
# you cant also change the line type and can use a variable to control it
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv)) # seperate the line into three based on their drv (front wheel, rear wheel, 4wd)
# you can change colour too
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, colour = drv))
# if you want to group objects by a categorical variable (species or sex or site)
# use the group argument to show our data is in fact grouped 
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))
# change colour of each line using drv value
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, colour = drv), 
  show.legend = FALSE,)
# multiple geoms on a single plot
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
# same exact plot as above but more efficient!!!!!!!
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()
# use mappings in specific layers to enable the display of different aesthetics in different layers
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(colour = class)) + 
  geom_smooth()
# same if you want to specify different data for each layer, use (class = "subcompact") to select a subset of the data and plot only that subset
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(colour = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)
# filter() only shows a small subset of the dataset

# Transformations and Stats ####
# Easy transformations and data summaries using another dataset
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))
ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut)) # can use geom and stat interchangeably
# overriding the defaults
demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)
demo

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")
# can also override default mapping from transformed variables to aesthetics
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1)) # display a bar chart of the proportion of your total diamond dataset rather than a count
# show more about these transformations using stat_summary()
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )
# way to boost the way you can convey information with plots using ggplot2 is to use aethetics like colour or fill
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))
# now colour clarity
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))
# ability to make position adjustments is vital, allows you to customise your plots in three ways; identity (raw data), fill (changes heights) and dodge (which forces ggplot2 to not put things on top of each other)
# position = "identity" will be able to place each object exactly where it falls in the context of the graph
# to alter transparency (alpha)
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")
# to colour the bar outlines with no fill color
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")
# position = "fill" works like stacking
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")
# position = "dodge" places overlapping objects directly beside one another
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")
# jitter slightly moves points so you can see them all 
# position = "jitter" adds a small amount of random noise to each point to avoid overplotting when points overlap






                            
