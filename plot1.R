>household_power_consumption <- read.csv("C:/Users/91874/Desktop/household_power_consumption.txt", header=FALSE, sep=";")
> View(household_power_consumption)

>names(household_power_consumption)  <-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
> subdata<-subset(household_power_consumption,Date %in% c("1/2/2007","2/2/2007"))
> subdata$Date<-as.Date(subdata$Date,format="%d/%m/%Y")

>hist(subdata$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency",col="Red")
> png("plot1.png",width=480,height=480)
> dev.off()
RStudioGD 
2 