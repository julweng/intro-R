#1. What is the name of the function to find out the arguments of a function?
args()

#2. How does one convert the following vector to a 2 by 2 matrix?
Q2 = 1:4
matrix(Q2, nrow=2)

#3.  Create a vector from the following matrix, using more than one method 
Q3 = matrix(1:6, nrow=2)
A3 = as.vector(Q3)
A3 = as.numeric(Q3)

A3 = Q3
attributes(A3) = NULL

A3 = Q3
dim(A3) = NULL

#4. What function can you use to examine whether the Q3 matrix (from problem 3) is numeric?
is.numeric(Q3)
mode(Q3)

#5. What functions can be used to examine the dimension of Q3 (from problem 3)?
dim(Q3)
attributes(Q3)

#6. 6. Calculate the mean of the following vector: 
Q6 = c(1, 3, NA, 7)
mean(Q6, na.rm=T)

#7. Consider the following vector. What is the length of this vector? 
# Use two methods to access the third and first component of vector Q7
Q7 = c(1:3,7:10)
names(Q7)=letters[1:7]
length(Q7)
Q7[c(3,1)]
Q7[c("c","a")]

#8. How does one remove the names attribute from vector Q7 ?
names(Q7) = NULL
as.vector(Q7)

#9. How does one generate the following result by using the rep function?
#[1] "D" "D" "D" "D" "C" "C" "C" "B" "B" "A"
rep(c("D", "C", "B", "A"), 4:1)
rep(LETTERS[4:1], 4:1)

#10. In Chapter 2, in order to count the number of elements in g greater than the average of g , we used the following command:
g = c(seq(1,6, by=0.5), 10) 
# sum(g > mean(g)) 
# [1] 5
#The command sum(g > mean(g)) can be written as three separate commands. 
#What are these three commands?
mean.g = mean(g)
logical.vector = g > mean.g
sum(logical.vector)

#11.The any function below examined whether at least one element of vector f contains 3.001. 
# Instead of using the any function, what alternative method can you use to examine whether at least one element of vector f contains 3.001?
f = c(3.01, 3.001, 3.0001, 3.00001) 
any(f == 3.001)

sum(f == 3.001) > 0

#12. Similarly, the all function below examined whether all the element of vector f are great than 3. 
# Instead of using the all function, what alternative method can you use to perform the same task?
all(f>3)
sum(f>3) == length(f)

#13. Create a factor A13 by converting the following character vector. 
#Use an appropriate function to find out the number of levels of A13 . 
#What attributes does A13 have?
q13 = c(rep("male", 3), rep("female",2))
A13 = as.factor(q13)
A13 = factor(q13)
nlevels(A13)
attributes(A13)

#14. Consider the following vector q14. 
q14 = c(12, 3, 5, NA, 5, 7)
#Create a 2 by 3 matrix A14 by using q14.Fill the matrix by row. 
A14 = matrix(q14, 2, 3, byrow = T)
#Create a 2 by 2 matrix A14a by extracting the first and third columns of A14.
A14a = A14[, c(1,3)]
#find out the dimension for A14a
dim(A14a)
#what attributes does A14 have?
attributes(A14)