---
title: "CodeBook"
author: "Ehab Mohamed"
date: "14 August 2015"
output: html_document
---

This CodeBook describes the different variables in the dataset.

## Identifiers
- **activity**: is the activity name which can be (```WALKING```, ```WALKING_UPSTAIRS```, ```WALKING_DOWNSTAIRS```, ```SITTING```, ```STANDING```, ```LAYING```).
- **subject**: is the subject who performed the activity.

## Measurements
- Activity and subject names have been set to the dataset.
- Names of the measurements have been transformed based on the features dataset.
- Below is a table that shows the names of the measurements before and after transformation:

Original Name               Descriptive Name     
-------                     ------ 
 tBodyAcc-mean()-Y           tBodyAcc.mean.Y          
 tBodyAcc-mean()-Z           tBodyAcc.mean.Z          
 tBodyAcc-std()-X            tBodyAcc.std.X           
 tBodyAcc-std()-Y            tBodyAcc.std.Y           
 tBodyAcc-std()-Z            tBodyAcc.std.Z           
 tGravityAcc-mean()-X        tGravityAcc.mean.X       
 tGravityAcc-mean()-Y        tGravityAcc.mean.Y       
 tGravityAcc-mean()-Z        tGravityAcc.mean.Z       
 tGravityAcc-std()-X         tGravityAcc.std.X        
 tGravityAcc-std()-Y         tGravityAcc.std.Y        
 tGravityAcc-std()-Z         tGravityAcc.std.Z        
 tBodyAccJerk-mean()-X       tBodyAccJerk.mean.X      
 tBodyAccJerk-mean()-Y       tBodyAccJerk.mean.Y      
 tBodyAccJerk-mean()-Z       tBodyAccJerk.mean.Z      
 tBodyAccJerk-std()-X        tBodyAccJerk.std.X       
 tBodyAccJerk-std()-Y        tBodyAccJerk.std.Y       
 tBodyAccJerk-std()-Z        tBodyAccJerk.std.Z       
 tBodyGyro-mean()-X          tBodyGyro.mean.X         
 tBodyGyro-mean()-Y          tBodyGyro.mean.Y         
 tBodyGyro-mean()-Z          tBodyGyro.mean.Z         
 tBodyGyro-std()-X           tBodyGyro.std.X          
 tBodyGyro-std()-Y           tBodyGyro.std.Y          
 tBodyGyro-std()-Z           tBodyGyro.std.Z          
 tBodyGyroJerk-mean()-X      tBodyGyroJerk.mean.X     
 tBodyGyroJerk-mean()-Y      tBodyGyroJerk.mean.Y     
 tBodyGyroJerk-mean()-Z      tBodyGyroJerk.mean.Z     
 tBodyGyroJerk-std()-X       tBodyGyroJerk.std.X      
 tBodyGyroJerk-std()-Y       tBodyGyroJerk.std.Y      
 tBodyGyroJerk-std()-Z       tBodyGyroJerk.std.Z      
 tBodyAccMag-mean()          tBodyAccMag.mean         
 tBodyAccMag-std()           tBodyAccMag.std          
 tGravityAccMag-mean()       tGravityAccMag.mean      
 tGravityAccMag-std()        tGravityAccMag.std       
 tBodyAccJerkMag-mean()      tBodyAccJerkMag.mean     
 tBodyAccJerkMag-std()       tBodyAccJerkMag.std      
 tBodyGyroMag-mean()         tBodyGyroMag.mean        
 tBodyGyroMag-std()          tBodyGyroMag.std         
 tBodyGyroJerkMag-mean()     tBodyGyroJerkMag.mean    
 tBodyGyroJerkMag-std()      tBodyGyroJerkMag.std     
 fBodyAcc-mean()-X           fBodyAcc.mean.X          
 fBodyAcc-mean()-Y           fBodyAcc.mean.Y          
 fBodyAcc-mean()-Z           fBodyAcc.mean.Z          
 fBodyAcc-std()-X            fBodyAcc.std.X           
 fBodyAcc-std()-Y            fBodyAcc.std.Y           
 fBodyAcc-std()-Z            fBodyAcc.std.Z           
 fBodyAccJerk-mean()-X       fBodyAccJerk.mean.X      
 fBodyAccJerk-mean()-Y       fBodyAccJerk.mean.Y      
 fBodyAccJerk-mean()-Z       fBodyAccJerk.mean.Z      
 fBodyAccJerk-std()-X        fBodyAccJerk.std.X       
 fBodyAccJerk-std()-Y        fBodyAccJerk.std.Y       
 fBodyAccJerk-std()-Z        fBodyAccJerk.std.Z       
 fBodyGyro-mean()-X          fBodyGyro.mean.X         
 fBodyGyro-mean()-Y          fBodyGyro.mean.Y         
 fBodyGyro-mean()-Z          fBodyGyro.mean.Z         
 fBodyGyro-std()-X           fBodyGyro.std.X          
 fBodyGyro-std()-Y           fBodyGyro.std.Y          
 fBodyGyro-std()-Z           fBodyGyro.std.Z          
 fBodyAccMag-mean()          fBodyAccMag.mean         
 fBodyAccMag-std()           fBodyAccMag.std          
 fBodyBodyAccJerkMag-mean()  fBodyBodyAccJerkMag.mean 
 fBodyBodyAccJerkMag-std()   fBodyBodyAccJerkMag.std  
 fBodyBodyGyroMag-mean()     fBodyBodyGyroMag.mean    
 fBodyBodyGyroMag-std()      fBodyBodyGyroMag.std     
 fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag.mean
 fBodyBodyGyroJerkMag-std()  fBodyBodyGyroJerkMag.std 
