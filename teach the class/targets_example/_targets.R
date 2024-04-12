library(targets)
library(tarchetypes)

tar_option_set(
	packages = c("tidyverse", "mlogit", "dfidx", "labelled", "haven")
)

source("R/data_functions.R")
source("R/model_functions.R")
# Use `tar_source()` to automatically source all R files instead

tar_plan(
	tar_file(utah_hhts_hh, "data/ut_hhts/ut_hhts_2012_hh_data.csv.gz"),
	ut_hh = clean_ut_hh(utah_hhts_hh),
	
	tar_file(nhts_perpub, "data/nhts/PERPUB.sav.gz"),
	nhts_per = clean_nhts_per(nhts_perpub),
	
	veho_models = estimate_veho(ut_hh),
	wfh_models = estimate_wfh(nhts_per)
)
