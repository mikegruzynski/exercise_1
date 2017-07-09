-- Filtered out df_effective_care to create filtered_df_effective_care. Only need these variables to potentially solve the 
-- questions associated with this execise.
DROP TABLE filtered_df_effective_care;
CREATE TABLE filtered_df_effective_care AS
SELECT 
provider_id,
hospital_name,
state,
condition,
score,
sample,
measure_id
FROM df_effective_care
WHERE score not like '%Not Available%'
AND score not like '%High%'
AND score not like '%Medium%' 
AND score not like '%Low%'
and sample not like '%Not Available%'
AND sample > 30;


-- Filtered out df_hospitals to create filtered_df_hospitals Only need these variables to potentially solve the questions 
-- associated with this execise.
DROP TABLE filtered_df_hospitals;
CREATE TABLE filtered_df_hospitals AS
SELECT
provider_id, 
hospital_name, 
state
FROM df_hospitals;

-- DID NOT NEED to filter df_measure, no valuable information pertaining to the exercise 
-- Only need these variables to potentially solve the questions associated with this execise.

-- Filtered out df_readmissions to create filtered_df_readmissions;
DROP TABLE filtered_df_readmissions;
CREATE TABLE filtered_df_readmissions AS
SELECT
provider_id,
hospital_name,
state,
measure_id,
measure_name,
denominator,
score
FROM df_readmissions
WHERE denominator not like '%Not Available%'
AND score not like '%Not Available%'
AND denominator > 30;


-- Filtered out df_survey_responses to create filtered_df_survey_responses
-- Made the survey values a denominatorpercentage: Ex instead of 2 out of 10, now the value is 0.2
-- This will make for an easier to figure out exercise questions associated.
-- Only need these variables to potentially solve the questions associated with this execise.
DROP TABLE filtered_df_survey_responses;
CREATE TABLE filtered_df_survey_responses AS
SELECT 
provider_id,
hospital_name, 
state,
(SUBSTRING(Nurses_ach, 1, 2) + SUBSTRING(Nurses_imp, 1, 2) + SUBSTRING(Nurses_dim, 1, 2))/29 AS nur_avg,
(SUBSTRING(Doctors_ach, 1, 2) + SUBSTRING(Doctors_imp, 1, 2) + SUBSTRING(Doctors_dim, 1, 2))/29 AS doc_avg,
(SUBSTRING(Responsiveness_Staff_ach, 1, 2) + SUBSTRING(Responsiveness_Staff_imp, 1, 2) + SUBSTRING(Responsiveness_Staff_dim, 1, 2))/29 AS Responsiveness_Staff_avg,
(SUBSTRING(Pain_Management_ach, 1, 2) + SUBSTRING(Pain_Management_ach, 1, 2) + SUBSTRING(Pain_Management_ach, 1, 2))/29 AS pain_avg,
(SUBSTRING(Medicines_ach, 1, 2) + SUBSTRING(Medicines_imp, 1, 2) + SUBSTRING(Medicines_dim, 1, 2))/29 AS Medicines_avg,
(SUBSTRING(Cleanliness_Quietness_ach, 1, 2) + SUBSTRING(Cleanliness_Quietness_ach, 1, 2) + SUBSTRING(Cleanliness_Quietness_ach, 1, 2))/29 AS cleanq_avg,
(SUBSTRING(Discharge_ach, 1, 2) + SUBSTRING(Discharge_imp, 1, 2) + SUBSTRING(Discharge_dim, 1, 2))/29 AS disch_avg,
(SUBSTRING(Overall_ach, 1, 2) + SUBSTRING(Overall_imp, 1, 2) + SUBSTRING(Overall_dim, 1, 2))/29 AS overall_avg,
(HCAHPS_Base + HCAHPS_Consistency)/100 as HCAHPS_total_avg
FROM df_survey_responses;
