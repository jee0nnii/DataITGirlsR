library(caret)
setwd("C:/Users/Lucy Kim/Documents/dataitgirls/ml02")

dataurl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data"
download.file(url = dataurl, destfile = "wine.data")
wine_df <- read.csv("wine.data", header = FALSE)
str(wine_df)

set.seed(3033)
intrain <- createDataPartition(y = wine_df$V1, p=0.7, list = FALSE)
training <- wine_df[intrain,]
testing <- wine_df[-intrain,]

dim(training)
dim(testing)

anyNA(wine_df)
#false면 missing이 하나도 없는겅
summary(wine_df)

training[["V1"]] = factor(training[["V1"]])
?trainControl
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
#repeatedcv : 반복교차검증

set.seed(3333) #왜 또 다시할까?
knn_fit <- train(V1 ~., data = training, method = "knn",
                 trControl=trctrl,
                 preProcess = c("center", "scale"),
                 tuneLength = 10)
#preprocess : 사전 처리

knn_fit
# k-Nearest Neighbors 
# 
# 125 samples
# 13 predictor
# 3 classes: '1', '2', '3' 
# 
# Pre-processing:
#   centered (13), scaled (13) 
# Resampling: Cross-Validated (10 fold, repeated 3 times) 
# Summary of sample sizes: 113, 114, 111, 113, 112, 112, ... 
# Resampling results across tuning parameters:
#   
#   k   Accuracy   Kappa    
# 5  0.9627511  0.9436722
# 7  0.9435204  0.9148116
# 9  0.9490759  0.9230590
# 11  0.9495421  0.9237385
# 13  0.9465507  0.9194040
# 15  0.9521062  0.9276424
# 17  0.9548840  0.9318090
# 19  0.9493284  0.9233699
# 21  0.9574481  0.9356161
# 23  0.9490759  0.9231172
# 
# Accuracy was used to
# model using  the
# largest value.
# The final value used for
# the model was k = 5.
# k값이 5로 훈련됨
plot(knn_fit)

test_pred <- predict(knn_fit, newdata = testing)
test_pred

confusionMatrix(test_pred, testing$V1)
Confusion Matrix and Statistics

Reference
Prediction  1  2  3
1 15  0  0
2  0 24  0
3  0  0 14

Overall Statistics

Accuracy :
  95% CI :
  No Information Rate :
  P-Value [Acc > NIR] :
  
  Kappa :
  Mcnemar's Test P-Value :

1          
(0.9328, 1)
0.4528     
< 2.2e-16  

1          
NA         

Statistics by Class:

Class: 1
Sensitivity             1.000
Specificity             1.000
Pos Pred Value          1.000
Neg Pred Value          1.000
Prevalence              0.283
Detection Rate          0.283
Detection Prevalence    0.283
Balanced Accuracy       1.000
Class: 2
Sensitivity            1.0000
Specificity            1.0000
Pos Pred Value         1.0000
Neg Pred Value         1.0000
Prevalence             0.4528
Detection Rate         0.4528
Detection Prevalence   0.4528
Balanced Accuracy      1.0000
Class: 3
Sensitivity            1.0000
Specificity            1.0000
Pos Pred Value         1.0000
Neg Pred Value         1.0000
Prevalence             0.2642
Detection Rate         0.2642
Detection Prevalence   0.2642
Balanced Accuracy      1.0000
> confusionMatrix(test_pred, testing$V1)
# Confusion Matrix and Statistics
# 
# Reference
# Prediction  1  2  3
# 1 15  0  0
# 2  0 24  0
# 3  0  0 14
# 
# Overall Statistics
# 
# Accuracy : 1          
# 95% CI : (0.9328, 1)
# No Information Rate : 0.4528     
# P-Value [Acc > NIR] : < 2.2e-16  
# 
# Kappa : 1          
# Mcnemar's Test P-Value : NA         
# 
# Statistics by Class:
#   
#   Class: 1 Class: 2 Class: 3
# Sensitivity             1.000   1.0000   1.0000
# Specificity             1.000   1.0000   1.0000
# Pos Pred Value          1.000   1.0000   1.0000
# Neg Pred Value          1.000   1.0000   1.0000
# Prevalence              0.283   0.4528   0.2642
# Detection Rate          0.283   0.4528   0.2642
# Detection Prevalence    0.283   0.4528   0.2642
# Balanced Accuracy       1.000   1.0000   1.0000


