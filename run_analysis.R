# Register activity lables
activity.labels <- read.table("UCI\ HAR\ Dataset/activity_labels.txt")

get.activity.name <- function(x) {
  activity.labels[activity.labels$V1==x,"V2"]
}

# Read Test Data
X.test <- read.table("UCI\ HAR\ Dataset/test/X_test.txt")
# This was 561 columns

# Subject id becomes 562
subject <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
X.test <- cbind(X.test, subject)

# Activity becomes 563
activity <- read.table("UCI\ HAR\ Dataset/test/y_test.txt")
X.test <- cbind(X.test, activity)

# Read Train Data
X.train <- read.table("UCI\ HAR\ Dataset/train/X_train.txt")
# This was 561 columns

# Subject id becomes 562
subject <- read.table("UCI\ HAR\ Dataset/train/subject_train.txt")
X.train <- cbind(X.train, subject)

# Activity becomes 563
activity <- read.table("UCI\ HAR\ Dataset/train/y_train.txt")
X.train <- cbind(X.train, activity)

X.all <- rbind(X.test, X.train)

# The first column below is the indices in X containing relevant data.
# The second column below is the variable names for relevant data.
columns = read.table(text="1 tBodyAcc.mean.X
2 tBodyAcc.mean.Y
3 tBodyAcc.mean.Z
4 tBodyAcc.std.X
5 tBodyAcc.std.Y
6 tBodyAcc.std.Z
41 tGravityAcc.mean.X
42 tGravityAcc.mean.Y
43 tGravityAcc.mean.Z
44 tGravityAcc.std.X
45 tGravityAcc.std.Y
46 tGravityAcc.std.Z
81 tBodyAccJerk.mean.X
82 tBodyAccJerk.mean.Y
83 tBodyAccJerk.mean.Z
84 tBodyAccJerk.std.X
85 tBodyAccJerk.std.Y
86 tBodyAccJerk.std.Z
121 tBodyGyro.mean.X
122 tBodyGyro.mean.Y
123 tBodyGyro.mean.Z
124 tBodyGyro.std.X
125 tBodyGyro.std.Y
126 tBodyGyro.std.Z
161 tBodyGyroJerk.mean.X
162 tBodyGyroJerk.mean.Y
163 tBodyGyroJerk.mean.Z
164 tBodyGyroJerk.std.X
165 tBodyGyroJerk.std.Y
166 tBodyGyroJerk.std.Z
201 tBodyAccMag.mean
202 tBodyAccMag.std
214 tGravityAccMag.mean
215 tGravityAccMag.std
227 tBodyAccJerkMag.mean
228 tBodyAccJerkMag.std
240 tBodyGyroMag.mean
241 tBodyGyroMag.std
253 tBodyGyroJerkMag.mean
254 tBodyGyroJerkMag.std
266 fBodyAcc.mean.X
267 fBodyAcc.mean.Y
268 fBodyAcc.mean.Z
269 fBodyAcc.std.X
270 fBodyAcc.std.Y
271 fBodyAcc.std.Z
345 fBodyAccJerk.mean.X
346 fBodyAccJerk.mean.Y
347 fBodyAccJerk.mean.Z
348 fBodyAccJerk.std.X
349 fBodyAccJerk.std.Y
350 fBodyAccJerk.std.Z
424 fBodyGyro.mean.X
425 fBodyGyro.mean.Y
426 fBodyGyro.mean.Z
427 fBodyGyro.std.X
428 fBodyGyro.std.Y
429 fBodyGyro.std.Z
503 fBodyAccMag.mean
504 fBodyAccMag.std
516 fBodyBodyAccJerkMag.mean
517 fBodyBodyAccJerkMag.std
529 fBodyBodyGyroMag.mean
530 fBodyBodyGyroMag.std
542 fBodyBodyGyroJerkMag.mean
543 fBodyBodyGyroJerkMag.std
562 person
563 activity
")

mean.std <- X.all[,columns[[1]]]
colnames(mean.std) <- columns[[2]]

result <- aggregate(mean.std, by=list(mean.std$person, mean.std$activity), mean)

activity.name <- sapply(result$activity, get.activity.name)

# Put "person" and "activity.name" in beginning and remove activity code and redundant stuff.
person <- result[,"person"]
result.data <- result[,3:(length(result)-2)]
final.result <- cbind(person, activity.name, result.data)

write.table(final.result, 'averages.txt', row.names=FALSE)

