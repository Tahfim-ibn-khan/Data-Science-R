install.packages("dplyr")
install.packages("tibble")
install.packages("ggplot2")
install.packages("ROSE")

library(dplyr)
library(tibble)
library(ggplot2)
library(ROSE)

titanic_Dataset <- read.csv("/Users/tahfimibnkhan/Desktop/Midterm_Project_Dataset_section(B).csv")
str(titanic_Dataset)
colSums(is.na(titanic_Dataset))

titanic_Dataset$Gender[titanic_Dataset$Gender == ""] <- NA

titanic_Dataset$fare <- as.numeric(titanic_Dataset$fare)

titanic_Dataset$embarked[titanic_Dataset$embarked == ""] <- NA

titanic_Dataset$class[titanic_Dataset$class == ""] <- NA

titanic_Dataset$who[titanic_Dataset$who == ""] <- NA
colSums(is.na(titanic_Dataset))


count_nas <- function(row) {
  sum(is.na(row))
}
titanic_Dataset <- titanic_Dataset[apply(titanic_Dataset, 1, count_nas) <= 2, ]
colSums(is.na(titanic_Dataset))

replace_na_with_mean <- function(x) {
  replace(x, is.na(x), mean(x, na.rm = TRUE))
}

replace_na_with_mode <- function(x) {
  replace(x, is.na(x), names(sort(table(x), decreasing = TRUE))[1])
}

titanic_Dataset$age <- replace_na_with_mean(titanic_Dataset$age)
titanic_Dataset$fare <- replace_na_with_mean(titanic_Dataset$fare)
titanic_Dataset$sibsp <- replace_na_with_mean(titanic_Dataset$sibsp)
titanic_Dataset$parch <- replace_na_with_mean(titanic_Dataset$parch)

titanic_Dataset$Gender <- replace_na_with_mode(titanic_Dataset$Gender)
titanic_Dataset$embarked <- replace_na_with_mode(titanic_Dataset$embarked)
titanic_Dataset$class <- replace_na_with_mode(titanic_Dataset$class)
titanic_Dataset$who <- replace_na_with_mode(titanic_Dataset$who)
titanic_Dataset$alone <- replace_na_with_mode(titanic_Dataset$alone)

colSums(is.na(titanic_Dataset))

unique(titanic_Dataset$who)
titanic_Dataset <- titanic_Dataset %>%
  mutate(who = recode(who, "mannn" = "man"))
unique(titanic_Dataset$who)

unique(titanic_Dataset$Gender)
titanic_Dataset$Gender <- factor(titanic_Dataset$Gender, 
                  levels = c("female", "male"),
                  labels = c(1,2))

unique(titanic_Dataset$embarked)
titanic_Dataset$embarked <- factor(titanic_Dataset$embarked, 
                                 levels = c("S", "Q", "C"),
                                 labels = c(1,2,3))

unique(titanic_Dataset$class)
titanic_Dataset$class <- factor(titanic_Dataset$class, 
                                   levels = c("Third","First","Second"),
                                   labels = c(1,2,3))

unique(titanic_Dataset$who)
titanic_Dataset$who <- factor(titanic_Dataset$who, 
                                levels = c("man","woman","child"),
                                labels = c(1,2,3))

unique(titanic_Dataset$alone)
titanic_Dataset$alone <- factor(titanic_Dataset$alone, 
                              levels = c("TRUE", "FALSE"),
                              labels = c(1,2))
titanic_Dataset

mean(titanic_Dataset$age)
mean(titanic_Dataset$fare)
summary(titanic_Dataset$age)
summary(titanic_Dataset$fare)
ggplot(titanic_Dataset, aes(x = fare, fill = ..count..)) +
  geom_histogram(binwidth = 0.05, color = "black", alpha = 0.7) +
  ggtitle("Normalized Fare Distribution") +
  xlab("Normalized Fare") +
  ylab("Frequency") +
  theme_minimal() +
  scale_fill_gradient(low = "blue", high = "red")

ggplot(titanic_Dataset, aes(x = age, fill = ..count..)) +
  geom_histogram(binwidth = 0.05, color = "black", alpha = 0.7) +
  ggtitle("Normalized Age Distribution") +
  xlab("Normalized Age") +
  ylab("Frequency") +
  theme_minimal() +
  scale_fill_gradient(low = "green", high = "yellow")

remove_outliers <- function(x) {
  Q1 <- quantile(x, 0.25)
  Q3 <- quantile(x, 0.75)
  IQR <- Q3 - Q1
  x[x < (Q1 - 1.5 * IQR) | x > (Q3 + 1.5 * IQR)] <- NA
  return(x)
}
titanic_Dataset$fare <- remove_outliers(titanic_Dataset$fare)
titanic_Dataset$age <- remove_outliers(titanic_Dataset$age)

titanic_Dataset$fare <- replace_na_with_mean(titanic_Dataset$fare)
titanic_Dataset$age <- replace_na_with_mean(titanic_Dataset$age)

mean(titanic_Dataset$age)
mean(titanic_Dataset$fare)
summary(titanic_Dataset$age)
summary(titanic_Dataset$fare)
ggplot(titanic_Dataset, aes(x = fare, fill = ..count..)) +
  geom_histogram(binwidth = 0.05, color = "black", alpha = 0.7) +
  ggtitle("Normalized Fare Distribution") +
  xlab("Normalized Fare") +
  ylab("Frequency") +
  theme_minimal() +
  scale_fill_gradient(low = "blue", high = "red")

ggplot(titanic_Dataset, aes(x = age, fill = ..count..)) +
  geom_histogram(binwidth = 0.05, color = "black", alpha = 0.7) +
  ggtitle("Normalized Age Distribution") +
  xlab("Normalized Age") +
  ylab("Frequency") +
  theme_minimal() +
  scale_fill_gradient(low = "green", high = "yellow")

summary(titanic_Dataset$age)
titanic_Dataset$age <- (titanic_Dataset$age - min(titanic_Dataset$age)) / (max(titanic_Dataset$age) - min(titanic_Dataset$age))
summary(titanic_Dataset$age)

gender_summary <- summary(titanic_Dataset$Gender)
age_summary <- summary(titanic_Dataset$age)
sibsp_summary <- summary(titanic_Dataset$sibsp)
parch_summary <- summary(titanic_Dataset$parch)
fare_summary <- summary(titanic_Dataset$fare)

list(gender = gender_summary, age = age_summary, sibsp = sibsp_summary, parch = parch_summary, fare = fare_summary)


table(titanic_Dataset$survived)

balanced_dataset <- ovun.sample(survived ~ ., data = titanic_Dataset, method = "both", p = 0.5, seed = 1)$data
table(balanced_dataset$survived)

titanic_Dataset
balanced_dataset

