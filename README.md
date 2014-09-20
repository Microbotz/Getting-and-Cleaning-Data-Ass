##README
This is the readme file for the course project. To generate the tidy data , make sure that you have downloaded and extracted the samsung data in your working directory. Also make sure that you have reshape2 and plyr package installed. The data processing is described in steps below:
-   Load the required packages
-   Load the Feature names from 'features.txt' file into FeatNames Variable
-   Load train data, label and subject from corresponding variables
-   Column bind the data in one data frame TrainData
-   Rename the variables in TrainData data frame using feature names
-   Load test data, label and subject from corresponding variables
-   Column bind the data in one data frame TestData
-   Rename the variables in TestData data frame using feature names
-   Merge Training and Test Data
-   Subset required columns from merged data using
-   Load Activity names from corresponding file
-   Rename the Activity column in Merged data after converting Activy and 
    Subject column to factor
-   Melt the data for reshaping
-   reshape the data and output to file.