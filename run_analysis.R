# Read Test Data
subject.test <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
X.test <- read.table("UCI\ HAR\ Dataset/test/X_test.txt")
y.test <- read.table("UCI\ HAR\ Dataset/test/y_test.txt")
body.acc.x.test <- read.table("UCI\ HAR\ Dataset/test/Inertial\ Signals/body_acc_x_test.txt")

# Read Train Data
subject.test <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
X.test <- read.table("UCI\ HAR\ Dataset/test/X_test.txt")
y.test <- read.table("UCI\ HAR\ Dataset/test/y_test.txt")
body.acc.x.test <- read.table("UCI\ HAR\ Dataset/test/Inertial\ Signals/body_acc_x_test.txt")


summary(subject.test)
summary(X.test)
summary(y.test)
summary(body.acc.x.test)

