#1. How do you etract PM551A from the list below?
#Use more than one method.
student = list(name = "John", year = 2, classTaken = c("PM510", "PM551A", "PM511B"), GPA = 3.85)
student
student$classTaken[2]
student[[3]][2]

#2. Consider the following vector:
newclass = c("PM599", "PM512")
#create a vector, class1, by concatenating the newclass vector and the classTaken component from the student list.
class1 = c(newclass, student$classTaken)
class1 = c(newclass, student[[3]])

#3. Create a data frame named mygrade:
#first column is a numeric vector named year with values between 2001 and 2003.
#second column is the classTaken component from the student list
#third column is character vector, grade, with values A-, B, and A.
year = (2001:2003)
year
mode(year)
grade = c("A-", "B", "A")
grade
mode(grade)
mygrade = data.frame(year, student$classTaken, I(grade))
mygrade = data.frame(year = 2001:2003, classTaken = student$classTaken, grade = c("A-", "B", "A"))
mygrade

#4. Use an appropriate function to find out the names of the mygrade data frame.
#what type of object does this function return?
#character vector
colnames(mygrade)
names(mygrade)

#5. Create a data frame by extracting the year and grade column and 
#the first two rows of mygrade data frame.
mygrade2 = mygrade[1:2, c("year", "grade")]
mygrade2