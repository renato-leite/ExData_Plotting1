
###
#read the file
###

first.data = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

##
#subset the target days
##

d1 = subset(first.data, first.data == "1/2/2007")
d2 = subset(first.data, first.data == "2/2/2007")
data = rbind(d1,d2)

###
#remove the complete version of the data 
###

rm(first.data)

###
#Creates the time formated vector
###

dates = data[,1]
times = data[,2]
x = paste(dates,times)
Time = strptime(x, "%d/%m/%Y %H:%M:%S")


#####################
# Creating the plot #
#####################


Sys.setlocale("LC_TIME", "English")
png(filename = "plot3.png",
width = 480, height = 480, units = "px")

plot(Time,data[,7],cex=0, 
ylab = "Energy sub metering",
xlab = "")
lines(Time,data[,7], col="black")
lines(Time,data[,8], col="red")
lines(Time,data[,9], col="blue")
legend("topright",
legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
lty=1,
col=c("black","red","blue"))

dev.off()








