# Loading the dataset
full_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# seeing the subset to the two specific days
data <- full_data[full_data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Converting Date and Time to a single POSIXct class
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

options(rpubs.upload.method = "internal")


# STEP 1: LOADING AND PREPARING THE DATA
# Ensuring that the data file is in my working directory
dataset_file <- "household_power_consumption.txt"

# Reading the dataset with specific NA string handling
full_data <- read.table(dataset_file, header = TRUE, sep = ";", 
                        na.strings = "?", stringsAsFactors = FALSE)

# Subsetting to the required two-day period in February 2007
data <- full_data[full_data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Converting Date and Time to a unified POSIXct DateTime class
data$Datetime <- as.POSIXct(strptime(paste(data$Date, data$Time), 
                                     "%d/%m/%Y %H:%M:%S"))

# Clearing the screen device to ensure a fresh start
if(!is.null(dev.list())) dev.off()


# PLOT 1: Global Active Power Histogram

hist(data$Global_active_power, col="blue", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

# Save to PNG
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()


# Reset par to default for future plotting
par(mfrow=c(1,1))

getwd()
