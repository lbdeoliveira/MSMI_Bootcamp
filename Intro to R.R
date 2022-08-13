# R Script for MSMI Bootcamp
# Introduction to R
# Author: Lucas De Oliveira
# Lecture date: Aug 13, 2022


# First program: 
print("Hello, world!")

# Assigns text to variable msg
msg = "Hello, world!"
print(msg)

# Reassign text to variable msg
msg <- "Hola, mundo!"
print(msg)

# Pop quiz 1: what is the value of msg at the print statement?
msg <- "Good morning everyone"
msg <- "It's nice to be here!"
msg <- "Who wants some coffee?"
print(msg)

# Assign number 1 variable num
num = 1
print(num)

# Add 1 to existing value of num and reassign to num
num = num + 1
print(num)

# Pop quiz question #2: what is the value of num at the print statement?
num = 1
num = num * 2
num = num + 8
num = num / 2
print(num)

# Character data type
msg = "This is in fact text data. In R it's called character data. How nice!"
class(msg)

# Numeric data type
pi = 3.14
class(pi)

# Integer data type
my.int = 3
class(my.int)

# How to declare integer type
# option 1:
my.int = 3
my.int = as.integer(my.int)   # convert to integer
print(class(my.int))

# option 2:
my.int = 3L
print(class(my.int))

# Logical data type
true = TRUE
class(true)

# Pop quiz: guess the value of a, b, c, and d:
a = 3 < 4
b = 5 >= 8
c = "a" == "a"
d = "a" != "b"
print(paste('a:', a))
print(paste('b:', b))
print(paste('c:', c))
print(paste('d:', d))


# Vectors
num.vec <- c(1, 2, 3)
print(class(num.vec))
print(num.vec)

# Vectors when we try to pass elements of different data types
my.vec <- c(1, 2, 'a')
print(class(my.vec))
print(my.vec)

# Vector of sequential integers shortcut
sequential.vec <- 1:10
print(class(sequential.vec))
print(sequential.vec)

# Accessing elements in an vector
# Define and print vector
my.vec <- 1:10
print(my.vec)

# Extract and print first item in vector
first = my.vec[1]
print('First item:')
print(first)
print(my.vec[1])

# Print 8th item in vector
print('8th item:')
print(my.vec[8])

# Slice vector
# Take 3rd through 6th elements of vector
three.thru.six <- my.vec[2:6]
print(three.thru.six)


### Converting Data Types
# `as.integer()`
# `as.numeric()`
# `as.character()`
# `as.Date()`
# There are many more such functions. For now, be aware that they exist and that they come in handy! 
  
# Mathematical Operations
# `+` - addition
# `-` - subtraction
# `*` - multiplication 
# `/` - division
# `^` - exponentiation

# Ungrouped calculation
print(3 + 3 * 2)

# Grouped calculation
print((3 + 3) * 2)

### Logical Operations
# Comparing two values:
# `==` - equals
# `!=` - does not equal
# `<` - less than
# `<=` - less than or equal to
# `>` - greater than
# `>=` - greater than or equal to
# `&` - and
# `|` - or
# `%in%` - in


# Logical operation example
x = 5
print(x > 3)
print(x != 4)
print((x > 3) & (x < 4))
print((x > 3) | (x < 4))

# Logical operations on vectors
print(c(1, 2, 3) >= c(3, 2, 1))

# Define the function
add.one <- function(x) {
  return(x+1)
}

# Example
x = 5
y = add.one(x)

# Print results
print(x)
print(y)

# Using built-in mean() function:
x = c(1, 2, 3)
print(mean(x))

# Checking your working directory
getwd()

# Changing/setting your working directory
# absolute_path = "/Users/lucasdeoliveira/Documents/MSMI_Bootcamp/data"
relative_path = './data'
setwd(relative_path)
getwd() # print working directory
setwd('..')  # go "up" a folder in the directory (previous folder)

# Reading in CSV file
iris.data = read.csv("data/iris.csv")

# Display first 6 rows of data
head(iris.data)

# Display last 6 rows of data
tail(iris.data)

# Creating a data frame manually
ex.df = data.frame(name=c("Betty", "Harry", "Susie", "Barry"),
                   fav.food=c("Eggs", "Dairy", "Limes", "Berries"),
                   age=c(14, 40, 24, 60))
print(ex.df)

# Check dimensions (number of rows, number of columns) of data frame
print(nrow(iris.data))
print(ncol(iris.data))

# Extracting column names
iris.names <- names(iris.data)
print(iris.names)

# Extracting columns
iris.variety <- iris.data$variety
print(iris.variety)

# Subsetting multiple columns
cols.of.interest = c("petal.length", "petal.width", "variety")
iris.subset <- iris.data[cols.of.interest]
head(iris.subset)


# Selecting rows
iris.virginica <- subset(iris.data,
                         variety == "Virginica")
head(iris.virginica)
tail(iris.virginica)


# Subset on multiple filtering conditions
iris.subset <- subset(iris.data,
                      (variety == "Virginica") & (petal.length >= 6))
head(iris.subset)
tail(iris.subset)


# Subsetting both rows and columns simultaneously
iris.subset <- subset(iris.data,
                      (variety == "Virginica") & (petal.width < 2), 
                      select = c("petal.length", "petal.width", "variety"))
head(iris.subset)


# Create a new variable called `petal.width.mean` that contains 
# the average value of the `petal.width` column.
iris.data$petal.width.mean <- mean(iris.data$petal.width)
print(head(iris.data))


# Create a column called `sepal.minus.petal` that is defined as 
# the `sepal.length` minus the `petal.length`.
iris.data$sepal.minus.petal <- iris.data$sepal.length - iris.data$petal.length
head(iris.data)


# Mean-center the `petal.length` column; that is, define a new column called 
# `petal.length.centered` that is defined as `petal.length` minus the mean 
# of all values in the `petal.length` column
mean.petal.length <- mean(iris.data$petal.length)
iris.data$petal.length.centered <- iris.data$petal.length - mean.petal.length
head(iris.data)


# Saving a data frame to a CSV File
write.csv(ex.df, "data/example_df.csv", row.names=FALSE)


# Exercises

# 1. Load the `cars.csv` file found in the data folder into a data frame variable called `cars`.
# 2. Inspect the first 6 rows of the `cars` data frame. What is the third value under the column `cyl`?
# 3. Reassign the variable `cars` to a data frame containing all rows and columns of the `cars` data frame **except for** for the `model` column.
# 4. Using only one line of code, print the value of the 12th observation in the `cyl` column.
# 5. Calculate the mean of the `mpg` column. Print it out.
# 6. Create a new column called `mpg.centered` which is a mean-centered version of the `mpg` column.
# 7. Subset the data frame for observations where the mpg is above the mean. 
# 8. Repeat **7** but only return the `mpg`, `cyl`, `hp`, and `wt` columns.
# 9. Repeat **8** but include the additional filtering condition that `hp` must be greater than or equal to 100. Save this subset to a variable called `vroom_vroom`.
# 10. Write the data frame `vroom_vroom` to a CSV file with a name of your choosing.


