/* Creation of schema for effective_care.csv
Measure_Start_Date and Measure_End_Date are considered strings because data is in Month/Day/Year format instead of SQL DATE: year, month, and day values
Score and Sample are strings because there are some missing data and special code in values that wont be handled if instantiated as float or int
 */

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
LOCATION '/user/w205/hospital_compare/';

/* Creation of schema for hospitals.csv
No strange formats, mostly sting data in columns
*/

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
LOCATION '/user/w205/hospital_compare/';


/* Creation of schema for measures.csv
No strange formats, mostly sting data in columns
*/

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
LOCATION '/user/w205/hospital_compare/';

/* Creation of schema for readmission.csv
Measure_Start_Date and Measure_End_Date are considered strings because data is in Month/Day/Year format instead of SQL DATE: year, month, and day values
Denominator, Score, Lower_Estimate, and Higher_Estimate are handled as strings because there are some missing data that wont be handled if instantiated as float or int.
This will be handled later in pyspark code.
 */


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
LOCATION '/user/w205/hospital_compare/';

/* Creation of schema for survey_responses.csv
Anything with Point or Dimension_Score in the column name will be stored as a STRING because sample data is "1 out of 10"
HCAHPS_Base_Score and HCAHPS_Consistency_Score are handled as strings because there are some missing data that wont be handled if instantiated as float or int.
This all will be handled later in pyspark code.
 */


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
Communication_with_Nurses_Achievement_Points STRING,
Communication_with_Nurses_Improvement_Points STRING,
Communication_with_Nurses_Dimension_Score STRING,
Communication_with_Doctors_Achievement_Points STRING,
Communication_with_Doctors_Improvement_Points STRING,
Communication_with_Doctors_Dimension_Score STRING,
Responsiveness_of_Hospital_Staff_Achievement_Points STRING,
Responsiveness_of_Hospital_Staff_Improvement_Points STRING,
Responsiveness_of_Hospital_Staff_Dimension_Score STRING,
Pain_Management_Achievement_Points STRING,
Pain_Management_Improvement_Points STRING,
Pain_Management_Dimension_Score STRING,
Communication_about_Medicines_Achievement_Points STRING,
Communication_about_Medicines_Improvement_Points STRING,
Communication_about_Medicines_Dimension_Score STRING,
Cleanliness_and_Quietness_of_Hospital_Environment_Achievement_Points STRING,
Cleanliness_and_Quietness_of_Hospital_Environment_Improvement_Points STRING,
Cleanliness_and_Quietness_of_Hospital_Environment_Dimension_Score STRING,
Discharge_Information_Achievement_Points STRING,
Discharge_Information_Improvement_Points STRING,
Discharge_Information_Dimension_Score STRING,
Overall_Rating_of_Hospital_Achievement_Points STRING,
Overall_Rating_of_Hospital_Improvement_Points STRING,
Overall_Rating_of_Hospital_Dimension_Score STRING,
HCAHPS_Base_Score STRING,
HCAHPS_Consistency_Score STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/';
