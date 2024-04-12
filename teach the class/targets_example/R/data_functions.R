#' Clean UT Household Travel Survey households
#' 
#' @param hh HH file from UT HHTS
#' @export
clean_ut_hh <- function(hh_file) {
	hh <- read_csv(hh_file)
	
	cleaned_hh <- hh %>%
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
	
	return(cleaned_hh)
}

#' Clean the National Household Travel Survey persons
#' 
#' @param per Per file from NHTS
#' @export
clean_nhts_per <- function(per_file) {
	per <- read_sav(per_file)
	
	cleaned_per <- per %>% 
		mutate(
			HHFAMINC_cat = recode(
				HHFAMINC,
				# "01" = "1", "02" = "1", "03" = "1", "04" = "1", "05" = "1",
				"01" = "1", "02" = "1", "03" = "1", "04" = "2", "05" = "2",
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
	
	return(cleaned_per)
}
