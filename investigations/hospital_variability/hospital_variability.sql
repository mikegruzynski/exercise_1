-- need to have run filtering_dataframes.sql before continue. This code investigates hospitals variability
-- Input: tables from filtering_dataframes.sql
-- Output: variability of each of the 9 conditions
--
-- grab all of the filtered data from best_hospital_ranks (information in transformation.sql comments.
-- Only will consider hospitals with all 9 conditions in the table, and group by state and average each state.
-- each column shows the variance of the procedure.
-- Column 1: Emergency Department
-- Column 2: Heart Attack or Chest Pain
-- Column 3: Heart Failure
-- Column 4: Preventive Care
-- Column 5: Surgical Care Improvement Project
-- Column 6: Pregnancy and Delivery Care
-- Column 7: Pnuemonia
-- Column 8: Stroke Care
-- Column 9: Blood Clot
SELECT round(avg(bh_eff_ed_avg*bh_eff_ed_avg) -  AVG(bh_eff_ed_avg)*AVG(bh_eff_ed_avg), 2) as var_ed,
round(avg(bh_eff_hacp_avg*bh_eff_hacp_avg) -  AVG(bh_eff_hacp_avg)*AVG(bh_eff_hacp_avg), 2) as var_hacp,
round(avg(bh_eff_hf_avg*bh_eff_hf_avg) -  AVG(bh_eff_hf_avg)*AVG(bh_eff_hf_avg), 2) as var_hf,
round(avg(bh_eff_pc_avg*bh_eff_pc_avg) -  AVG(bh_eff_pc_avg)*AVG(bh_eff_pc_avg), 2) as var_pc,
round(avg(bh_eff_scip_avg*bh_eff_scip_avg) -  AVG(bh_eff_scip_avg)*AVG(bh_eff_scip_avg), 2) as var_scip,
round(avg(bh_eff_pdc_avg*bh_eff_pdc_avg) -  AVG(bh_eff_pdc_avg)*AVG(bh_eff_pdc_avg), 2) as var_pdc,
round(avg(bh_eff_p_avg*bh_eff_p_avg) -  AVG(bh_eff_p_avg)*AVG(bh_eff_p_avg), 2) as var_p,
round(avg(bh_eff_sc_avg*bh_eff_sc_avg) -  AVG(bh_eff_sc_avg)*AVG(bh_eff_sc_avg), 2) as var_sc,
round(avg(bh_eff_bcptca_avg*bh_eff_bcptca_avg) -  AVG(bh_eff_bcptca_avg)*AVG(bh_eff_bcptca_avg), 2) as var_bcptca
FROM best_hospital_ranks;
