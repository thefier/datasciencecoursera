#**Code Book**

---
## ***Abstract***

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, was captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data; the tidy data has merge both sets of data.

To create this tidy data were calculated the average values for the measurements of the mean and the standard deviation for every activity and every subject, 

The set of this data has **68** variables, the first two variables are ***index*** variables, which help to identify the value.

----
## ***Preparation of the tidy data***

The steps to prepare the data were the nexts:
    
- Read the Test and the Train files, with the Activity Vector and the Subject vector in every case, assigning the values to their respectivily data.frames.
- Merge the Data, uniting both sets of data by their rows.
- Select the colums which represent the mean() and the standard deviantion, std(), creating other data frame with these data.
- Create a list, every element of the list represent one variable (one column) of the previous data frame; every element has a matrix, in the columns are the Subjects and in the rows the activities, the intersection represent the average value for that element, with those variables.
- Create a Data Frame, with the data of the list, the first column represent the activities in set of six, the next column represent the subject, every subject has the six activities, and the next columns represent the average records.
- Save the tidy data in a file.

---
## ***Description of the data***

##### Activity_labels

This variables, there are six possible values for this variable:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

##### Subject

The experiment was conducted with 30 volunters, this variable signal with one number to any one of the volunteers, this variable can take values between 1 to 30.


### **Values**

The next variables indicate the average value per activity per subject for the measurement on the mean and the standard deviation, every one is showing the values they can take, showing their quantile:

##### tBodyAcc.mean...X

       0%       25%       50%       75%      100% 
    0.2215982 0.2712133 0.2769649 0.2800046 0.3014610 
##### tBodyAcc.mean...Y

          0%          25%          50%          75%         100% 
    -0.040513953 -0.020021980 -0.017262050 -0.014935802 -0.001308288 
##### tBodyAcc.mean...Z

         0%         25%         50%         75%        100% 
    -0.15251390 -0.11207445 -0.10819134 -0.10442875 -0.07537847 
##### tBodyAcc.std...X

        0%        25%        50%        75%       100% 
    -0.9960686 -0.9798680 -0.7525620 -0.1983772  0.6269171 
##### tBodyAcc.std...Y

         0%         25%         50%         75%        100% 
    -0.99024095 -0.94205082 -0.50896535 -0.03076766  0.61693702 
##### tBodyAcc.std...Z

        0%        25%        50%        75%       100% 
    -0.9876587 -0.9498075 -0.6517574 -0.2306395  0.6090179 
##### tGravityAcc.mean...X

        0%        25%        50%        75%       100% 
    -0.6800432  0.8375929  0.9208389  0.9425169  0.9745087 
##### tGravityAcc.mean...Y

         0%         25%         50%         75%        100% 
    -0.47989484 -0.23318780 -0.12782239  0.08773061  0.95659381 
##### tGravityAcc.mean...Z

         0%         25%         50%         75%        100% 
    -0.49508872 -0.11726140  0.02384122  0.14945589  0.95787304 
##### tGravityAcc.std...X

        0%        25%        50%        75%       100% 
    -0.9967642 -0.9824517 -0.9694657 -0.9508565 -0.8295549 
##### tGravityAcc.std...Y

        0%        25%        50%        75%       100% 
    -0.9942476 -0.9711466 -0.9590330 -0.9370150 -0.6435784 
##### tGravityAcc.std...Z

        0%        25%        50%        75%       100% 
    -0.9909572 -0.9605094 -0.9450024 -0.9179854 -0.6101612 
##### tBodyAccJerk.mean...X

        0%        25%        50%        75%       100% 
    0.04268810 0.07395687 0.07639997 0.08329535 0.13019304 
##### tBodyAccJerk.mean...Y

           0%           25%           50%           75%          100% 
    -0.0386872111  0.0004664019  0.0094697936  0.0134008349  0.0568185863 
##### tBodyAccJerk.mean...Z

          0%          25%          50%          75%         100% 
    -0.067458392 -0.010601061 -0.003860623  0.001958213  0.038053359 
##### tBodyAccJerk.std...X

        0%        25%        50%        75%       100% 
    -0.9946045 -0.9831834 -0.8103646 -0.2232808  0.5442730 
##### tBodyAccJerk.std...Y

        0%        25%        50%        75%       100% 
    -0.9895136 -0.9723987 -0.7756403 -0.1483314  0.3553067 
##### tBodyAccJerk.std...Z

         0%         25%         50%         75%        100% 
    -0.99328831 -0.98266142 -0.88365674 -0.51212335  0.03101571 
##### tBodyGyro.mean...X

         0%         25%         50%         75%        100% 
    -0.20577543 -0.04711588 -0.02870507 -0.01676084  0.19270448 
##### tBodyGyro.mean...Y

         0%         25%         50%         75%        100% 
    -0.20420536 -0.08954963 -0.07318229 -0.06113463  0.02747076 
##### tBodyGyro.mean...Z

         0%         25%         50%         75%        100% 
    -0.07245460  0.07474953  0.08512146  0.10176915  0.17910206 
##### tBodyGyro.std...X

        0%        25%        50%        75%       100% 
    -0.9942766 -0.9734658 -0.7889918 -0.4414247  0.2676572 
##### tBodyGyro.std...Y

        0%        25%        50%        75%       100% 
    -0.9942105 -0.9629329 -0.8016837 -0.4195835  0.4765187 
##### tBodyGyro.std...Z

        0%        25%        50%        75%       100% 
    -0.9855384 -0.9609495 -0.8010011 -0.3106140  0.5648758 
##### tBodyGyroJerk.mean...X

         0%         25%         50%         75%        100% 
    -0.15721254 -0.10322298 -0.09868336 -0.09110449 -0.02209163 
##### tBodyGyroJerk.mean...Y

         0%         25%         50%         75%        100% 
    -0.07680899 -0.04551618 -0.04111754 -0.03842378 -0.01320228 
##### tBodyGyroJerk.mean...Z

          0%          25%          50%          75%         100% 
    -0.092499853 -0.061724502 -0.053429615 -0.048984963 -0.006940664 
##### tBodyGyroJerk.std...X

        0%        25%        50%        75%       100% 
    -0.9965425 -0.9799815 -0.8396488 -0.4628889  0.1791486 
##### tBodyGyroJerk.std...Y

        0%        25%        50%        75%       100% 
    -0.9970816 -0.9832135 -0.8941779 -0.5861055  0.2959459 
##### tBodyGyroJerk.std...Z

        0%        25%        50%        75%       100% 
    -0.9953808 -0.9847851 -0.8609644 -0.4740556  0.1932065 
##### tBodyAccMag.mean..

         0%         25%         50%         75%        100% 
    -0.98649320 -0.95728101 -0.48288360 -0.09190233  0.64460433 
##### tBodyAccMag.std..

        0%        25%        50%        75%       100% 
    -0.9864645 -0.9430046 -0.6074281 -0.2089863  0.4284059 
##### tGravityAccMag.mean..

         0%         25%         50%         75%        100% 
    -0.98649320 -0.95728101 -0.48288360 -0.09190233  0.64460433 
##### tGravityAccMag.std..

        0%        25%        50%        75%       100% 
    -0.9864645 -0.9430046 -0.6074281 -0.2089863  0.4284059 
##### tBodyAccJerkMag.mean..

        0%        25%        50%        75%       100% 
    -0.9928147 -0.9807406 -0.8167786 -0.2456105  0.4344904 
##### tBodyAccJerkMag.std..

        0%        25%        50%        75%       100% 
    -0.9946469 -0.9765475 -0.8013793 -0.2172568  0.4506121 
##### tBodyGyroMag.mean..

        0%        25%        50%        75%       100% 
    -0.9807408 -0.9461307 -0.6550798 -0.2158855  0.4180046 
##### tBodyGyroMag.std..

        0%        25%        50%        75%       100% 
    -0.9813727 -0.9476332 -0.7420443 -0.3602123  0.2999760 
##### tBodyGyroJerkMag.mean..

         0%         25%         50%         75%        100% 
    -0.99732253 -0.98515462 -0.86479460 -0.51186262  0.08758166 
##### tBodyGyroJerkMag.std..

        0%        25%        50%        75%       100% 
    -0.9976661 -0.9804540 -0.8809270 -0.5767388  0.2501732 
##### fBodyAcc.mean...X

        0%        25%        50%        75%       100% 
    -0.9952499 -0.9786885 -0.7690931 -0.2174418  0.5370120 
##### fBodyAcc.mean...Y

        0%        25%        50%        75%       100% 
    -0.9890343 -0.9536143 -0.5949843 -0.0634106  0.5241877 
##### fBodyAcc.mean...Z

        0%        25%        50%        75%       100% 
    -0.9894739 -0.9619469 -0.7236017 -0.3183441  0.2807360 
##### fBodyAcc.std...X

        0%        25%        50%        75%       100% 
    -0.9966046 -0.9819917 -0.7469988 -0.1966392  0.6585065 
##### fBodyAcc.std...Y

         0%         25%         50%         75%        100% 
    -0.99068040 -0.94041510 -0.51337747 -0.07912543  0.56019134 
##### fBodyAcc.std...Z

        0%        25%        50%        75%       100% 
    -0.9872248 -0.9459401 -0.6441493 -0.2654712  0.6871242 
##### fBodyAccJerk.mean...X

        0%        25%        50%        75%       100% 
    -0.9946308 -0.9828381 -0.8126410 -0.2819540  0.4743173 
##### fBodyAccJerk.mean...Y

        0%        25%        50%        75%       100% 
    -0.9893988 -0.9725373 -0.7816560 -0.1963053  0.2767169 
##### fBodyAccJerk.mean...Z

        0%        25%        50%        75%       100% 
    -0.9920184 -0.9796174 -0.8706639 -0.4696900  0.1577757 
##### fBodyAccJerk.std...X

        0%        25%        50%        75%       100% 
    -0.9950738 -0.9847182 -0.8253923 -0.2475329  0.4768039 
##### fBodyAccJerk.std...Y

        0%        25%        50%        75%       100% 
    -0.9904681 -0.9736988 -0.7851519 -0.1685398  0.3497713 
##### fBodyAccJerk.std...Z

          0%          25%          50%          75%         100% 
    -0.993107760 -0.983747468 -0.895120677 -0.543787024 -0.006236475 
##### fBodyGyro.mean...X

        0%        25%        50%        75%       100% 
    -0.9931226 -0.9697364 -0.7299613 -0.3386789  0.4749624 
##### fBodyGyro.mean...Y

        0%        25%        50%        75%       100% 
    -0.9940255 -0.9699617 -0.8140975 -0.4458002  0.3288170 
##### fBodyGyro.mean...Z

        0%        25%        50%        75%       100% 
    -0.9859578 -0.9624244 -0.7909314 -0.2634814  0.4924144 
##### fBodyGyro.std...X

        0%        25%        50%        75%       100% 
    -0.9946522 -0.9750148 -0.8085989 -0.4813274  0.1966133 
##### fBodyGyro.std...Y

        0%        25%        50%        75%       100% 
    -0.9943531 -0.9601717 -0.7963779 -0.4154223  0.6462336 
##### fBodyGyro.std...Z

        0%        25%        50%        75%       100% 
    -0.9867253 -0.9642550 -0.8224004 -0.3916245  0.5224542 
##### fBodyAccMag.mean..

        0%        25%        50%        75%       100% 
    -0.9868006 -0.9559584 -0.6702710 -0.1622106  0.5866376 
##### fBodyAccMag.std..

        0%        25%        50%        75%       100% 
    -0.9876485 -0.9451633 -0.6512629 -0.3654056  0.1786846 
##### fBodyBodyAccJerkMag.mean..

        0%        25%        50%        75%       100% 
    -0.9939983 -0.9769719 -0.7940477 -0.1872346  0.5384048 
##### fBodyBodyAccJerkMag.std..

        0%        25%        50%        75%       100% 
    -0.9943667 -0.9751967 -0.8126188 -0.2668173  0.3163464 
##### fBodyBodyGyroMag.mean..

        0%        25%        50%        75%       100% 
    -0.9865352 -0.9616115 -0.7657094 -0.4086771  0.2039798 
##### fBodyBodyGyroMag.std..

        0%        25%        50%        75%       100% 
    -0.9814688 -0.9487799 -0.7727282 -0.4276942  0.2366597 
##### fBodyBodyGyroJerkMag.mean..

        0%        25%        50%        75%       100% 
    -0.9976174 -0.9813016 -0.8778966 -0.5831149  0.1466186 
##### fBodyBodyGyroJerkMag.std..

        0%        25%        50%        75%       100% 
    -0.9975852 -0.9801552 -0.8940684 -0.6080659  0.2878346 **