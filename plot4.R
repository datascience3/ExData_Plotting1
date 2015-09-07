"
For Coursera, Exploratory Data Analysis, Course Project 1

Functions to create plot4.png: Multiple plots of energy
usage vs. time
"

generate_plot4 <- function() {
    '
    Creates plot4.png in the current working directory.

    Multiple line plots of energy usage vs. time.
    '

    # load the household data
    household_data <- load_household_data()

    # convert dates and times to POSIXtl format
    datetime <- strptime(paste(household_data$Date, household_data$Time),
                         format = "%d/%m/%Y %H:%M:%S")

    # plot margins
    BOTTOM_MARGIN <- 3.5
    LEFT_MARGIN <- 3.5
    TOP_MARGIN <- 3
    RIGHT_MARGIN <- 1
    AXIS_TITLE_MARGIN <- 2.1
    AXIS_LABEL_MARGIN <- 0.6
    AXIS_LINE_MARGIN <- 0
    MARGINS = c(BOTTOM_MARGIN, LEFT_MARGIN, TOP_MARGIN, RIGHT_MARGIN)
    AXIS_MARGINS <- c(AXIS_TITLE_MARGIN, AXIS_LABEL_MARGIN, AXIS_LINE_MARGIN)

    # plot magnification factors
    MAGNIFY_FACTOR <- 0.5
    MEX <- 1                      # character size expansion factor for margins
    LABEL_MAG_FACTOR <- 1.5       # x and y labels, relative to MAGNIFY_FACTOR
    AXIS_MAG_FACTOR <- 1.5        # axis annotation, relative to MAGNIFY_FACTOR

    # other plot constants
    PLOT_FILENAME <- "plot4.png"
    GRID_SIZE <- c(2, 2)          # draw 4 plots in a 2-by-2 grid
    WIDTH <- 480
    HEIGHT <- 480
    X_DATA <- datetime

    png(filename = PLOT_FILENAME, width = WIDTH, height = HEIGHT, units = "px")

    opt <- par(mfrow = GRID_SIZE, mar = MARGINS, cex = MAGNIFY_FACTOR, mex =
               MEX, mgp = AXIS_MARGINS, cex.lab = LABEL_MAG_FACTOR, cex.axis =
               AXIS_MAG_FACTOR)


    with(household_data, {

        # the upper-left quadrant
        plot(X_DATA, Global_active_power, type = "l", xlab = "", ylab = "Global
             Active Power (kilowatts)")

        # the upper-right quadrant
        plot(X_DATA, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

        # the lower-left quadrant
        plot(X_DATA, Sub_metering_1, type = "n", ylab = "Energy Sub metering",
             xlab = "")
        lines(X_DATA, Sub_metering_1, col = "black")
        lines(X_DATA, Sub_metering_2, col = "red")
        lines(X_DATA, Sub_metering_3, col = "blue")

        # the legend for the lower-left quadrant
        PCH <- "_"             # plotting character for entries in the legend
        BOX_TYPE <- "n"        # type of box to draw around the legend (n=none)
        INSET <- 0.05          # inset distance (as a fraction)
        COLORS <- c("black", "red", "blue")
        LABELS <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        legend("topright", pch = PCH, col = COLORS, bty = BOX_TYPE, inset =
               INSET, legend = LABELS)

        # the lower-right quadrant
        plot(X_DATA, Global_reactive_power, type = "l", xlab = "datetime", ylab
             = "Global_reactive_power")

        dev.off()
    }
    )

    # restore
    par(opt)

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


# creates plot4.png in the current working directory
generate_plot4()

