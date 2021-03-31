require(reshape2)
require(data.table)

# Set working directory
setwd("~/Documentos/DataScience/Curso3CleaningGettingData/UCI HAR Dataset")
path <- getwd()

# Lectura de datos de test
activityEtiquetas <- fread(file.path(path, "activity_labels.txt")
                        , col.names = c("classLabels", "activityName"))
atributos <- fread(file.path(path, "features.txt")
                  , col.names = c("index", "featureNames"))
atributosDeseados <- grep("(mean|std)\\(\\)", atributos[, featureNames])
medidas <- atributos[atributosDeseados, featureNames]
medidas <- gsub('[()]', '', medidas)

# Lectura de datos de train
train <- fread(file.path(path, "train/X_train.txt"))[, atributosDeseados, with = FALSE]
data.table::setnames(train, colnames(train), medidas)
trainActivities <- fread(file.path(path, "train/y_train.txt")
                         , col.names = c("Activity"))
trainSubjects <- fread(file.path(path, "train/subject_train.txt")
                       , col.names = c("SubjectNum"))
train <- cbind(trainSubjects, trainActivities, train)

# Cargar datos test
test <- fread(file.path(path, "test/X_test.txt"))[, atributosDeseados, with = FALSE]
data.table::setnames(test, colnames(test), medidas)
testActivities <- fread(file.path(path, "test/y_test.txt")
                        , col.names = c("Activity"))
testSubjects <- fread(file.path(path, "test/subject_test.txt")
                      , col.names = c("SubjectNum"))
test <- cbind(testSubjects, testActivities, test)

# combinando conjunto de datos
dataFinal <- rbind(train, test)

# Convert classLabels to activityName basically. More explicit. 
dataFinal[["Activity"]] <- factor(dataFinal[, Activity]
                                 , levels = activityEtiquetas[["classLabels"]]
                                 , labels = activityEtiquetas[["activityName"]])

dataFinal[["SubjectNum"]] <- as.factor(dataFinal[, SubjectNum])
dataFinal <- reshape2::melt(data = dataFinal, id = c("SubjectNum", "Activity"))
dataFinal <- reshape2::dcast(data = dataFinal, SubjectNum + Activity ~ variable, 
                             fun.aggregate = mean)

data.table::fwrite(x = dataFinal, file = "tidyData.txt", quote = FALSE)
