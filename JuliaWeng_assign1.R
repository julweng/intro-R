##
## Julia Weng U07487022
## Assignment 1
##


##
## Problem 1 Q1:
## 
a = seq(from=2, to=10, by=1)
b = seq (from=15, to=3, by=-3)
d = rep(a, 2)
e = rep(b, c(5:1))

##
## Problem 1 Q2:
##
sum(d == 5)
any(e < 1)
sum(c(a, b) > 9)
f = c(1, 4, 5, 9, -1, NA, 2, NA, 3, NA, 9, 3)
sum(is.na(f))
sum(f, na.rm=TRUE)


##
## Problem 2 Q1:
##
x1 = matrix(rnorm(20), nrow=4, ncol=5)
x2 = rnorm(20)
dim(x2) = c(4, 5)
smallx = x1[2:4, c(1, 5)]
dim(smallx)
as.vector(smallx)


##
## Problem 3 Q1:
##
name = c("Alfred", "Barbara", "John", "Kerry")
sex = c("M", "F", "M", "F")
age = c(23, 35, 25, 19)
height = c(72, 61, NA, 66)
weight = c(160.3, 125.4, 175.0, 130.2)
smoke = c("TRUE", NA, "FALSE", "FALSE")
names(age) = name
names(weight) = name
names(weight[weight > 150])

example.list = list(name = name, sex = sex, age = age, height = height, weight = weight, smoke = smoke)
bmi = list(100*weight/height^2)
example.list = c(example.list, bmi = bmi)
small.list = list(example.list$name, example.list$sex)
example.data = data.frame(example.list)
female = data.frame(name = example.data$name[example.data$sex=="F"], sex = example.data$sex[example.data$sex=="F"], age = example.data$age[example.data$sex=="F"])
names(female) = c("f.name", "f.sex", "f.age")
rownames(female) = c("A01", "A02")