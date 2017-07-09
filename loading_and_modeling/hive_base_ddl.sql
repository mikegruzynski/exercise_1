-- NOTE, NEED TO HAVE DATA STORED IN:
-- 1. /user/w205/hospital_compare/effective_care/ ; with csv file with Procedure Data
-- 2. /user/w205/hospital_compare/hospitals/ ; with csv file with General hospital Data
-- 3. /user/w205/hospital_compare/measures/ ; with csv file with Mapping measures to codes Data
-- 4. /user/w205/hospital_compare/readmissions/ ; with csv file with Procedure Data
-- Writing a table for the effective_care.csv data. Looking at the csv file, below is the schema to created the unfiltered sql dataframes
DROP TABLE df_effective_care;
CREATE EXTERNAL TABLE df_effective_care
(
Provider_ID INT,
Hospital_Name STRING,
Address STRING,
City STRING,
State STRING,
ZIP_Code INT,
County_Name STRING,
Phone_Number INT,
Condition STRING,
Measure_ID STRING,
Measure_Name STRING,
Score STRING,
Sample STRING,
Footnote STRING,
Measure_Start_Date STRING,
Measure_End_Date STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care/';
-- Writing a table for the hospitals.csv data. Looking at the csv file, below is the schema to created the unfiltered sql dataframes
DROP TABLE df_hospitals;
CREATE EXTERNAL TABLE df_hospitals
(
Provider_ID INT,
Hospital_Name STRING,
Address STRING,
City STRING,
State STRING,
ZIP_Code INT,
County_Name STRING,
Phone_Number STRING,
Hospital_Type STRING,
Hospital_Ownership STRING,
Emergency_Services STRING
 )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals/';
-- Writing a table for the measures.csv data. Looking at the csv file, below is the schema to created the unfiltered sql dataframes
DROP TABLE df_measure;
CREATE EXTERNAL TABLE df_measure
(
Measure_Name STRING,
Measure_ID STRING,
Measure_Start_Quarter STRING,
Measure_Start_Date STRING,
Measure_End_Quarter STRING,
Measure_End_Date STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures/';
-- Writing a table for the readmissions.csv data. Looking at the csv file, below is the schema to created the unfiltered sql dataframes
DROP TABLE df_readmissions;
CREATE EXTERNAL TABLE df_readmissions
(
Provider_ID INT,
Hospital_Name STRING,
Address STRING,
City STRING,
State STRING,
ZIP_Code INT,
County_Name STRING,
Phone_Number INT,
Measure_Name STRING,
Measure_ID STRING,
Compared_to_National STRING,
Denominator STRING,
Score STRING,
Lower_Estimate STRING,
Higher_Estimate STRING,
Footnote STRING,
Measure_Start_Date STRING,
Measure_End_Date STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions/';
-- Writing a table for the surveys_responses.csv data. Looking at the csv file, below is the schema to created the unfiltered sql dataframes
DROP TABLE df_survey_responses;
CREATE EXTERNAL TABLE df_survey_responses
(
Provider_ID INT,
Hospital_Name STRING,
Address STRING,
City STRING,
State STRING,
ZIP_Code INT,
County_Name STRING,
Nurses_ach INT,
Nurses_imp INT,
Nurses_dim INT,
Doctors_ach INT,
Doctors_imp INT,
Doctors_dim INT,
Responsiveness_Staff_ach INT,
Responsiveness_Staff_imp INT,
Responsiveness_Staff_dim INT,
Pain_Management_ach INT,
Pain_Management_imp INT,
Pain_Management_dim INT,
Medicines_ach INT,
Medicines_imp INT,
Medicines_dim INT,
Cleanliness_Quietness_ach INT,
Cleanliness_Quietness_imp INT,
Cleanliness_Quietness_dim INT,
Discharge_ach INT,
Discharge_imp INT,
Discharge_dim INT,
Overall_ach INT,
Overall_imp INT,
Overall_dim INT,
HCAHPS_Base INT,
HCAHPS_Consistency INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys_responses/';
