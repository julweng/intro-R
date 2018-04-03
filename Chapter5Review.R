library(MASS)
head(painters)

#1. Write a function called mean.sd to calculate the mean and standard deviation of a 
# numeric variable. The first argument, dat ,is the name of the data frame. The second 
# argument, varname, is the name of the numeric variable. The mean.sd function returns 
# a numeric vector of length of 2. The first component of the returned vector is the 
# calculated mean; the second component is the calculated standard deviation. 
# For example, here’re the results if you call the mean.sd function. 
# > mean.sd(painters, "Composition") 
# [1]11.555556 4.087102
# > mean.sd(painters, "Drawing") 
# [1]12.462963 3.457084

mean.sd = function(dat, varname){
  c(mean(dat[[varname]]), sd(dat[[varname]]))
}

#2. Modify the mean.sd function by adding the following: If the second argument varname 
# is not found in the given data, write an error message like No such variable . 
# Hint: use the is.element function If the given variable is not a numeric variable, write 
# a message like The variable must be numeric . For example, here are the results if you 
# call the modified mean.sd function. 
# > mean.sd(painters, "Compositio") 
# Error in mean.sd(painters, "Compositio") : No such variable. 
# > mean.sd(painters, "School") 
# Error in mean.sd(painters, "School") : The variable must be numeric. 
# > mean.sd(painters, "Composition") 
# [1]11.555556 4.087102
mean.sd = function(dat, varname){
  if (!is.element(varname, colnames(dat)))
    stop ("No such variable.")
  if (!is.numeric(dat[[varname]]))
    stop ("The variable must be numeric.")
  c(mean(dat[[varname]]), sd(dat[[varname]]))
}

#3. You can use the rbind function to combine two vectors of the same length into a matrix. 
# For example: 
# > r1 = mean.sd(painters, "Composition") 
# > r2 = mean.sd(painters, "Drawing") 
# > rbind(r1, r2) 
#       [,1] [,2] 
# r1 11.55556 4.087102 
# r2 12.46296 3.457084 

# Write a function, mean.sd.table , to calculate the mean and standard deviation of one or 
# more given variables. The first argument, dat , is the name of the data frame. The second 
# argument, varlist , is a vector of names of numeric variables. For example, here are the 
# results if you call the modified mean.sd.table function. 
# > mean.sd.table(painters, "Composition") 
#               mean       sd 
# Composition 11.55556 4.087102

# > mean.sd.table(painters, c("Composition", "Drawing")) 
#               mean       sd 
# Composition 11.55556 4.087102 
# Drawing     12.462963.457084
mean.sd.table = function(dat, varlist){
  r = mean.sd(dat, varlist[[1]])
  if(length(varlist) == 1){
    r = matrix(r, nrow = T)
    } else{
    for(i in 2:length(varlist)){
      row = mean.sd(dat, varlist[[i]])
      r = rbind(r, row)
    }
    rownames(r) = varlist
    colnames(r) = c("mean", "sd")
    return(r)
    }
}
    
    