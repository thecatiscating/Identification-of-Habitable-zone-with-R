##viewing all the data
data()

##accessing data
data(mtcars)
View(mtcars)

##accessing different types of files
read_csv()#: comma-separated values (.csv) files

read_tsv()#: tab-separated values files

read_delim()#: general delimited files

read_fwf()#: fixed-width files

read_table()#: tabular files where columns are separated by white-space

read_log()#: web log files

##accessing pre-defined and installed files
library(readr)
readr_example()
read_csv(readr_example("mtcars.csv"))

##accessing excel data
library(readxl)
readxl_example()
read_excel(readxl_example("deaths.xlsx"))
excel_sheets(readxl_example("deaths.xlsx"))

##hotel data
bookings_df <- read_csv("hotel_bookings.csv") ##set the working directory to R moment
head(bookings_df)
View(bookings_df)
new_df <- select(bookings_df, adr, adults)
mutate(new_df, total = adr/adults)

##hotel data number cleaning
bookings_df <- read_csv(
  "hotel_bookings.csv") ##set the working directory to R moment
head(bookings_df)
trimmed_df <- bookings_df %>% select("hotel", "is_canceled", "lead_time") %>% rename(hotel_type = hotel)
View(trimmed_df)

##unite functions and seperate
bookings_df <- read_csv("hotel_bookings.csv") ##set the working directory to R moment
head(bookings_df)
example_untied <- bookings_df %>% 
  select(arrival_date_year, arrival_date_month) %>% 
  unite(arrival_month_and_year, c("arrival_date_month", "arrival_date_year"), sep = "-")
View(example_untied)

##creating new column for total guest
example_df <- bookings_df %>%
  mutate(guests = babies + adults + children)

View(example_df)

##creating new column for total concelation
example_df <- bookings_df %>% 
  summarise(number_canceled = sum(is_canceled), average_lead_time = sum(lead_time))

View(example_df)

##hotel data
bookings_df <- read_csv("hotel_bookings.csv") ##set the working directory to R moment
head(bookings_df)

##arranging descending order
arrange(bookings_df, -lead_time)
bookings_v2_df <-arrange(bookings_df, desc(lead_time))

##finding max and min and mean of data
max(bookings_v2_df$lead_time)
min(bookings_v2_df$lead_time)
mean(bookings_v2_df$lead_time)

##finding hotels booked in city
hotel_booked_in_city <- filter(bookings_df, bookings_df$hotel ==  "City Hotel")
mean(hotel_booked_in_city$lead_time)

##summarise and compare lead time in city vs resort
hotel_summary <- bookings_df %>% 
  group_by(hotel) %>% 
  summarise(average_lead_time_of_hotel = mean(lead_time), max_lead_time = max(lead_time), min_lead_time = min(lead_time))
head(hotel_summary)