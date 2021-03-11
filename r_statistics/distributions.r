
#Generate a vector of 1000 normally distributed values with mean 10 and SD5

norm_dist <- rnorm(1000, mean = 10, sd =5)
summary(norm_dist)

#Compute the mean and standard deviation
mean(norm_dist)
sd(norm_dist)

#COmpute the deciles 
quantile(norm_dist, probs = seq (0, 1, 0.1))

#Visualise the distribution of those values as a histogram.
# base r package for histograms is hist. Breaks=bins. 
hist(norm_dist, breaks = 20)

#Visualise as vertical lines on the histogram:
#the mean (red solid), median (red dashed), one standard
#deviation from the mean (blue solid), 
#and one median absolute deviation from the median (blue)
abline(v = mean(norm_dist), col= 'red')
abline(v = median(norm_dist), col= 'red',lty = 2 )
#One sd from the mean
abline(v = mean(norm_dist) + sd(norm_dist), col= 'blue')
abline(v = mean(norm_dist) - sd(norm_dist), col= 'blue')
#one median absolute deviation from the median
#This is the median difference betweem value and median
abline(v = median(norm_dist) + sd(norm_dist), col= 'blue', lty = 2)
abline(v = median(norm_dist) - sd(norm_dist), col= 'blue', lty = 2)

#Generate a new vector with a lot more values 
#(e.g., one million). Draw again a histogram. How does
#the distribution compare with more data points?
norm_dist_2 <- rnorm(1000000, mean = 10, sd =5)
hist(norm_dist_2, breaks = 50)

par(mfrow = c(2,1))
hist(norm_dist, breaks = 50)
hist(norm_dist_2, breaks = 50)
par(mfrow = c(1,1))

#Exercise 2
#1. Calculate the cumulative distribution between -5,5
q <- seq(-5,5, by = 0.1)
q
vector_probabilities <- pnorm(q, mean = 0, sd = 1)
plot(x = q, y = vector_probabilities)

# 2. Plot the inverse cumulative distribution function for quantiles in 0.01 increment
# i.e. we know which probabilities we want
p <- seq(0, 1, by = 0.01)
p
vector_values <- qnorm (p, mean = 0, sd = 1)
plot(x = p, y = vector_values)

# 3. Plot the density function in the range
vector_density <- dnorm (q, mean = 0, sd = 1) 
plot(x = q, y = vector_density)

# look for probability of value greater than 2
vector_probability_2 <- 1 - pnorm(2, mean = 0, sd = 1)
vector_probability_2

# What is the probability of observing a value between -2 and 2?
pnorm(2, mean = 0, sd = 1) - pnorm(-2, mean = 0, sd = 1)

#What is the probability of observing a value more extreme than -2 or 2?
1 - (pnorm(2, mean = 0, sd = 1) - pnorm(-2, mean = 0, sd = 1))
#1 is maximal probability.

#NEXT EXERCISE
#1. Use the ecdf() function to compute the empirical cumulative distribution function for the variable
#Sepal.Length in the iris data set.

iris
iris_ecdf <- ecdf(iris$Sepal.Length)
str(iris_ecdf)
plot(iris_ecdf)

#Unique values within the dataset
knots(iris_ecdf)
sort(unique(iris$Sepal.Length))

#TO observe a value of less than defined value (probability)
iris_ecdf(6)

##Exercise slide 31
# Use summary () function to view some info about each column
summary(iris)
# Visualise the distribution of Sepal.Length , stratied by species
iris
par(mfrow=c(2,2))
# how many pictures in a window
hist(iris[iris$Species == "setosa",]$Sepal.Length, breaks = 10, labels = FALSE, main = NULL, col = 'red')
hist(iris[iris$Species == 'versicolor',]$Sepal.Length, breaks = 10, labels = FALSE, main = NULL, col = 'green')
hist(iris[iris$Species == 'virginica',]$Sepal.Length, breaks = 10, labels = FALSE, main = NULL, col = 'blue')

par(mfrow=c(1,1))
plot.new()
plot.window(xlim =c(4,8), ylim = c(0,2))
plot(density(iris[iris$Species == 'setosa',]$Sepal.Length), col = 'red')
lines(density(iris[iris$Species == 'versicolor',]$Sepal.Length), col = 'green')
lines(density(iris[iris$Species == 'virginica',]$Sepal.Length), col = 'blue')
axis(side = 1, at = seq(4,8))
axis(side = 2, at = seq(0,2,0,2))

#Is sepal lentgh normally distributed
shapiro.test(iris$Sepal.Length)
shapiro.test(iris[iris$Species == 'setosa',]$Sepal.length)
shapiro.test(iris[iris$Species == 'versicolor',]$Sepal.length)
shapiro.test(iris[iris$Species == 'virginica',]$Sepal.length)
plot(density(iris$Sepal.Length))

#Is there a significant variation between species in sepall length
anova_iris <- aov(Sepal.Length ~ Species, data = iris)
summary(anova_iris)
kruskal.test(Sepal.Length ~ Species, data = iris)

#running a t test
#TukeyHSD(anova_iris) #automatic t test calculation
tukey_test <- TukeyHSD(anova_iris)
View(tukey_test$Species)

#Exercise: Testing and Multiple Test correction
#How to load data
#logcounts.csv
#cell_metadata.csv