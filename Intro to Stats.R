# Intro to Stats - MSMI Bootcamp
# Lucas De Oliveira

# Install required packages
install.packages("ggplot2")

# Load required packages
library(ggplot2)

# The heights of adult men in the United States are approximately 
# normally distributed with a mean of 70 inches and a 
# standard deviation of 3 inches.
male.height <- rnorm(150e6, mean=70, sd=3)
male.height
# Heights of adult women are approximately normally distributed with 
# a mean of 64.5 inches and a standard deviation of 2.5 inches.
female.height <- rnorm(150e6, mean=64.5, sd=2.5)
female.height

# Get descriptive statistics of male height
summary(male.height)

# Histogram of male height
hist(male.height)

# Plot male and female heights
male.sample = sample(male.height, size=1000)
female.sample = sample(female.height, size=1000)
heights <- data.frame(dens = c(male.sample, female.sample), 
                     category = rep(c("Male", "Female"), each = 1000))
ggplot(heights, aes(x = dens, fill = category)) + geom_density(alpha = 0.5)

# Visualizing mean and standard deviation
# Create data
high.mean = rnorm(1e3, mean=10, sd=1)
low.mean = rnorm(1e3, mean=5, sd=1)
dat <- data.frame(dens = c(high.mean, low.mean), 
                  lines = rep(c("High mean", "Low mean"), each = 1000))
# Plot
ggplot(dat, aes(x = dens, fill = lines)) + geom_density(alpha = 0.5)

# Difference in variance
high.std = rnorm(1e3, mean=5, sd=2)
low.std = rnorm(1e3, mean=5, sd=1)
dat <- data.frame(dens = c(high.std, low.std), 
                  lines = rep(c("High variance", "Low variance"), each = 1000))
# Plot
ggplot(dat, aes(x = dens, fill = lines)) + geom_density(alpha = 0.5)


# Look at the effect of sample size
# Take a sample from population of size 10
male.sample = sample(male.height, size=10)
# Plot a histogram
hist(male.sample)
# Use summary() to get min, q1, med, mean, q3, and max
summary(male.sample)

# Repeat for a sample of size 100
male.sample = sample(male.height, size=100)
hist(male.sample)
summary(male.sample)

# Repeat for a sample of size 1000
male.sample = sample(male.height, size=1000)
hist(male.sample)
summary(male.sample)



# CLT EXAMPLES -------------------------------
# Ex 1: sampling from a lognormal distribution

# Simulate a lognormal population with 10,000 observations
lognorm.pop = exp(rnorm(1e4))
hist(lognorm.pop)
summary(lognorm.pop)

# Sample 10 observations and plot
lognorm.10 = sample(lognorm.pop, size=10)
hist(lognorm.10)
summary(lognorm.10)

# Sample 100 observations and plot
lognorm.100 = sample(lognorm.pop, size=100)
hist(lognorm.100)
summary(lognorm.100)

# Calculate 100 sample means when sample size is 10
samp.means = c()
for (i in 1:100) {
  lognorm.samp = sample(lognorm.pop, size=10)
  samp.means = c(samp.means, mean(lognorm.samp))
}
hist(samp.means)
summary(samp.means)

# Calculate 100 sample means when sample size is 100
samp.means = c()
for (i in 1:100) {
  lognorm.samp = sample(lognorm.pop, size=100)
  samp.means = c(samp.means, mean(lognorm.samp))
}
hist(samp.means)
summary(samp.means)


# Ex 2: sampling from a uniform distribution
# Simulate 100 dice rolls
dice.1 <- sample(1:6, size=100, replace=TRUE)
hist(dice.1, breaks=6)
mean(dice.1)

dice.2 <- sample(1:6, size=100, replace=TRUE)
hist(dice.2, breaks=6)
mean(dice.2)

# Add dice rolls together and plot histogram
dice.add <- dice.1 + dice.2
hist(dice.add)

# Uniform dist mean: dice rolls
mean(1:6)

# Repeat loop for dice experiment
dice.10k <- sample(1:6, size=1e4, replace=TRUE)
dice.means = c()
for (i in 1:100) {
  dice.samp = sample(dice.10k, size=100)
  dice.means = c(dice.means, mean(dice.samp))
}
hist(dice.means)
summary(dice.means)

