library(rpart)
library(rpart.plot)
s <- sample(800, 400)
titanic_train <- train[s[1:200], ]
titanic_test <- train[s[201:400], ]
dtm <- rpart(Survived ~ Sex + Age + Pclass, titanic_train, method = "class")
rpart.plot(dtm)
titanic_pred <- predict(dtm, titanic_test, type = "class")
table(titanic_test[, 2], titanic_pred)
table <- table(titanic_test[, 2], titanic_pred)
accuracy <- sum(diag(table)) / sum(table)
accuracy
