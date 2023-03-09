>household_power_consumption <- read.csv("C:/Users/91874/Desktop/household_power_consumption.txt", header=FALSE, sep=";")
> View(household_power_consumption)

>names(household_power_consumption)  <-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
> subdata<-subset(household_power_consumption,Date %in% c("1/2/2007","2/2/2007"))
> subdata$Date<-as.Date(subdata$Date,format="%d/%m/%Y")

>dattim <- paste(as.Date(subdata$Date), subdata$Time)
>subdata$Datetime <- as.POSIXct(dattim)

#plotting
>with(subdata, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
>dev.copy(png, file="plot2.png", height=480, width=480)
>dev.off()