#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)
library(rattle)

shinyServer(function(input, output) {
  
  data(iris) 
  model<-train(Species~.,method="rpart",data=iris)
  output$plot<-renderPlot({
    fancyRpartPlot(model$finalModel)
  })
  modelpred<-reactive({
    s.l<-input$s.l
    s.w<-input$s.w
    p.l<-input$p.l
    p.w<-input$p.w
    pred<-predict(model,newdata = data.frame(Petal.Length=p.l,
                                             Petal.Width=p.w,Sepal.Length=s.l,Sepal.Width=s.w))
  })
  output$prediction<-renderText({modelpred()})
  
  
})
