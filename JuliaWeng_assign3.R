##
## Julia Weng U07487022
## Assignment 3
##


##
## Problem 1:
## 

# read in chol.txt
chol = read.table(file = "/Users/julweng/Google Drive/IntroR/chol.txt", header = TRUE)
# check data
str(chol)
apply(chol, 2, function(x) any(is.na(chol)))

# apply mean to each column, exclude "sex"
apply(subset(chol, select = -sex), 2, mean, na.rm = T)
# aggregate for sex-specific means 
aggregate(subset(chol, select = -sex), list(chol$sex), mean, na.rm = T)

# chol2 variable
chol.mean = mean(chol$chol, na.rm = T)
chol$chol2 = ifelse(chol$chol > chol.mean, "Hi", "LOW")
# check result
head(chol)
# tapply sd to bmi for each chol2 category
tapply(chol$bmi, chol$chol2, sd, na.rm = T)
# tapply sd to bmi for each chol2-sex combo
tapply(chol$bmi, list(chol$chol2, chol$sex), sd, na.rm = T)


##
## Problem 2:
##
# simulated matrix
set.seed(91765)
mat = matrix(rnorm(200), 10)
mat[1,1] = NA
dim(mat)

# row median 
# for loop approach
row.med = numeric(10)
for(i in 1:nrow(mat)){
  row.med[i]= median(mat[i,], na.rm = T)
}
row.med
# apply approach
row.med2 = apply(mat, 1, median, na.rm = T)
row.med2


##
## Problem 3:
## 

# row-wise t-test
rowTtest = function(data, group){
  p = apply(data, 1, function(x){t.test(x~group)$p.value})
  data = cbind(data, p)
  return(subset(data, p < 0.05/length(p), select = -p))
}
  
# simulated data
set.seed(123)
gene = matrix(rnorm(20000), nrow = 1000, ncol = 20)
rownames(gene) = paste0("G", seq(1:1000))
pheno = c(rep("case", 10), rep("control", 10))
gene[1:10, 1:10] = gene[1:10, 1:10] + 4
# check gene
head(gene)

# run test
rowTtest(gene, pheno)


##
## Problem 4:
## 

# t.test chol 
output = apply(chol[,2:12], 2, function(x){t.test(x~sex, data = chol)})
# check output
output$age
# get t.test result names
names(output$age)

# sapply to reutrn specific results by name, transpose 
result = t(sapply(output, function(x){
  c(F.mean = x$estimate[1], 
    M.mean = x$estimate[2], 
    t = x$statistic, 
    df = x$parameter, 
    p = x$p.value)
}))

# label columns
col.label = c("F.mean", "M.mean", "t", "df", "p")
colnames(result) = col.label 
result
