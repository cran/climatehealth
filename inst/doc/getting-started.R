## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment  = "#>",
  eval     = FALSE
)

## ----install-cran-------------------------------------------------------------
# install.packages("climatehealth")

## ----install-github-----------------------------------------------------------
# install.packages("remotes")
# remotes::install_github("onssoschi/climatehealth")

## ----install-optional---------------------------------------------------------
# climatehealth::install_INLA()
# climatehealth::install_terra()

## ----load---------------------------------------------------------------------
# library(climatehealth)

## ----temp-mortality-basic-----------------------------------------------------
# res <- climatehealth::temp_mortality_do_analysis(
#   data_path        = "path/to/your/data.csv",
#   date_col         = "date",
#   region_col       = "region",
#   temperature_col  = "tmean",
#   health_outcome_col = "deaths",
#   population_col   = "population",
#   meta_analysis    = FALSE,
#   save_fig         = FALSE,
#   save_csv         = FALSE
# )

## ----temp-mortality-results---------------------------------------------------
# res$data_raw          # the input data as loaded
# res$analysis_results  # model coefficients and confidence intervals
# res$meta_results      # pooled estimates (when meta_analysis = TRUE)

## ----temp-mortality-covariates------------------------------------------------
# res <- climatehealth::temp_mortality_do_analysis(
#   data_path          = "path/to/your/data.csv",
#   date_col           = "date",
#   region_col         = "region",
#   temperature_col    = "tmean",
#   health_outcome_col = "deaths",
#   population_col     = "population",
#   independent_cols   = c("humidity", "ozone"),
#   control_cols       = c("dow", "holiday_flag"),
#   meta_analysis      = FALSE,
#   save_fig           = FALSE,
#   save_csv           = FALSE
# )

## ----temp-mortality-meta------------------------------------------------------
# res <- climatehealth::temp_mortality_do_analysis(
#   data_path          = "path/to/your/data.csv",
#   date_col           = "date",
#   region_col         = "region",
#   temperature_col    = "tmean",
#   health_outcome_col = "deaths",
#   population_col     = "population",
#   country            = "National",
#   meta_analysis      = TRUE,
#   save_fig           = FALSE,
#   save_csv           = FALSE
# )

## ----air-pollution------------------------------------------------------------
# res <- climatehealth::air_pollution_do_analysis(
#   data_path       = "path/to/your/data.csv",
#   save_outputs    = FALSE,
#   run_descriptive = TRUE,
#   run_power       = TRUE
# )

## ----air-pollution-standards--------------------------------------------------
# res <- climatehealth::air_pollution_do_analysis(
#   data_path         = "path/to/your/data.csv",
#   reference_standards = list(
#     list(value = 15, name = "WHO"),
#     list(value = 25, name = "National")
#   ),
#   save_outputs = FALSE,
#   run_power    = TRUE
# )

## ----wildfire-----------------------------------------------------------------
# res <- climatehealth::wildfire_do_analysis(
#   data_path          = "path/to/your/data.csv",
#   date_col           = "date",
#   region_col         = "region",
#   exposure_col       = "pm25_fire",
#   health_outcome_col = "respiratory_admissions",
#   population_col     = "population",
#   meta_analysis      = FALSE,
#   save_fig           = FALSE,
#   save_csv           = FALSE
# )

## ----suicides-----------------------------------------------------------------
# res <- climatehealth::suicides_heat_do_analysis(
#   data_path          = "path/to/your/data.csv",
#   date_col           = "date",
#   region_col         = "region",
#   temperature_col    = "tmean",
#   health_outcome_col = "suicides",
#   population_col     = "population",
#   meta_analysis      = FALSE,
#   save_fig           = FALSE,
#   save_csv           = FALSE
# )

## ----diarrhea-----------------------------------------------------------------
# res <- climatehealth::diarrhea_do_analysis(
#   data_path          = "path/to/your/data.csv",
#   date_col           = "date",
#   region_col         = "region",
#   temperature_col    = "tmean",
#   health_outcome_col = "diarrhea_cases",
#   population_col     = "population",
#   meta_analysis      = FALSE,
#   save_fig           = FALSE,
#   save_csv           = FALSE
# )

## ----malaria------------------------------------------------------------------
# res <- climatehealth::malaria_do_analysis(
#   data_path          = "path/to/your/data.csv",
#   date_col           = "date",
#   region_col         = "region",
#   temperature_col    = "tmean",
#   health_outcome_col = "malaria_cases",
#   population_col     = "population",
#   meta_analysis      = FALSE,
#   save_fig           = FALSE,
#   save_csv           = FALSE
# )

## ----descriptive-basic--------------------------------------------------------
# df <- read.csv("path/to/your/data.csv")
# 
# desc <- climatehealth::run_descriptive_stats(
#   data               = df,
#   output_path        = "path/to/output/folder",
#   aggregation_column = "region",
#   dependent_col      = "deaths",
#   independent_cols   = c("tmean", "humidity", "rainfall"),
#   plot_corr_matrix   = TRUE,
#   plot_dist          = TRUE,
#   plot_na_counts     = TRUE,
#   plot_scatter       = TRUE,
#   plot_box           = TRUE,
#   create_base_dir    = TRUE
# )

## ----descriptive-advanced-----------------------------------------------------
# desc <- climatehealth::run_descriptive_stats(
#   data               = df,
#   output_path        = "path/to/output/folder",
#   aggregation_column = "region",
#   population_col     = "population",
#   dependent_col      = "deaths",
#   independent_cols   = c("tmean", "humidity", "rainfall"),
#   units = c(
#     deaths    = "count",
#     tmean     = "C",
#     humidity  = "%",
#     rainfall  = "mm"
#   ),
#   timeseries_col     = "date",
#   plot_corr_matrix   = TRUE,
#   plot_dist          = TRUE,
#   plot_ma            = TRUE,
#   ma_days            = 30,
#   plot_seasonal      = TRUE,
#   plot_regional      = TRUE,
#   plot_total         = TRUE,
#   detect_outliers    = TRUE,
#   calculate_rate     = TRUE,
#   create_base_dir    = TRUE
# )

## ----descriptive-results------------------------------------------------------
# desc$run_output_path      # folder where all outputs were saved
# desc$region_output_paths  # per-region output sub-folders

## ----saving-------------------------------------------------------------------
# res <- climatehealth::temp_mortality_do_analysis(
#   data_path          = "path/to/your/data.csv",
#   date_col           = "date",
#   region_col         = "region",
#   temperature_col    = "tmean",
#   health_outcome_col = "deaths",
#   population_col     = "population",
#   meta_analysis      = TRUE,
#   save_fig           = TRUE,
#   save_csv           = TRUE,
#   output_folder_path = "path/to/output/folder"
# )

## ----error-handling-----------------------------------------------------------
# result <- tryCatch(
#   climatehealth::temp_mortality_do_analysis(
#     data_path          = "path/to/your/data.csv",
#     date_col           = "wrong_column_name",
#     health_outcome_col = "deaths",
#     population_col     = "population"
#   ),
#   climate_error = function(e) {
#     message("climatehealth error: ", conditionMessage(e))
#     NULL
#   }
# )

## ----is-climate-error---------------------------------------------------------
# climatehealth::is_climate_error(e)

