.PHONY: clean

clean:
	rm -rf figures
	rm -rf derived_data
	mkdir -p figures
	mkdir -p derived_data
	
derived_data/df_original_cleaned.csv: R_scripts/data_clean.R source_data/flight_delays_2022_onethird.csv
	Rscript R_scripts/data_clean.R
	
figures/flightcount_by_month.png: R_scripts/flights_by_month.R derived_data/df_original_cleaned.csv
	Rscript R_scripts/flights_by_month.R
	
figures/weatherdelays_by_airline.png: R_scripts/weatherdelays_by_airline.R derived_data/df_original_cleaned.csv
	Rscript R_scripts/weatherdelays_by_airline.R
	
derived_data/df_original_cleaned_numeric.csv: R_scripts/data_clean.R derived_data/df_original_cleaned.csv
	Rscript R_scripts/data_clean.R

figures/explained_variance.png: R_scripts/pca.R derived_data/df_original_cleaned.csv
	Rscript R_scripts/pca.R
	
figures/pc1_vs_pc2.png: R_scripts/pca.R derived_data/df_original_cleaned.csv
	Rscript R_scripts/pca.R
	
	
