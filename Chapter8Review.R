#Chapter 8 Review Problems
#1. Consider the simulated matrix, mat , with 10 rows and 20 columns.
set.seed(91765)
mat = matrix(rnorm(200), 10)
dim(mat)

#To calculate the variance of each row and to store it in the row.var vector, you can write the following loop: 
row.var = numeric(10)
for (i in 1:10) { 
  row.var[i]=var(mat[i,])
  }
row.var

#Instead of using the for loop, how can you modify the code above by using the apply function?
row.var = apply(mat, 1, var)

#2. Suppose that one of the elements in the matrix, mat , is missing. For example:
mat[1,1] = NA 

#To calculate the variance of each row, you need to set na.rm = T in the var function. For example:
row.var = numeric(10)
for (i in 1:10){
  row.var[i]=var(mat[i,],na.rm=T)
  }
row.var 

#Again, modify the loop above by using the apply function.
row.var = apply(mat, 1, var, na.rm=T)

#3. In Section 8.3.2 of the course reader, an example was presented to compare the difference for the 
#Composition , Drawing , Colour , and Expression variables across different levels in the School variables 
#by using the following code:
library(MASS)
r = apply(painters[,1:4], 2, function(x){
  lm(x~School,data=painters)
  }) 
r[[1]] #contains the result from the Composition variable

#To extract the coefficients from r[[1]] , you can write the following:
r_1.coeff = r[[1]]$coefficients
r_1.coeff
class(r_1.coeff)

#Notice that r_1.coeff is just a numeric vector. 
#Use an appropriate function to extract the coefficients from each component from the r object.
sapply(r, function(x) x$coefficients)

#4. Chapter 7 Review Problem 1 asked to create a variable DrawingCat with five approximate equal levels based 
# on the Drawing variable:
cutpt = quantile(painters$Drawing, seq(0, 1, by=0.2)
cutpt
painters$DrawingCat = cut(painters$Drawing, cutpt, labels=1:5, include.lowest=T)
table(painters$DrawingCat)

#To verify whether DrawingCat was created correctly, you need to calculate the minimum and maximum values of 
#the Drawing variables within each level of the DrawingCat variable. Now, use the tapply function to accomplish
#this task. Also try to use the split and apply functions to compare the difference with the result from using 
#the tapply function.
tapply(painters$Drawing, painters$DrawingCat, min)
tapply(painters$Drawing, painters$DrawingCat, max)

#An alternative approach
tapply(painters$Drawing, painters$DrawingCat, function(x) c(MIN=min(x), MAX=max(x)))

#Use sapply and split function
sapply(split(painters$Drawing, painters$DrawingCat, function(x) c(MIN=min(x), MAX=max(x))))