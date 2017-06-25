# transfer the file from PC onto AWS EC2 instance
scp -i "UCBW205.pem" /cygdrive/c/Users/mgruz/Desktop/exercise_1/data/*.csv  root@ec2-34-204-3-76.compute-1.amazonaws.com:/data/
# change directory into where I put raw data
cd /data/
# make hadoop directory, one folder per csv file
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/surveys_responses
# remove the header from all the csv file so SQL data creation 
tail -n +2 effective_care.csv > effective_care_noH.csv
tail -n +2 hospitals.csv > hospitals_noH.csv
tail -n +2 measures.csv > measures_noH.csv
tail -n +2 readmissions.csv > readmissions_noH.csv
tail -n +2 surveys_responses.csv > surveys_responses_noH.csv
# hdfs (hadoop) commands to place files in newly created folders
hdfs dfs -put ./effective_care_noH.csv /user/w205/hospital_compare/effective_care
hdfs dfs -put ./hospitals_noH.csv /user/w205/hospital_compare/hospitals
hdfs dfs -put ./measures_noH.csv /user/w205/hospital_compare/measures
hdfs dfs -put ./readmissions_noH.csv /user/w205/hospital_compare/readmissions
hdfs dfs -put ./surveys_responses_noH.csv /user/w205/hospital_compare/surveys_responses
