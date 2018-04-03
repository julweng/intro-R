#chapter 7 review problems
#1. We will use the painters data frame in the MASS package for the following exercises. 
#Create a data set which contains observations with Composition >=5 and Drawing <=15 , 
#but only with the Expression and School variables. 
library(MASS)
head(painters)

data1 = painters[painters$Composition >= 5 & painters$Drawing <= 15, c("Expression", "School")]
data2 = subset(painters, Composition >= 5 & Drawing <= 15, select = c("Expression", "School"))

#Create a variable DrawingCat with five approximate equal levels based on the Drawing 
#variable.
cutpt = quantile(painters$Drawing, seq(0, 1, by=0.2))
DrawingCat = cut(painters$Drawing, cutpt, labels = 1:5, include.lowest = T)

#2. You will work with the data frame, hdl , which is stored in hdl.RDatafile.
#The data frame records the hdl level of multiple visits to a clinic for 100 
#patients. Here are the first 6 observations of the data:
selectVisit = function(dat, choice){
  datSort = dat[order(dat[,1], dat[, 2], dat[, 3],]
  if (choice == "first"){
    result = datSort[!duplicated(datSort[,1]),]
  } else if (choice == "last"){
    dupID = unique(datSort$patient[duplicated(datSort$patient)])
    result = datSort[!is.element(datSort$patient, dupID), ]
  } else if (choice =="multiple"){
    dupID = unique(datSort$patient[duplicated(datSort$patient)])
    result = 
  }
  }
  }
}