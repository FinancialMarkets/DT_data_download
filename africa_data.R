library(DT)
library(readr)
library(htmlwidgets)

## options(browser = "/usr/bin/firefox")

data <- read_csv("../african_latest_data.csv")

data$countryterritoryCode <- tolower(data$countryterritoryCode)

data <- data[, !(names(data) %in% c("day", "month", "year", "continentExp"))]

data <- data[, c(1, 4, 5, 6, 2, 3, 8, 9, 7)]

dt <- datatable(data, rownames = FALSE, colnames = c("Date", "Country", "iso2", "iso3", "Cases", "Deaths", "Cumulative Cases", "Cumulative Deaths", "Population (2018)"),
          extensions = 'Buttons',
                            options = list(
                                ## paging = TRUE,
                                ## searching = TRUE,
                                ## fixedColumns = TRUE,
                                ## autoWidth = TRUE,
                                ## ordering = TRUE,
                                dom = 'Bfrtip',
                                buttons = c('copy', 'csv', 'excel', 'pdf', 'print')))

saveWidget(dt, "index.html")
