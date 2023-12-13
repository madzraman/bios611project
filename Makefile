.PHONY: clean

clean: 
	rm -rf figures
	rm -rf derived_data
	rm -rf report.html
	mkdir -p figures
	mkdir -p derived_data
	
# Make clean dataset and clean dataset with only numeric variables.
data_cleaning: \
	R_scripts/data_clean.R \
	source_data/flight_delays_2022_onethird.csv
		Rscript R_scripts/data_clean.R

# Create exploratory data analysis figures 	
eda_figures: \
	R_scripts/flights_by_month.R \
	R_scripts/histogram_departure_times.R \
	R_scripts/weatherdelays_by_airline.R \
	R_scripts/overall_delays_by_city.R \
	derived_data/df_original_cleaned.csv
		Rscript R_scripts/flights_by_month.R
		Rscript R_scripts/histogram_departure_times.R
		Rscript R_scripts/weatherdelays_by_airline.R
		Rscript R_scripts/overall_delays_by_city.R
	
# Run PCA and create related figures
pca: \
	R_scripts/pca.R \
	derived_data/df_original_cleaned.csv \
	derived_data/df_original_cleaned_numeric.csv
		Rscript R_scripts/pca.R

# Run Delay Types Correlation Matrix/Regression Model and create related figures
delay_types_modeling: \
	R_scripts/correlations.R \
	R_scripts/delay_types_regression.R \
	derived_data/df_original_cleaned_numeric.csv 
		Rscript R_scripts/correlations.R
		Rscript R_scripts/delay_types_regression.R


# Make final report
report: \
	clean \
	data_cleaning \
	eda_figures \
	pca \
	delay_types_modeling \
	report.Rmd
		Rscript -e "rmarkdown::render('report.Rmd',output_format='html_document')"
	
