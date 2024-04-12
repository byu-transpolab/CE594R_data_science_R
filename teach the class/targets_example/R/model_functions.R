#' Estimate vehicle ownership model (mlogit)
#' 
#' @param ut_hh HH table from UT HHTS
#' @export
estimate_veho <- function(ut_hh) {
	format_hh <- ut_hh %>% 
		mutate(across(-c(weight), as.character)) %>% 
		dfidx(choice = "num_vehicles_cat", shape = "wide")
	
	null_model <- mlogit(
		formula = num_vehicles_cat ~ 1, 
		data = format_hh,
		weights = format_hh$weight
	)
	
	models <- list(
		update(null_model, . ~ . - 1 | hh_income_cat + hh_adults_cat),
		update(null_model, . ~ . - 1 | hh_income_cat + workers_cat),
		update(null_model, . ~ . - 1 | hh_income_cat),
		update(null_model, . ~ . - 1 | hh_adults_cat),
		update(null_model, . ~ . - 1 | workers_cat)
	)
	
	return(models)
}

#' Estimate WFH model (mlogit)
#' 
#' @param nhts_per Persons table from NHTS
#' @export
estimate_wfh <- function(nhts_per) {
	format_per <- nhts_per %>% 
		filter(
		R_SEX %in% c("01", "02"),
		as.integer(zap_labels(HHFAMINC_cat)) > 0,
		WORKER == "01", 
		!is.na(WRKLOC)
	) %>%
		dfidx(choice = "WRKLOC", shape = "wide")
	
	null_model <- mlogit(
		formula = WRKLOC ~ 1,
		data = format_per,
		weights = format_per$WTPERFIN
	)
	
	models <- list(
		update(null_model, . ~ . | LIF_CYC_cat + R_SEX),
		update(null_model, . ~ . | HHVEHCNT_cat + R_SEX),
		update(null_model, . ~ . | LIF_CYC_cat + HHVEHCNT_cat + R_SEX),
		update(null_model, . ~ . | HHFAMINC_cat + HHVEHCNT_cat + R_SEX),
		update(null_model, . ~ . | LIF_CYC_cat + HHFAMINC_cat + R_SEX),
		update(null_model, . ~ . | LIF_CYC_cat + HHVEHCNT_cat + HHFAMINC_cat + R_SEX)
	)
	
	return(models)
}
