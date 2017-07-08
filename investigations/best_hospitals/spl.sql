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
