#Q1
#i. Create three vectors “name”, “height” and “weight” with the records (values) as shown
#below:
#ii. Create a data frame “class” with the above vectors.
#creating 3 vectors
name <- c('a','b','c','d','e')
height <- c(58,62,67,55,63)
weight <- c(158,162,167,155,163)
print(name)
print(height)
print(weight)
#combining 3 vectors into one data frame
Data<- list(name=name,
            height=height,
            weight=weight)
class <- as.data.frame(as.data.frame(do.call(cbind, Data)) )
print(class)
#Q2
#Load “cars” data (which is by default in R) and calculate:
#i. Calculate the correlation coefficient value of ‘speed’ and ‘dist’
#ii. Show the correlation matrix of ‘speed’ and ‘dist’
data(cars)
# Print the first 6 rows
head(cars, 6)
#Calculate the correlation coefficient value of ‘speed’ and ‘dist’
speed=cars$speed
dist=cars$dist
cor(speed,dist)
#Show the correlation matrix of ‘speed’ and ‘dist’
cor_mat = cor(cars)
print(cor_mat)
#Q3
#Load “iris” data (which is by default in R) and perform following tasks:
#i. Show the 3 rd column only
#ii. Show first 3 columns of the 4 th row
#iii. Show last 6 rows
#iv. Save “Sepal.Length” variable as a vector named as “slength”
#v. Trim the length of the “slength” vector as 10 (records)
#vi. Calculate the average of “slength”
data(iris)
head(iris ,5)
#i. Show the 3 rd column only
print(iris[c(3),c(1,2,3,4,5)])
#ii. Show first 3 columns of the 4 th row
print(iris[c(4),c(1,2,3)])
#iii. Show last 6 rows
tail(iris,6)
#iv. Save “Sepal.Length” variable as a vector named as “slength”
slength=c(iris$Sepal.Length)
print(slength)
#v. Trim the length of the “slength” vector as 10 (records)
strtrim(slength, 10)
#vi. Calculate the average of “slength”
mean(slength)

#Q4. Use “iris” data to draw the following graphs:
#i. Draw a Bar plot with “Species” variable.
#Label X axis as ‘Species’ and Y axis as ‘Frequency’. Give chart title as ‘Bar plot for
#species’. And give different colors for the bars.
#ii. Draw a Pie chart with “Species” variable.
#Give chart title as ‘Pie chart for species’. And give different colors for the pies.
#iii. Draw a multiple correlation plot (pairs plot) for four variables ‘Sepal.Length’,
#‘Sepal.Width’, ‘Petal.Length’ and ‘Petal.Width’ of the “iris” data.
data(iris)

#i. Draw a Bar plot with “Species” variable.
#Label X axis as ‘Species’ and Y axis as ‘Frequency’. Give chart title as ‘Bar plot for
#species’. And give different colors for the bars.
head(iris,3)
pie(table(iris$Species), main = "Pie chart for species", radius = 1)
pairs(iris[,1:4],col="blue",main="Correlation Plot")
barplot(c(iris$Species), xlab = "Species", ylab = "Frequency", main ="Bar plot for species")

#Q5
#Run a simple liner regression on “cars” data. ‘dist’ is the dependent variable and ‘speed’ as
#independent variable. Save the regression model in a named object “car.linreg” and
#show the summary statistics of the model.
#i. Give the R-square and adjusted R-square values.
#ii. Looking at the p-value, is the model significant?

data(cars)
car.linreg <- lm(cars$dist~cars$speed)
print(car.linreg)
summary(car.linreg)