--
--
--
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
