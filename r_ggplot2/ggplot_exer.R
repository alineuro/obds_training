library(ggplot2)
ggplot(diamonds) # Only gives a gray box. As we haven't specified the data (x &Y)

#Specify x & y
ggplot(diamonds, aes(x = carat, y = price))
