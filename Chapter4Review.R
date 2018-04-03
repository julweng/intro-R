# 1. Consider the following vector
Q1 = c(3, NA, 7, 6, 4) 
# Create a vector b1 from Q1 by keeping values greater than 4 
b1 = Q1[Q1 > 4 & !is.na(Q1)]
# Create a vector b2 from Q1 by keeping values greater than 4 as well as missing values
b2 = Q1[Q1 > 4 | is.na(Q1)]

# 2. Consider the following vector 
Q2 = c(1:10, rep(1, 3), 2 * 3, pi, sqrt(10)) 
# Without knowing the total number of elements in Q2 , 
# how would you extract the last two elements from Q2 ?
Q2a = Q2[c((length(Q2)-1):length(Q2))]

# 3. Consider the following vector
Q3 = 1:6
names(Q3) = c("A", "b", "d", "C", "Z", "m") 
# How would you extract the element of Q3 with names equal 
# to upper case letters? 
# Hint: LETTERS will generate upper case letters from A to Z.
Q3[is.element(names(Q3), LETTERS)]
#4 Consider the following matrix
Q4 = matrix(c(1:4, NA, 10:4), nrow = 3)
dimnames(Q4) = list(letters[1:3], LETTERS[1:4])
# create a 1-by-2 matrix, A4, by extracting Q4 with 
# rownames equaling c, and colnames equaling C or D
A4 = Q4[rownames(Q4)=="c", is.element(colnames(Q4), c("C","D")), drop = F]

