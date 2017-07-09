-- Grab the table called best_hospital_ranks_filtered ( explanation in transformation.sql and average the ranks
-- in the filtered dataframe for an overall rank average. 1 is the best, so the lower the number, the better overall
-- the hospital is and show top 10 from smallest to largest
SELECT hospital_name, round((bh_eff_avg_ed_rank + bh_eff_avg_hacp_rank + bh_eff_avg_hf_rank + bh_eff_avg_pc_rank + bh_eff_avg_scip_rank + bh_eff_avg_pdc_rank + bh_eff_avg_p_rank + bh_eff_avg_sc_rank + bh_eff_avg_bcptca_rank)/9, 2) as avg_rank
FROM best_hospital_ranks_filtered  
ORDER BY avg_rank
LIMIT 10;
