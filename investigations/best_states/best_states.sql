-- need to have run filtering_dataframes.sql before continue. This code investigates hospitals by state
-- Input: tables from filtering_dataframes.sql
-- Output: list of best overall state by overall score average
--
-- grab all of the filtered data from best_hospital_ranks (information in transformation.sql comments.
-- Only will consider hospitals with all 9 conditions in the table, and group by state and average each state.
-- Lower rank is better, and display in order from smallest to largest.
SELECT state, round((avg(bh_eff_avg_ed_rank) + avg(bh_eff_avg_hacp_rank) + avg(bh_eff_avg_hf_rank) + avg(bh_eff_avg_pc_rank) + avg(bh_eff_avg_scip_rank) + avg(bh_eff_avg_pdc_rank) + avg(bh_eff_avg_p_rank) + avg(bh_eff_avg_sc_rank) + avg(bh_eff_avg_bcptca_rank))/ 9.0, 2) as state_rank_avg
FROM best_hospital_ranks
GROUP BY state
ORDER BY state_rank_avg;
