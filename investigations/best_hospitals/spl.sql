DROP TABLE bh_eff_ed_avg;
CREATE TABLE bh_eff_ed_avg AS
SELECT hospital_name, sum(sample * score)/ sum(sample) AS bh_eff_ed_avg FROM filtered_df_effective_care 
WHERE condition = 'Emergency Department'
GROUP BY hospital_name
ORDER BY bh_eff_ed_avg DESC;
-- 
DROP TABLE bh_eff_hacp_avg;
CREATE TABLE bh_eff_hacp_avg AS
SELECT hospital_name, sum(sample * score)/ sum(sample) AS bh_eff_hacp_avg FROM filtered_df_effective_care 
WHERE condition = 'Heart Attack or Chest Pain'
GROUP BY hospital_name
ORDER BY bh_eff_hacp_avg DESC;
-- 
DROP TABLE bh_eff_hf_avg;
CREATE TABLE bh_eff_hf_avg AS
SELECT hospital_name, sum(sample * score)/ sum(sample) AS bh_eff_hf_avg FROM filtered_df_effective_care 
WHERE condition = 'Heart Failure'
GROUP BY hospital_name
ORDER BY bh_eff_hf_avg DESC;
-- 
DROP TABLE bh_eff_pc_avg;
CREATE TABLE bh_eff_pc_avg AS
SELECT hospital_name, sum(sample * score)/ sum(sample) AS bh_eff_pc_avg FROM filtered_df_effective_care 
WHERE condition = 'Preventive Care'
GROUP BY hospital_name
ORDER BY bh_eff_pc_avg DESC;
-- 
DROP TABLE bh_eff_scip_avg;
CREATE TABLE bh_eff_scip_avg AS
SELECT hospital_name, sum(sample * score)/ sum(sample) AS bh_eff_scip_avg FROM filtered_df_effective_care 
WHERE condition = 'Surgical Care Improvement Project'
GROUP BY hospital_name
ORDER BY bh_eff_scip_avg DESC;
-- 
DROP TABLE bh_eff_pdc_avg;
CREATE TABLE bh_eff_pdc_avg AS
SELECT hospital_name, sum(sample * score)/ sum(sample) AS bh_eff_pdc_avg FROM filtered_df_effective_care 
WHERE condition = 'Pregnancy and Delivery Care'
GROUP BY hospital_name
ORDER BY bh_eff_pdc_avg DESC;
-- 
DROP TABLE bh_eff_p_avg;
CREATE TABLE bh_eff_p_avg AS
SELECT hospital_name, sum(sample * score)/ sum(sample) AS bh_eff_p_avg FROM filtered_df_effective_care 
WHERE condition = 'Pneumonia'
GROUP BY hospital_name
ORDER BY bh_eff_p_avg DESC;
-- 
DROP TABLE bh_eff_sc_avg;
CREATE TABLE bh_eff_sc_avg AS
SELECT hospital_name, sum(sample * score)/ sum(sample) AS bh_eff_sc_avg FROM filtered_df_effective_care 
WHERE condition = 'Stroke Care'
GROUP BY hospital_name
ORDER BY bh_eff_sc_avg DESC;
-- 
DROP TABLE bh_eff_bcptca_avg;
CREATE TABLE bh_eff_bcptca_avg AS
SELECT hospital_name, sum(sample * score)/ sum(sample) AS bh_eff_bcptca_avg FROM filtered_df_effective_care 
WHERE condition like '%Blood Clot Prevention%'
GROUP BY hospital_name
ORDER BY bh_eff_bcptca_avg DESC;
-- 
--
--
DROP TABLE bh_eff_ed_rank;
CREATE TABLE bh_eff_ed_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_ed_avg DESC) as bh_eff_avg_ed_rank,
       df.hospital_name,df.bh_eff_ed_avg
FROM bh_eff_ed_avg df;
-- 
DROP TABLE bh_eff_hacp_rank;
CREATE TABLE bh_eff_hacp_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_hacp_avg DESC) as bh_eff_avg_hacp_rank,
       df.hospital_name,df.bh_eff_hacp_avg
FROM bh_eff_hacp_avg df;
-- 
DROP TABLE bh_eff_hf_rank;
CREATE TABLE bh_eff_hf_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_hf_avg DESC) as bh_eff_avg_hf_rank,
       df.hospital_name,df.bh_eff_hf_avg
FROM bh_eff_hf_avg df;
-- 
DROP TABLE bh_eff_pc_rank;
CREATE TABLE bh_eff_pc_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_pc_avg DESC) as bh_eff_avg_pc_rank,
       df.hospital_name,df.bh_eff_pc_avg
FROM bh_eff_pc_avg df;
-- 
DROP TABLE bh_eff_scip_rank;
CREATE TABLE bh_eff_scip_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_scip_avg DESC) as bh_eff_avg_scip_rank,
       df.hospital_name,df.bh_eff_scip_avg
FROM bh_eff_scip_avg df;
-- 
DROP TABLE bh_eff_pdc_rank;
CREATE TABLE bh_eff_pdc_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_pdc_avg DESC) as bh_eff_avg_pdc_rank,
       df.hospital_name,df.bh_eff_pdc_avg
FROM bh_eff_pdc_avg df;
-- 
DROP TABLE bh_eff_p_rank;
CREATE TABLE bh_eff_p_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_p_avg DESC) as bh_eff_avg_p_rank,
       df.hospital_name,df.bh_eff_p_avg
FROM bh_eff_p_avg df;
-- 
DROP TABLE bh_eff_sc_rank;
CREATE TABLE bh_eff_sc_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_sc_avg DESC) as bh_eff_avg_sc_rank,
       df.hospital_name,df.bh_eff_sc_avg
FROM bh_eff_sc_avg df;
-- 
DROP TABLE bh_eff_bcptca_rank;
CREATE TABLE bh_eff_bcptca_rank AS
SELECT RANK() OVER(ORDER BY df.bh_eff_bcptca_avg DESC) as bh_eff_avg_bcptca_rank,
       df.hospital_name,df.bh_eff_bcptca_avg
FROM bh_eff_bcptca_avg df;
--
