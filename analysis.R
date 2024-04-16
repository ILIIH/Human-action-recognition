# Load necessary libraries
library(caret)
library(e1071)

# Load the dataset
data <- read.csv("path_to_your_dataset.csv")

# Split data into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(data$activity, p = .8, list = FALSE)
training <- data[trainIndex, ]
testing <- data[-trainIndex, ]

# Define the training control
ctrl <- trainControl(method = "cv", number = 5)

# Train the model
model <- train(activity ~ ., data = training, method = "svmRadial", trControl = ctrl)

# Make predictions on the testing set
predictions <- predict(model, newdata = testing)

# Evaluate the model
confusionMatrix(predictions, testing$activity)
