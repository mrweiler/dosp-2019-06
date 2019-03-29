# ---- download data
httr::GET(url = "http://www.statistics.gr/documents/20181/995819/Deaths+-+Causes+of+death+%28ICD-9%29+%28+2000+-+2016+%29/13fcec78-6b8a-4d04-bca6-e84d2d127887?version=1.0",
      httr::write_disk(path = "data/causes_of_death.xlsx", overwrite = TRUE))

# ---- import data
year <- 2000
cod <- readxl::read_xlsx(path = "data/causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- extract relevant data
# select suicides
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders
suicide <- suicide[1,]
# add to new data frame with year
dataset <- dplyr::tibble(year = year,
       suicides = suicide$`Deaths in Greece during 2000, by age and cause`)

