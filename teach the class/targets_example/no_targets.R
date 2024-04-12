library(tidyverse)
library(mlogit)
library(haven)
library(labelled)
library(dfidx)

#### Data ####
ut_hh <- read_csv("data/ut_hhts/ut_hhts_2012_hh_data.csv.gz") %>% 
	mutate(
		# hh_id = record_ID,
		weight,
		hh_adults_cat = pmin(hh_adults, 4),
		workers_cat = workers4,
		hh_income_cat,
		num_vehicles_cat,
		is_children = hh_children > 0,
		hh_children = pmin(hh_children, 3),
		.keep = "none",
		.before = 1,
	)

nhts_per <- read_sav("data/nhts/PERPUB.sav.gz") %>% 
	mutate(
		HHFAMINC_cat = recode(
			HHFAMINC,
			"01" = "1", "02" = "1", "03" = "1", "04" = "1", "05" = "1",
			"06" = "2", "07" = "2",
			"08" = "3", "09" = "3",
			"10" = "4", "11" = "4",
			.combine_value_labels = TRUE
		),
		HHVEHCNT_cat = labelled(
			if_else(HHVEHCNT > 3, 3, HHVEHCNT),
			label = "Total number of vehicles in household"
		),
		LIF_CYC_cat = labelled(
			case_match(
				as.character(LIF_CYC),
				"03" ~ "1",
				"04" ~ "2",
				.default = "3"
			),
			c(
				"1 adult, youngest child 0-5" = "1",
				"2+ adults, youngest child 0-5" = "2",
				"No children 0-5" = "3")
		),
		label = "Simplified Life Cycle classification for the household"
	) %>% 
	filter(
		MSACAT == "03"
	)


#### Vehicle ownership ####
format_ut_hh_veho <- ut_hh %>% 
	mutate(across(-c(weight), as.character)) %>% 
	dfidx(choice = "num_vehicles_cat", shape = "wide")

veho_null_model <-  mlogit(
	formula = num_vehicles_cat ~ 1, 
	data = format_ut_hh_veho,
	weights = format_ut_hh_veho$weight
)

veho_models <- list(
	update(veho_null_model, . ~ . | hh_income_cat + hh_adults_cat),
	update(veho_null_model, . ~ . | hh_income_cat + workers_cat),
	update(veho_null_model, . ~ . | hh_income_cat),
	update(veho_null_model, . ~ . | hh_adults_cat),
	update(veho_null_model, . ~ . | workers_cat)
)


#### WFH ####
format_nhts_per_wfh <- nhts_per %>%
	filter(
		R_SEX %in% c("01", "02"),
		as.integer(zap_labels(HHFAMINC_cat)) > 0,
		WORKER == "01", 
		!is.na(WRKLOC)
	) %>%
	dfidx(choice = "WRKLOC", shape = "wide")

wfh_null_model <- mlogit(
	formula = WRKLOC ~ 1,
	data = format_nhts_per_wfh,
	weights = format_nhts_per_wfh$WTPERFIN
)

models <- list(
	update(wfh_null_model, . ~ . | LIF_CYC_cat + R_SEX),
	update(wfh_null_model, . ~ . | HHVEHCNT_cat + R_SEX),
	update(wfh_null_model, . ~ . | LIF_CYC_cat + HHVEHCNT_cat + R_SEX),
	update(wfh_null_model, . ~ . | HHFAMINC_cat + HHVEHCNT_cat + R_SEX),
	update(wfh_null_model, . ~ . | LIF_CYC_cat + HHFAMINC_cat + R_SEX),
	update(wfh_null_model, . ~ . | LIF_CYC_cat + HHVEHCNT_cat + HHFAMINC_cat + R_SEX)
)
