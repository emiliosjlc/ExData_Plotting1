# Download and unzip file
# download file
if (!file.exists("data")){dir.create("data")}
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "data/project1.zip", method = "curl")
dateDownloaded <- date()
# extract the data file from .zip file 
unzip("data/project1.zip")