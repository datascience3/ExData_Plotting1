"
For Coursera, Exploratory Data Analysis, Course Project 1

Functions to create plot2.png: a line plot of Global
Active Power usage vs. time.
"

generate_plot2 <- function() {
    '
    Creates plot2.png in the current working directory.

    A line plot of Global Active Power usage vs. time.
    '

    # load the household data
    household_data <- load_household_data()

    # convert dates and times to POSIXtl format
    datetime <- strptime(paste(household_data$Date, household_data$Time),
                         format = "%d/%m/%Y %H:%M:%S")

    # plot constants
    PLOT_FILENAME <- 'plot2.png'
    X_DATA <- datetime
    Y_DATA <- household_data$Global_active_power
    PLOT_TYPE <- "l"                              # line plot
    X_LABEL <- ""                                 # empty x label
    Y_LABEL <- "Global Active Power (kilowatts)"  # y label
    WIDTH <- 480
    HEIGHT <- 480


    # generate plot2
    png(filename = PLOT_FILENAME, width = WIDTH, height = HEIGHT, units = "px")
    plot(X_DATA, Y_DATA, type = PLOT_TYPE, xlab = X_LABEL, ylab = Y_LABEL)
    dev.off()

}

load_household_data <- function() {
    '
    Downloads household_power_consumption.zip zipfile from the UCI
    Machine learning repository and puts in into the current working
    directory (if this file does not exist in the current working
    directory). Next, the file gets unzipped to
    household_power_consumption.txt.

    Returns a data frame of household data for Feb 1-2, 2007.
    '

    # download and unzip the household data zipfile, if zipfile doesn't exist
    url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/"
    destfile <- "household_power_consumption.zip"
    if (!file.exists(destfile)) {
        download.file(paste0(url, destfile), destfile = destfile,
                      method = "curl")
        unzip(destfile)
    }

    # data frame constants
    DATA_FILE <- 'household_power_consumption.txt'
    SEPARATOR = ";"    # how to separate data entries in the file
    NA_STRINGS = "?"   # consider question marks as NA values
    COL_NAMES <- colnames(read.table(DATA_FILE, header = TRUE, sep = SEPARATOR,
                                     nrows = 1))

    # Load the household power consumption data for Feb 1-2, 2007
    SKIP_LINES <- 66636    # begin at line 66637
    NUMBER_OF_ROWS <- 2880 # 2880 rows are loaded (2880 minutes in 2 days).

    # the household data
    read.table(DATA_FILE, header = TRUE, sep = SEPARATOR, na.strings =
               NA_STRINGS, skip = SKIP_LINES, nrows = NUMBER_OF_ROWS, col.names
               = COL_NAMES)
}


# creates plot2.png in the current working directory
generate_plot2()

