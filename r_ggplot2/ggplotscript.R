#Initialise an renv environment
###renv::init() 

#install packages into the environment
###renv::install('ggplot2')

#Save the state of an environment. Snapshot looks at the package library and updates the logfile. 
renv::snapshot()

library(ggplot2)
renv::snapshot()

# ggplot
# We will use R markdown today
# Describe tidy data
# Setup project environment (above)

iris

library(ggplot2)
plot1 <- ggplot(iris, aes(x = Sepal.Length)) +
    geom_histogram(fill = "grey", color = "black") +
    labs(title = "Histogram of sepal lengths", y = "Frequency", x = "Sepal length") +
    theme(text = element_text(size = 16))
print(plot1) 

library(ggplot2)
