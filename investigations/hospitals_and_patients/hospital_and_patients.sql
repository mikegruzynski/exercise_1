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
--
drop table patient_hosp_corr_rank;
create table patient_hosp_corr_rank as
select provider_id, hospital_name,
(bh_eff_avg_ed_rank +  bh_eff_avg_hacp_rank +  bh_eff_avg_hf_rank +  bh_eff_avg_pc_rank +  bh_eff_avg_scip_rank +  bh_eff_avg_pdc_rank +  bh_eff_avg_p_rank +  bh_eff_avg_sc_rank +  bh_eff_avg_bcptca_rank)/9 as effective_rank_avg,
(nur_avg_rank +  doc_avg_rank +  Responsiveness_Staff_avg_rank +  pain_avg_rank +  Medicines_avg_rank +  cleanq_avg_rank +  disch_avg_rank +  overall_avg_rank +  HCAHPS_total_avg_rank)/9 as survey_rank_avg
FROM patient_hosp_corr;
--
select corr(effective_rank_avg, survey_rank_avg) FROM patient_hosp_corr_rank;

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
--
drop table patient_hosp_corr_rank;
create table patient_hosp_corr_rank as
select provider_id, hospital_name,
(bh_eff_avg_ed_rank +  bh_eff_avg_hacp_rank +  bh_eff_avg_hf_rank +  bh_eff_avg_pc_rank +  bh_eff_avg_scip_rank +  bh_eff_avg_pdc_rank +  bh_eff_avg_p_rank +  bh_eff_avg_sc_rank +  bh_eff_avg_bcptca_rank)/9 as effective_rank_avg,
(nur_avg_rank +  doc_avg_rank +  Responsiveness_Staff_avg_rank +  pain_avg_rank +  Medicines_avg_rank +  cleanq_avg_rank +  disch_avg_rank +  overall_avg_rank +  HCAHPS_total_avg_rank)/9 as survey_rank_avg
FROM patient_hosp_corr;
--
select corr(effective_rank_avg, survey_rank_avg) FROM patient_hosp_corr_rank;
