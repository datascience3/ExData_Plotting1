"
For Coursera, Exploratory Data Analysis, Course Project 1

Functions to create plot3.png: line plots of Energy
Sub Metering 1,2,3 vs. time.
"

generate_plot3 <- function() {
    '
    Creates plot3.png in the current working directory.

    Line plots of Energy Sub Metering 1,2,3 vs. time.
    '

    # load the household data
    household_data <- load_household_data()

    # convert dates and times to POSIXtl format
    datetime_temp <- strptime(paste(household_data$Date, household_data$Time),
                              format = "%d/%m/%Y %H:%M:%S")

    # plot constants
    PLOT_FILENAME <- "plot3.png"
    X_DATA <- datetime_temp
    Y_DATA <- household_data$Sub_metering_1
    PLOT_TYPE <- "n"             # no plotting
    X_LABEL <- ""                # empty x label
    Y_LABEL <- "Energy Sub metering"
    WIDTH <- 480
    HEIGHT <- 480

    png(filename = PLOT_FILENAME, width = WIDTH, height = HEIGHT, units = "px")

    plot(X_DATA, Y_DATA, type = PLOT_TYPE, xlab = X_LABEL, ylab = Y_LABEL)

    lines(X_DATA, household_data$Sub_metering_1, col = "black")
    lines(X_DATA, household_data$Sub_metering_2, col = "red")
    lines(X_DATA, household_data$Sub_metering_3, col = "blue")

    # legend constants
    PCH <- "_"        # plotting character appearing in the legend
    LEGEND_LABELS <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    COLORS <- c("black", "red", "blue")

    legend("topright", pch = PCH, col = COLORS, legend = LEGEND_LABELS)

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


# creates plot3.png in the current working directory
generate_plot3()

