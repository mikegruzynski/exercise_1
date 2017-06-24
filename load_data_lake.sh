tail -n +2 effective_care.csv > effective_care_noH.csv
tail -n +2 hospitals.csv > hospitals_noH.csv
tail -n +2 measures.csv > measures_noH.csv
tail -n +2 readmissions.csv > readmissions_noH.csv
tail -n +2 surveys_responses.csv > surveys_responses_noH.csv

hdfs dfs -put ./effective_care.csv /user/w205/hospital_compare
hdfs dfs -put ./hospitals.csv /user/w205/hospital_compare
hdfs dfs -put ./measures.csv /user/w205/hospital_compare
hdfs dfs -put ./readmissions.csv /user/w205/hospital_compare
hdfs dfs -put ./surveys_responses.csv /user/w205/hospital_compare
