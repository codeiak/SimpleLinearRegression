# Simple Linear Regression model

# Importing the data sets
dataset = read.csv('Salary_Data.csv')

# Splitting the data sets into training and testing sets
library(caTools)
set.seed(31)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
trainSet = subset(dataset, split == TRUE)
testSet = subset(dataset, split == FALSE)

# Fitting Simple linear Regression to the training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = trainSet)

# summary(regressor) will show you a summary if typed in the console window!

# Predicting the test set results
y_pred = predict(regressor, newdata = testSet)

# Visualizing the Training set result
#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = trainSet$YearsExperience, y = trainSet$Salary),
             color = 'red') +
  geom_line(aes(x = trainSet$YearsExperience, y = predict(regressor, newdata = trainSet)),
            color = 'purple') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of experience') +
  ylab('Salary')

ggplot() +
  geom_point(aes(x = testSet$YearsExperience, y = testSet$Salary),
             color = 'orange') +
  geom_line(aes(x = trainSet$YearsExperience, y = predict(regressor, newdata = trainSet)),
            color = 'green') +
  ggtitle('Salary vs Experience (Testing Set)') +
  xlab('Years of experience') +
  ylab('Salary')