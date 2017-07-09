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
-- Made the survey values a denominator of the aggregate in each category
-- For example nurse category had three subjects:Nurses_ach, Nurses_imp, Nurses_dim. Then added each numerator, which was the first int
-- of the column value and divided by 29 because Nurses_ach was out of 10, Nurses_imp was out of 9, and Nurses_dim was out of 10.
-- Repeated for the rest of the columns except for the HCAPS columns. 
-- Looked online source:http://www.hcahpsonline.org/files/HCAHPS%20Fact%20Sheet%20May%202012.pdf
-- and found out that the base was out of 80 and the consistency was out of 20, so made an sum of numerator of both and divided by 100.
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

-- TRANSFORMING for best hospitals
DROP TABLE bh_eff_ed_avg;
CREATE TABLE bh_eff_ed_avg AS
SELECT provider_id, sum(sample * score)/ sum(sample) AS bh_eff_ed_avg FROM filtered_df_effective_care 
WHERE condition = 'Emergency Department'
GROUP BY provider_id
ORDER BY bh_eff_ed_avg DESC;
-- 
DROP TABLE bh_eff_hacp_avg;
CREATE TABLE bh_eff_hacp_avg AS
SELECT provider_id, sum(sample * score)/ sum(sample) AS bh_eff_hacp_avg FROM filtered_df_effective_care 
WHERE condition = 'Heart Attack or Chest Pain'
GROUP BY provider_id
ORDER BY bh_eff_hacp_avg DESC;
-- 
DROP TABLE bh_eff_hf_avg;
CREATE TABLE bh_eff_hf_avg AS
SELECT provider_id, sum(sample * score)/ sum(sample) AS bh_eff_hf_avg FROM filtered_df_effective_care 
WHERE condition = 'Heart Failure'
GROUP BY provider_id
ORDER BY bh_eff_hf_avg DESC;
-- 
DROP TABLE bh_eff_pc_avg;
CREATE TABLE bh_eff_pc_avg AS
SELECT provider_id, sum(sample * score)/ sum(sample) AS bh_eff_pc_avg FROM filtered_df_effective_care 
WHERE condition = 'Preventive Care'
GROUP BY provider_id
ORDER BY bh_eff_pc_avg DESC;
-- 
DROP TABLE bh_eff_scip_avg;
CREATE TABLE bh_eff_scip_avg AS
SELECT provider_id, sum(sample * score)/ sum(sample) AS bh_eff_scip_avg FROM filtered_df_effective_care 
WHERE condition = 'Surgical Care Improvement Project'
GROUP BY provider_id
ORDER BY bh_eff_scip_avg DESC;
-- 
DROP TABLE bh_eff_pdc_avg;
CREATE TABLE bh_eff_pdc_avg AS
SELECT provider_id, sum(sample * score)/ sum(sample) AS bh_eff_pdc_avg FROM filtered_df_effective_care 
WHERE condition = 'Pregnancy and Delivery Care'
GROUP BY provider_id
ORDER BY bh_eff_pdc_avg DESC;
-- 
DROP TABLE bh_eff_p_avg;
CREATE TABLE bh_eff_p_avg AS
SELECT provider_id, sum(sample * score)/ sum(sample) AS bh_eff_p_avg FROM filtered_df_effective_care 
WHERE condition = 'Pneumonia'
GROUP BY provider_id
ORDER BY bh_eff_p_avg DESC;
-- 
DROP TABLE bh_eff_sc_avg;
CREATE TABLE bh_eff_sc_avg AS
SELECT provider_id, sum(sample * score)/ sum(sample) AS bh_eff_sc_avg FROM filtered_df_effective_care 
WHERE condition = 'Stroke Care'
GROUP BY provider_id
ORDER BY bh_eff_sc_avg DESC;
-- 
DROP TABLE bh_eff_bcptca_avg;
CREATE TABLE bh_eff_bcptca_avg AS
SELECT provider_id, sum(sample * score)/ sum(sample) AS bh_eff_bcptca_avg FROM filtered_df_effective_care 
WHERE condition like '%Blood Clot Prevention%'
GROUP BY provider_id
ORDER BY bh_eff_bcptca_avg DESC;
-- 
--
--
DROP TABLE bh_eff_ed_rank;
CREATE TABLE bh_eff_ed_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_ed_avg DESC) as bh_eff_avg_ed_rank,
       df.provider_id,df.bh_eff_ed_avg
FROM bh_eff_ed_avg df;
-- 
DROP TABLE bh_eff_hacp_rank;
CREATE TABLE bh_eff_hacp_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_hacp_avg DESC) as bh_eff_avg_hacp_rank,
       df.provider_id,df.bh_eff_hacp_avg
FROM bh_eff_hacp_avg df;
-- 
DROP TABLE bh_eff_hf_rank;
CREATE TABLE bh_eff_hf_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_hf_avg DESC) as bh_eff_avg_hf_rank,
       df.provider_id,df.bh_eff_hf_avg
FROM bh_eff_hf_avg df;
-- 
DROP TABLE bh_eff_pc_rank;
CREATE TABLE bh_eff_pc_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_pc_avg DESC) as bh_eff_avg_pc_rank,
       df.provider_id,df.bh_eff_pc_avg
FROM bh_eff_pc_avg df;
-- 
DROP TABLE bh_eff_scip_rank;
CREATE TABLE bh_eff_scip_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_scip_avg DESC) as bh_eff_avg_scip_rank,
       df.provider_id,df.bh_eff_scip_avg
FROM bh_eff_scip_avg df;
-- 
DROP TABLE bh_eff_pdc_rank;
CREATE TABLE bh_eff_pdc_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_pdc_avg DESC) as bh_eff_avg_pdc_rank,
       df.provider_id,df.bh_eff_pdc_avg
FROM bh_eff_pdc_avg df;
-- 
DROP TABLE bh_eff_p_rank;
CREATE TABLE bh_eff_p_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_p_avg DESC) as bh_eff_avg_p_rank,
       df.provider_id,df.bh_eff_p_avg
FROM bh_eff_p_avg df;
-- 
DROP TABLE bh_eff_sc_rank;
CREATE TABLE bh_eff_sc_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_sc_avg DESC) as bh_eff_avg_sc_rank,
       df.provider_id,df.bh_eff_sc_avg
FROM bh_eff_sc_avg df;
-- 
DROP TABLE bh_eff_bcptca_rank;
CREATE TABLE bh_eff_bcptca_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_bcptca_avg DESC) as bh_eff_avg_bcptca_rank,
       df.provider_id,df.bh_eff_bcptca_avg
FROM bh_eff_bcptca_avg df;
--
--
--
drop table best_hospital_ranks;
create table best_hospital_ranks as
select a.provider_id, a.hospital_name, a.state, 
round(b.bh_eff_ed_avg, 2) as bh_eff_ed_avg, b.bh_eff_avg_ed_rank,
round(c.bh_eff_hacp_avg, 2) as bh_eff_hacp_avg, c.bh_eff_avg_hacp_rank,
round(d.bh_eff_hf_avg, 2) as bh_eff_hf_avg, d.bh_eff_avg_hf_rank,
round(e.bh_eff_pc_avg, 2) as bh_eff_pc_avg, e.bh_eff_avg_pc_rank,
round(f.bh_eff_scip_avg, 2) as bh_eff_scip_avg, f.bh_eff_avg_scip_rank,
round(g.bh_eff_pdc_avg, 2) as bh_eff_pdc_avg, g.bh_eff_avg_pdc_rank,
round(h.bh_eff_p_avg, 2) as bh_eff_p_avg, h.bh_eff_avg_p_rank,
round(i.bh_eff_sc_avg, 2) as bh_eff_sc_avg, i.bh_eff_avg_sc_rank,
round(j.bh_eff_bcptca_avg, 2) as bh_eff_bcptca_avg, j.bh_eff_avg_bcptca_rank
from filtered_df_hospitals a
left join bh_eff_ed_rank b
on (a.provider_id = b.provider_id)
left join bh_eff_hacp_rank c
on (a.provider_id = c.provider_id)
left join bh_eff_hf_rank d
on (a.provider_id = d.provider_id)
left join bh_eff_pc_rank e
on (a.provider_id = e.provider_id)
left join bh_eff_scip_rank f
on (a.provider_id = f.provider_id)
left join bh_eff_pdc_rank g
on (a.provider_id = g.provider_id)
left join bh_eff_p_rank h
on (a.provider_id = h.provider_id)
left join bh_eff_sc_rank i
on (a.provider_id = i.provider_id)
left join bh_eff_bcptca_rank j
on (a.provider_id = j.provider_id);
--
--
--
drop table best_hospital_ranks_filtered;
create table best_hospital_ranks_filtered as
select * FROM best_hospital_ranks
WHERE bh_eff_ed_avg is NOT NULL
and bh_eff_avg_ed_rank is NOT NULL
and bh_eff_hacp_avg is NOT NULL
and bh_eff_avg_hacp_rank is NOT NULL
and bh_eff_hf_avg is NOT NULL
and bh_eff_avg_hf_rank is NOT NULL
and bh_eff_pc_avg is NOT NULL
and bh_eff_avg_pc_rank is NOT NULL
and bh_eff_scip_avg is NOT NULL
and bh_eff_avg_scip_rank is NOT NULL
and bh_eff_pdc_avg is NOT NULL
and bh_eff_avg_pdc_rank is NOT NULL
and bh_eff_p_avg is NOT NULL
and bh_eff_avg_p_rank is NOT NULL
and bh_eff_sc_avg is NOT NULL
and bh_eff_avg_sc_rank is NOT NULL
and bh_eff_bcptca_avg is NOT NULL
and bh_eff_avg_bcptca_rank is NOT NULL;
---
---
---
-- TRANSFORMING for best state
drop table best_hospital_ranks;
create table best_hospital_ranks as
select a.provider_id, a.hospital_name, a.state, 
round(b.bh_eff_ed_avg, 2) as bh_eff_ed_avg, b.bh_eff_avg_ed_rank,
round(c.bh_eff_hacp_avg, 2) as bh_eff_hacp_avg, c.bh_eff_avg_hacp_rank,
round(d.bh_eff_hf_avg, 2) as bh_eff_hf_avg, d.bh_eff_avg_hf_rank,
round(e.bh_eff_pc_avg, 2) as bh_eff_pc_avg, e.bh_eff_avg_pc_rank,
round(f.bh_eff_scip_avg, 2) as bh_eff_scip_avg, f.bh_eff_avg_scip_rank,
round(g.bh_eff_pdc_avg, 2) as bh_eff_pdc_avg, g.bh_eff_avg_pdc_rank,
round(h.bh_eff_p_avg, 2) as bh_eff_p_avg, h.bh_eff_avg_p_rank,
round(i.bh_eff_sc_avg, 2) as bh_eff_sc_avg, i.bh_eff_avg_sc_rank,
round(j.bh_eff_bcptca_avg, 2) as bh_eff_bcptca_avg, j.bh_eff_avg_bcptca_rank
from filtered_df_hospitals a
left join bh_eff_ed_rank b
on (a.provider_id = b.provider_id)
left join bh_eff_hacp_rank c
on (a.provider_id = c.provider_id)
left join bh_eff_hf_rank d
on (a.provider_id = d.provider_id)
left join bh_eff_pc_rank e
on (a.provider_id = e.provider_id)
left join bh_eff_scip_rank f
on (a.provider_id = f.provider_id)
left join bh_eff_pdc_rank g
on (a.provider_id = g.provider_id)
left join bh_eff_p_rank h
on (a.provider_id = h.provider_id)
left join bh_eff_sc_rank i
on (a.provider_id = i.provider_id)
left join bh_eff_bcptca_rank j
on (a.provider_id = j.provider_id);
--
--
--
drop table best_hospital_ranks_filtered;
create table best_hospital_ranks_filtered as
select * FROM best_hospital_ranks
WHERE bh_eff_ed_avg is NOT NULL
and bh_eff_avg_ed_rank is NOT NULL
and bh_eff_hacp_avg is NOT NULL
and bh_eff_avg_hacp_rank is NOT NULL
and bh_eff_hf_avg is NOT NULL
and bh_eff_avg_hf_rank is NOT NULL
and bh_eff_pc_avg is NOT NULL
and bh_eff_avg_pc_rank is NOT NULL
and bh_eff_scip_avg is NOT NULL
and bh_eff_avg_scip_rank is NOT NULL
and bh_eff_pdc_avg is NOT NULL
and bh_eff_avg_pdc_rank is NOT NULL
and bh_eff_p_avg is NOT NULL
and bh_eff_avg_p_rank is NOT NULL
and bh_eff_sc_avg is NOT NULL
and bh_eff_avg_sc_rank is NOT NULL
and bh_eff_bcptca_avg is NOT NULL
and bh_eff_avg_bcptca_rank is NOT NULL;
--
--
--
--- TRANSFORMING for hospitals_and_patients
DROP TABLE sur_nur_avg_rank;
CREATE TABLE sur_nur_avg_rank AS
SELECT RANK() OVER(ORDER BY df.nur_avg DESC) as nur_avg_rank,
       df.provider_id, df.nur_avg
FROM filtered_df_survey_responses df;
--
DROP TABLE sur_doc_avg_rank;
CREATE TABLE sur_doc_avg_rank AS
SELECT RANK() OVER(ORDER BY df.doc_avg DESC) as doc_avg_rank,
       df.provider_id, df.doc_avg
FROM filtered_df_survey_responses df;
--
DROP TABLE sur_Responsiveness_Staff_avg_rank;
CREATE TABLE sur_Responsiveness_Staff_avg_rank AS
SELECT RANK() OVER(ORDER BY df.Responsiveness_Staff_avg DESC) as Responsiveness_Staff_avg_rank,
       df.provider_id, df.Responsiveness_Staff_avg
FROM filtered_df_survey_responses df;
--
DROP TABLE sur_pain_avg_rank;
CREATE TABLE sur_pain_avg_rank AS
SELECT RANK() OVER(ORDER BY df.pain_avg DESC) as pain_avg_rank,
       df.provider_id, df.pain_avg
FROM filtered_df_survey_responses df;
--
DROP TABLE sur_Medicines_avg_rank;
CREATE TABLE sur_Medicines_avg_rank AS
SELECT RANK() OVER(ORDER BY df.Medicines_avg DESC) as Medicines_avg_rank,
       df.provider_id, df.Medicines_avg
FROM filtered_df_survey_responses df;
--
DROP TABLE sur_cleanq_avg_rank;
CREATE TABLE sur_cleanq_avg_rank AS
SELECT RANK() OVER(ORDER BY df.cleanq_avg DESC) as cleanq_avg_rank,
       df.provider_id, df.cleanq_avg
FROM filtered_df_survey_responses df;
--
DROP TABLE sur_disch_avg;
CREATE TABLE sur_disch_avg AS
SELECT RANK() OVER(ORDER BY df.disch_avg DESC) as disch_avg_rank,
       df.provider_id, df.disch_avg
FROM filtered_df_survey_responses df;
--
DROP TABLE sur_overall_avg_rank;
CREATE TABLE sur_overall_avg_rank AS
SELECT RANK() OVER(ORDER BY df.overall_avg DESC) as overall_avg_rank,
       df.provider_id, df.overall_avg
FROM filtered_df_survey_responses df;
--
DROP TABLE sur_HCAHPS_total_rank;
CREATE TABLE sur_HCAHPS_total_rank AS
SELECT RANK() OVER(ORDER BY df.HCAHPS_total_avg DESC) as HCAHPS_total_avg_rank,
       df.provider_id, df.HCAHPS_total_avg
FROM filtered_df_survey_responses df;
--
--
--
drop table patient_hosp_corr;
create table patient_hosp_corr as
select a.provider_id, a.hospital_name
b.bh_eff_avg_ed_rank, b.bh_eff_avg_hacp_rank, 
b.bh_eff_avg_hf_rank, b.bh_eff_avg_pc_rank, b.bh_eff_avg_scip_rank, b.bh_eff_avg_pdc_rank, 
b.bh_eff_avg_p_rank, b.bh_eff_avg_sc_rank, b.bh_eff_avg_bcptca_rank,
c.nur_avg_rank,
d.doc_avg_rank,
e.Responsiveness_Staff_avg_rank,
f.pain_avg_rank,
g.Medicines_avg_rank,
h.cleanq_avg_rank,
i.disch_avg_rank,
j.overall_avg_rank,
k.HCAHPS_total_avg_rank
from filtered_df_hospitals a
left join best_hospital_ranks b
on (a.provider_id = b.provider_id)
left join sur_nur_avg_rank c
on (a.provider_id = c.provider_id)
left join sur_doc_avg_rank d
on (a.provider_id = d.provider_id)
left join sur_Responsiveness_Staff_avg_rank e
on (a.provider_id = e.provider_id)
left join sur_pain_avg_rank f
on (a.provider_id = f.provider_id)
left join sur_Medicines_avg_rank g
on (a.provider_id = g.provider_id)
left join sur_cleanq_avg_rank h
on (a.provider_id = h.provider_id)
left join sur_disch_avg i
on (a.provider_id = i.provider_id)
left join sur_overall_avg_rank j
on (a.provider_id = j.provider_id)
left join sur_HCAHPS_total_rank k
on (a.provider_id = k.provider_id)
WHERE bh_eff_avg_ed_rank is NOT NULL
and bh_eff_avg_hacp_rank is NOT NULL
and bh_eff_avg_hf_rank is NOT NULL
and bh_eff_avg_pc_rank is NOT NULL
and bh_eff_avg_scip_rank is NOT NULL
and bh_eff_avg_pdc_rank is NOT NULL
and bh_eff_avg_p_rank is NOT NULL
and bh_eff_avg_sc_rank is NOT NULL
and bh_eff_avg_bcptca_rank is NOT NULL
and nur_avg_rank is NOT NULL
and doc_avg_rank is NOT NULL
and Responsiveness_Staff_avg_rank is NOT NULL
and pain_avg_rank is NOT NULL
and Medicines_avg_rank is NOT NULL
and cleanq_avg_rank is NOT NULL
and disch_avg_rank is NOT NULL
and overall_avg_rank is NOT NULL
and HCAHPS_total_avg_rank is NOT NULL;
---
---
DROP TABLE bh_eff_ed_var;
CREATE TABLE bh_eff_ed_var AS
SELECT provider_id, variance(score) AS bh_eff_ed_var FROM filtered_df_effective_care 
WHERE condition = 'Emergency Department'
GROUP BY provider_id
ORDER BY bh_eff_ed_var DESC;
-- 
DROP TABLE bh_eff_hacp_var;
CREATE TABLE bh_eff_hacp_var AS
SELECT provider_id, variance(score) AS bh_eff_hacp_var FROM filtered_df_effective_care 
WHERE condition = 'Heart Attack or Chest Pain'
GROUP BY provider_id
ORDER BY bh_eff_hacp_var DESC;
-- 
DROP TABLE bh_eff_hf_var;
CREATE TABLE bh_eff_hf_var AS
SELECT provider_id, variance(score) AS bh_eff_hf_var FROM filtered_df_effective_care 
WHERE condition = 'Heart Failure'
GROUP BY provider_id
ORDER BY bh_eff_hf_var DESC;
-- 
DROP TABLE bh_eff_pc_var;
CREATE TABLE bh_eff_pc_var AS
SELECT provider_id, variance(score) AS bh_eff_pc_var FROM filtered_df_effective_care 
WHERE condition = 'Preventive Care'
GROUP BY provider_id
ORDER BY bh_eff_pc_var DESC;
-- 
DROP TABLE bh_eff_scip_var;
CREATE TABLE bh_eff_scip_var AS
SELECT provider_id, variance(score) AS bh_eff_scip_var FROM filtered_df_effective_care 
WHERE condition = 'Surgical Care Improvement Project'
GROUP BY provider_id
ORDER BY bh_eff_scip_var DESC;
-- 
DROP TABLE bh_eff_pdc_var;
CREATE TABLE bh_eff_pdc_var AS
SELECT provider_id, variance(score) AS bh_eff_pdc_var FROM filtered_df_effective_care 
WHERE condition = 'Pregnancy and Delivery Care'
GROUP BY provider_id
ORDER BY bh_eff_pdc_var DESC;
-- 
DROP TABLE bh_eff_p_var;
CREATE TABLE bh_eff_p_var AS
SELECT provider_id, variance(score) AS bh_eff_p_var FROM filtered_df_effective_care 
WHERE condition = 'Pneumonia'
GROUP BY provider_id
ORDER BY bh_eff_p_var DESC;
-- 
DROP TABLE bh_eff_sc_var;
CREATE TABLE bh_eff_sc_var AS
SELECT provider_id, variance(score) AS bh_eff_sc_var FROM filtered_df_effective_care 
WHERE condition = 'Stroke Care'
GROUP BY provider_id
ORDER BY bh_eff_sc_var DESC;
-- 
DROP TABLE bh_eff_bcptca_var;
CREATE TABLE bh_eff_bcptca_var AS
SELECT provider_id, variance(score) AS bh_eff_bcptca_var FROM filtered_df_effective_care 
WHERE condition like '%Blood Clot Prevention%'
GROUP BY provider_id
ORDER BY bh_eff_bcptca_var DESC;
---
---
---
drop table master_hospital_vars;
create table master_hospital_vars as
select a.provider_id, a.hospital_name, a.state, 
b.bh_eff_ed_var,
c.bh_eff_hacp_var,
d.bh_eff_hf_var,
e.bh_eff_pc_var,
f.bh_eff_scip_var,
g.bh_eff_pdc_var,
h.bh_eff_p_var,
i.bh_eff_sc_var,
j.bh_eff_bcptca_var,
k.nur_avg_rank,
l.doc_avg_rank,
m.Responsiveness_Staff_avg_rank,
n.pain_avg_rank,
o.Medicines_avg_rank,
p.cleanq_avg_rank,
q.disch_avg_rank,
r.overall_avg_rank,
s.HCAHPS_total_avg_rank
from filtered_df_hospitals a
left join bh_eff_ed_var b
on (a.provider_id = b.provider_id)
left join bh_eff_hacp_var c
on (a.provider_id = c.provider_id)
left join bh_eff_hf_var d
on (a.provider_id = d.provider_id)
left join bh_eff_pc_var e
on (a.provider_id = e.provider_id)
left join bh_eff_scip_var f
on (a.provider_id = f.provider_id)
left join bh_eff_pdc_var g
on (a.provider_id = g.provider_id)
left join bh_eff_p_var h
on (a.provider_id = h.provider_id)
left join bh_eff_sc_var i
on (a.provider_id = i.provider_id)
left join bh_eff_bcptca_var j
on (a.provider_id = j.provider_id)
left join sur_nur_avg_rank k
on (a.provider_id = k.provider_id)
left join sur_doc_avg_rank l
on (a.provider_id = l.provider_id)
left join sur_Responsiveness_Staff_avg_rank m
on (a.provider_id = m.provider_id)
left join sur_pain_avg_rank n
on (a.provider_id = n.provider_id)
left join sur_Medicines_avg_rank o
on (a.provider_id = o.provider_id)
left join sur_cleanq_avg_rank p
on (a.provider_id = p.provider_id)
left join sur_disch_avg q
on (a.provider_id = q.provider_id)
left join sur_overall_avg_rank r
on (a.provider_id = r.provider_id)
left join sur_HCAHPS_total_rank s
on (a.provider_id = s.provider_id)
WHERE bh_eff_ed_var is NOT NULL
and bh_eff_hacp_var is NOT NULL
and bh_eff_hf_var is NOT NULL
and bh_eff_pc_var is NOT NULL
and bh_eff_scip_var is NOT NULL
and bh_eff_pdc_var is NOT NULL
and bh_eff_p_var is NOT NULL
and bh_eff_sc_var is NOT NULL
and bh_eff_bcptca_var is NOT NULL
and nur_avg_rank is NOT NULL
and doc_avg_rank is NOT NULL
and Responsiveness_Staff_avg_rank is NOT NULL
and pain_avg_rank is NOT NULL
and Medicines_avg_rank is NOT NULL
and cleanq_avg_rank is NOT NULL
and disch_avg_rank is NOT NULL
and overall_avg_rank is NOT NULL
and HCAHPS_total_avg_rank is NOT NULL;
