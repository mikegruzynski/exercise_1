-- Filtered out df_effective_care to create filtered_df_effective_care
DROP TABLE filtered_df_effective_care;
CREATE TABLE filtered_df_effective_care AS
SELECT 
provider_id,
hospital_name,
state,
condition,
score,
measure_id
FROM df_effective_care;


-- Filtered out df_hospitals to create filtered_df_hospitals
DROP TABLE filtered_df_hospitals;
CREATE TABLE filtered_df_hospitals AS
SELECT
provider_id, 
hospital_name, 
state
FROM df_hospitals;

-- DID NOT NEED to filter df_measure, no valuable information pertaining to the exercise

-- Filtered out df_readmissions to create filtered_df_readmissions;
DROP TABLE filtered_df_readmissions;
CREATE TABLE filtered_df_readmissions AS
SELECT
provider_id,
hospital_name,
state,
measure_id,
measure_name,
score
FROM df_readmissions;


-- Filtered out df_survey_responses to create filtered_df_survey_responses
-- Made the survey values a percentage: Ex instead of 2 out of 10, now the value is 0.2
-- This will make for an easier to figure out exercise questions associated.
DROP TABLE filtered_df_survey_responses;
CREATE TABLE filtered_df_survey_responses AS
SELECT 
provider_id,
hospital_name, 
state,
SUBSTRING(Nurses_ach, 1, 2)/SUBSTR(Nurses_ach, -2) AS nur_ach_pts,
SUBSTRING(Nurses_imp, 1, 2)/SUBSTR(Nurses_imp, -2) AS nur_imp_pts,
SUBSTRING(Nurses_dim, 1, 2)/SUBSTR(Nurses_dim, -2) AS nur_dim_score,
SUBSTRING(Doctors_ach, 1, 2)/SUBSTR(Doctors_ach, -2) AS doc_ach_pts,
SUBSTRING(Doctors_imp, 1, 2)/SUBSTR(Doctors_imp, -2) AS doc_imp_pts,
SUBSTRING(Doctors_dim, 1, 2)/SUBSTR(Doctors_dim, -2) AS doc_dim_score,
SUBSTRING(Responsiveness_Staff_ach, 1, 2)/SUBSTR(Responsiveness_Staff_ach, -2) AS res_ach_pts,
SUBSTRING(Responsiveness_Staff_imp, 1, 2)/SUBSTR(Responsiveness_Staff_imp, -2) AS res_imp_pts,
SUBSTRING(Responsiveness_Staff_dim, 1, 2)/SUBSTR(Responsiveness_Staff_dim, -2) AS res_dim_score,
SUBSTRING(Pain_Management_ach, 1, 2)/SUBSTR(Pain_Management_ach, -2) AS pain_ach_pts,
SUBSTRING(Pain_Management_imp, 1, 2)/SUBSTR(Pain_Management_imp, -2) AS pain_imp_pts,
SUBSTRING(Pain_Management_dim, 1, 2)/SUBSTR(Pain_Management_dim, -2) AS pain_dim_score,
SUBSTRING(Medicines_ach, 1, 2)/SUBSTR(Medicines_ach, -2) AS med_ach_pts,
SUBSTRING(Medicines_imp, 1, 2)/SUBSTR(Medicines_imp, -2) AS med_imp_pts,
SUBSTRING(Medicines_dim, 1, 2)/SUBSTR(Medicines_dim, -2) AS med_dim_score,
SUBSTRING(Cleanliness_Quietness_ach, 1, 2)/SUBSTR(Cleanliness_Quietness_ach, -2) AS cleanq_ach_pts,
SUBSTRING(Cleanliness_Quietness_imp, 1, 2)/SUBSTR(Cleanliness_Quietness_imp, -2) AS cleanq_imp_pts,
SUBSTRING(Cleanliness_Quietness_dim, 1, 2)/SUBSTR(Cleanliness_Quietness_dim, -2) AS res_cleanq_score,
SUBSTRING(Discharge_ach, 1, 2)/SUBSTR(Discharge_ach, -2) AS disch_ach_pts,
SUBSTRING(Discharge_imp, 1, 2)/SUBSTR(Discharge_imp, -2) AS disch_imp_pts,
SUBSTRING(Discharge_dim, 1, 2)/SUBSTR(Discharge_dim, -2) AS disch_dim_score,
SUBSTRING(Overall_ach, 1, 2)/SUBSTR(Overall_ach, -2) AS overall_ach_pts,
SUBSTRING(Overall_imp, 1, 2)/SUBSTR(Overall_imp, -2) AS overall_imp_pts,
SUBSTRING(Overall_dim, 1, 2)/SUBSTR(Overall_dim, -2) AS overall_dim_score,
HCAHPS_Base,
HCAHPS_Consistency
FROM df_survey_responses;
