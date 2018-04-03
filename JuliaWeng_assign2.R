##
## Julia Weng U07487022
## Assignment 2
##


##
## Problem 1:
## 
extreme = function(numbers){
  count = 0
  upperbound = mean(numbers) + 3*sd(numbers)
  lowerbound = mean(numbers) - 3*sd(numbers)
  for (i in numbers){
    if (i < lowerbound || i > upperbound){
      count = count + 1
    }
  }
  if (count > 0){
    print(paste("There are ", count, " extreme value(s) found.", sep=""))
  } else{
      print("There are no extreme values.")
  }
}

test = rnorm(1000)
extreme(test)


##
## Problem 2:
## 
calCS = function(type, r){
  answer = 0
  type = toupper(type)
  if (type == "AC") answer = pi * r^2
  else if (type == "CC") answer = 2 * pi * r
  else if (type == "VC") answer = (4/3) * pi * r^3
  else if (type == "AS") answer = 4 * pi * r^2
  else stop ("Your method is not supported")
  return (answer)
}


##
## Problem 3:
##
for (r in c(5, 10, 15, 20, 25)){
  print (calCS("AC", r))
}


##
## Problem 4:
##
library(MASS)

subset(painters, Colour >= 17 & School == "D")

painters[c("Da Udine", "Barocci"),]

subset(painters, Colour >= 17 & School == "D", select = c(Composition, Drawing))

cutpt = quantile(painters$Composition, seq(0, 1, by=1/3))
painters$Comp.cat = cut(painters$Composition, cutpt, labels = 1:3, include.lowest = T)

##
## Problem 5:
##
Program = c("CONT", "RI", "WI")
s1 = c(85, 79, 84)
s2 = c(85, 79, 85)
s3 = c(86, 79, 84)
s4 = c(85, 80, 83)

wide = data.frame(I(Program), s1, s2, s3, s4)

long = reshape(wide, varying = list(c("s1", "s2", "s3", "s4")), v.names = "s", timevar = "Time", idvar = "Program", direction = "long")


##
## Problem 6:
##
stackDataInList = function(alist){
  data = data.frame()
  for (i in 1:length(alist)){
    data = rbind(data, alist[[i]])
  }
  return (data)
}

#run tests
load("/Users/julweng/Google Drive/IntroR/datList.RData")
stackDataInList(datList[1])
stackDataInList(datList[c(1,3,4)])
stackDataInList(datList)