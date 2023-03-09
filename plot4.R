>household_power_consumption <- read.csv("C:/Users/91874/Desktop/household_power_consumption.txt", header=FALSE, sep=";")
> View(household_power_consumption)

>names(household_power_consumption)  <-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
> subdata<-subset(household_power_consumption,Date %in% c("1/2/2007","2/2/2007"))
> subdata$Date<-as.Date(subdata$Date,format="%d/%m/%Y")

>dattim <- paste(as.Date(subdata$Date), subdata$Time)
>subdata$Datetime <- as.POSIXct(dattim)

>par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

>with(subdata, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="")
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l",ylab="Global_rective_power",xlab="")
})
>dev.copy(png, file="plot4.png", height=480, width=480)
>dev.off()