# Files where already on /root/data from scp command from download file. 
# I already changed the name of the files on the PC before pushing them to AWS instance.
# I was in the directory of the /root/data/ directory where the csv files lived when performing commands
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/surveys_responses


tail -n +2 effective_care.csv > effective_care_noH.csv
tail -n +2 hospitals.csv > hospitals_noH.csv
tail -n +2 measures.csv > measures_noH.csv
tail -n +2 readmissions.csv > readmissions_noH.csv
tail -n +2 surveys_responses.csv > surveys_responses_noH.csv

hdfs dfs -put ./effective_care_noH.csv /user/w205/hospital_compare/effective_care
hdfs dfs -put ./hospitals_noH.csv /user/w205/hospital_compare/hospitals
hdfs dfs -put ./measures_noH.csv /user/w205/hospital_compare/measures
hdfs dfs -put ./readmissions_noH.csv /user/w205/hospital_compare/readmissions
hdfs dfs -put ./surveys_responses_noH.csv /user/w205/hospital_compare/surveys_responses
