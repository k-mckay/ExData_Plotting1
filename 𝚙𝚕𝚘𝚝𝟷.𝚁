##load the data set into R

Power <- read.csv("~/Downloads/household_power_consumption.txt", sep=";",stringsAsFactors=FALSE)

##create a subset of the data which only includes the dates of interest

SubSetPower <- Power[Power$Date %in% c("1/2/2007","2/2/2007") ,]

## check the structure of the subsetted data

str(SubSetPower)

## convert the Global Active Power to numeric

GlobalActivePower <- as.numeric(SubSetPower$Global_active_power)
class(GlobalActivePower)

## set the conditions and titile of the first graph

png("plot1.png", width=480, height=480)

## create the histogram, plot1.png

hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
