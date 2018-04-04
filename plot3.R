##load the data set into R

Power <- read.csv("~/Downloads/household_power_consumption.txt", sep=";",stringsAsFactors=FALSE)

##create a subset of the data which only includes the dates of interest

SubSetPower <- Power[Power$Date %in% c("1/2/2007","2/2/2007") ,]

## check the structure of the subsetted data

str(SubSetPower)

## convert the format of the dates

Dates_Times <- strptime(paste(SubSetPower$Date, SubSetPower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## convert the Global Active Power & SubMetering (1,2,3) to numeric

GlobalActivePower <- as.numeric(SubSetPower$Global_active_power)
SubMetering1 <- as.numeric(SubSetPower$Sub_metering_1)
SubMetering2 <- as.numeric(SubSetPower$Sub_metering_2)
SubMetering3 <- as.numeric(SubSetPower$Sub_metering_3)

class(GlobalActivePower)
class(SubMetering1)
class(SubMetering2)
class(SubMetering3)

## set the conditions and title of the third graph

png("plot3.png", width=480, height=480)

## create datetime plot

plot(Dates_Times, SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(Dates_Times, SubMetering2, type="l", col="red")
lines(Dates_Times, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
