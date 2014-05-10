
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

png(filename = "plot1.png",
width = 480, height = 480, units = "px")

hist(data[,3], col = "red", 
main = "Global Active Power",
xlab = "Global Active Power (kilowatts)")

dev.off()

