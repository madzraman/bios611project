.PHONY: clean

clean:
	rm -rf figures
	rm -rf derived_data
	rm -rf report.html
	mkdir -p figures
	mkdir -p derived_data
	
data_cleaning: \
	R_scripts/data_clean.R \
	source_data/flight_delays_2022_onethird.csv
		Rscript R_scripts/data_clean.R
	
eda_figures: \
	R_scripts/flights_by_month.R \
	R_scripts/weatherdelays_by_airline.R \
	derived_data/df_original_cleaned.csv
		Rscript R_scripts/flights_by_month.R
		Rscript R_scripts/weatherdelays_by_airline.R
	
pca: \
	R_scripts/pca.R \
	derived_data/df_original_cleaned.csv \
	derived_data/df_original_cleaned_numeric.csv
		Rscript R_scripts/pca.R

report: \
	clean \
	data_cleaning \
	eda_figures \
	pca \
	report.rmd
		Rscript -e "rmarkdown::render('report.rmd',output_format='html_document')"
	
