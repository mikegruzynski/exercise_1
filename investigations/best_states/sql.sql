--
--
--
SELECT state, round((avg(bh_eff_avg_ed_rank) + avg(bh_eff_avg_hacp_rank) + avg(bh_eff_avg_hf_rank) + avg(bh_eff_avg_pc_rank) + avg(bh_eff_avg_scip_rank) + avg(bh_eff_avg_pdc_rank) + avg(bh_eff_avg_p_rank) + avg(bh_eff_avg_sc_rank) + avg(bh_eff_avg_bcptca_rank))/ 9.0, 2) as state_rank_avg
FROM best_hospital_ranks
GROUP BY state
ORDER BY state_rank_avg
WHERE state_rank_avg is NOT NULL;
