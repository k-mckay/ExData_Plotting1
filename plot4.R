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
GlobalReactivePower <- as.numeric(SubSetPower$Global_reactive_power)
SubMetering1 <- as.numeric(SubSetPower$Sub_metering_1)
SubMetering2 <- as.numeric(SubSetPower$Sub_metering_2)
SubMetering3 <- as.numeric(SubSetPower$Sub_metering_3)
Voltage <- as.numeric(SubSetPower$Voltage)

class(GlobalActivePower)
class(GlobalReactivePower)
class(SubMetering1)
class(SubMetering2)
class(SubMetering3)
class(Voltage)

## set the conditions and dimensions of the forth graph

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

## create plots

plot(Dates_Times, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(Dates_Times, Voltage, type="l", xlab="", ylab="Voltage")
plot(Dates_Times, SubMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(Dates_Times, SubMetering2, type="l", col="red")
lines(Dates_Times, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(Dates_Times, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
