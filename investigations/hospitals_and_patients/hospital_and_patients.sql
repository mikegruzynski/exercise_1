-- need to have run filtering_dataframes.sql before continue. This code investigates hospitals quality overall
-- Input: tables from filtering_dataframes.sql
-- Output: correlation of hospital quality avg rank vs survey avg rank AND hospital variability vs survey avg rank
--
-- Smash together each of the 9 categories from effective care ranks with each rank from the average of survey responses of 9 
-- categories. I choose to do this in order to get both set of variables (avg rank of eff table and avg rank of survey into
-- same units for correlation investigation)
drop table patient_hosp_corr;
create table patient_hosp_corr as
select a.provider_id, a.hospital_name,
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
-- Create final average for effective table and survey response table
drop table patient_hosp_corr_rank;
create table patient_hosp_corr_rank as
select provider_id, hospital_name,
(bh_eff_avg_ed_rank +  bh_eff_avg_hacp_rank +  bh_eff_avg_hf_rank +  bh_eff_avg_pc_rank +  bh_eff_avg_scip_rank +  bh_eff_avg_pdc_rank +  bh_eff_avg_p_rank +  bh_eff_avg_sc_rank +  bh_eff_avg_bcptca_rank)/9 as effective_rank_avg,
(nur_avg_rank +  doc_avg_rank +  Responsiveness_Staff_avg_rank +  pain_avg_rank +  Medicines_avg_rank +  cleanq_avg_rank +  disch_avg_rank +  overall_avg_rank +  HCAHPS_total_avg_rank)/9 as survey_rank_avg
FROM patient_hosp_corr;
-- Write out the correltion of above table
select corr(effective_rank_avg, survey_rank_avg) FROM patient_hosp_corr_rank;
-- Smash together each of the 9 categories from effective care ranks with each variance from the average of survey responses of 9 
-- categories.
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
-- Create final average for variance of procedures from effective table table and survey rank response table
drop table var_corr_rank;
create table var_corr_rank as
select provider_id, hospital_name,
(bh_eff_ed_var +  bh_eff_hacp_var +  bh_eff_hf_var +  bh_eff_pc_var +  bh_eff_scip_var +  bh_eff_pdc_var +  bh_eff_p_var +  bh_eff_sc_var +  bh_eff_bcptca_var)/9 as effective_var_avg,
(nur_avg_rank +  doc_avg_rank +  Responsiveness_Staff_avg_rank +  pain_avg_rank +  Medicines_avg_rank +  cleanq_avg_rank +  disch_avg_rank +  overall_avg_rank +  HCAHPS_total_avg_rank)/9 as survey_rank_avg
FROM master_hospital_vars;
--- Correlation value between variance and survey response rank average.
select corr(effective_var_avg, survey_rank_avg) FROM var_corr_rank;
