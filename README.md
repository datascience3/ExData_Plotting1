Coursera: Exploratory Data Analysis Assignment
==============================================

-------------------------------------------------------------------

This assignment uses data from the [UC Irvine Machine Learning
Repository][2], a popular repository for machine learning datasets.
In particular, we will be using the "Individual household
electric power consumption Data Set".


* **Dataset:** [Electric power consumption (20Mb)][1]

* **Description:** Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from the [UCI web site][3]:


1. **Date:** Date in format dd/mm/yyyy
2. **Time:** time in format hh:mm:ss
3. **Global_active_power:** household global minute-averaged active power
   (in kilowatt)
4. **Global_reactive_power:** household global minute-averaged reactive power
   (in kilowatt)
5. **Voltage:** minute-averaged voltage (in volt)
6. **Global_intensity:** household global minute-averaged current intensity
   (in ampere)
7. **Sub_metering_1:** energy sub-metering No. 1 (in watt-hour of active
   energy). It corresponds to the kitchen, containing mainly a dishwasher,
   an oven and a microwave (hot plates are not electric but gas powered).
8. **Sub_metering_2:** energy sub-metering No. 2 (in watt-hour of active
   energy). It corresponds to the laundry room, containing a washing-machine,
   a tumble-drier, a refrigerator and a light.
9. **Sub_metering_3:** energy sub-metering No. 3 (in watt-hour of active
   energy). It corresponds to an electric water-heater and an air-conditioner.

Loading the data
----------------

The dataset has 2,075,259 rows and 9 columns, but we will only be using
data from the dates 2007-02-01 and 2007-02-02. Note that in this dataset
missing values are coded as `?`.

1. Download the dataset from the link above or from the UCI website.
2. Unzip the dataset file and save it as household_power_consumption.txt.

If you want to load the entire dataset, open an R session and enter the
following at the R prompt:
```r
unzip('exdata_data_household_power_consumption.zip')
data_file <- file('household_power_consumption.txt')
data <- read.table(data_file, header = TRUE, sep = ";", na.strings = "?")
```


Making Plots
------------

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007.

Each file (plot1.R, plot2.R, ...) does the following:

1. Downloads the data from the UC Irvine machine learning repository (if it's
   not already downloaded into the current working directory).
2. Unzips the household data to a text file named
   household_power_consumption.txt to the current working directory.
3. Loads the data from household_power_consumption.txt for the first
   two days of February into a data frame named `household_data`.
4. Generates a plot (or plots) of various components of the data for
   exploratory data analysis.

To generate a plot, open an R session and source the appropriate .R file:

For example the following commands will save the data set to a folder named
~/household_data and generate plot1.
```r
setwd('~/household_data')
source('plot1.R')
```



[1]: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
[2]: http://archive.ics.uci.edu/ml/
[3]: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
