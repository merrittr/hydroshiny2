library(ggplot2)
library(scales)
library(shiny)

function(input, output) {
file = "http://dd.weather.gc.ca/hydrometric/csv/SK/hourly/SK_hourly_hydrometric.csv"
skdat <- read.csv(file, head=T, sep=",", dec=".", stringsAsFactors = F)
colnames(skdat) <- c("ID", "Date", "WaterLevel", "Grade1", "Symbol1",
                     "QAQC-1", "DischargeDebit", "Grade2", "Symbol2",
                     "QAQC-2")

#subds <- subset(skdat, ID=input$z)
#subds$datetime <- as.POSIXct(subds$Date, format = "%Y-%m-%dT%H:%M:%OS")
#output$lineplot <- renderPlot({ 
#  ggplot(subds, aes(x = datetime, y = !!as.name(input$y))) + geom_line()   
#})  



output$lineplot <- renderPlot({
  subds <- subset(skdat, ID == input$z)
  subds$datetime <- as.POSIXct(subds$Date, format = "%Y-%m-%dT%H:%M:%OS")
  ggplot(subds, aes(x = datetime, y = !!as.name(input$y))) +
    geom_line()
})



}



