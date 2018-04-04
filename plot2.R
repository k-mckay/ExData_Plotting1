##load the data set into R

Power <- read.csv("~/Downloads/household_power_consumption.txt", sep=";",stringsAsFactors=FALSE)

##create a subset of the data which only includes the dates of interest

SubSetPower <- Power[Power$Date %in% c("1/2/2007","2/2/2007") ,]

## check the structure of the subsetted data

str(SubSetPower)

## convert the format of the dates

Dates_Times <- strptime(paste(SubSetPower$Date, SubSetPower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## convert the Global Active Power to numeric

GlobalActivePower <- as.numeric(SubSetPower$Global_active_power)
class(GlobalActivePower)

## set the conditions and title of the second graph

png("plot2.png", width=480, height=480)

## create the graph, plot2.png

plot(Dates_Times, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
