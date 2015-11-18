library(shiny)

c=299792458.0
velCalc1 <- function(k,m) sqrt(2*k/m)
velCalc2 <- function(k,m) c*sqrt(1/(1+m^2*c^4/(k^2+2*k*m*c^2)))

shinyServer(
  function(input, output) {
          vel1=reactive(velCalc1(input$KE,input$Mass))
          vel2=reactive(velCalc2(input$KE,input$Mass))
          ratio=reactive(vel1()/vel2())
    output$inputValue <- renderPrint({list(KE = input$KE, M =input$Mass)})
    output$velocityCal1 <- renderPrint({vel1()})
    output$velocityCal2 <- renderPrint({vel2()})
    output$velocityRatio <- renderPrint({ratio()})
    output$velocity2c <- renderPrint({vel2()/c})   
    output$commentVel <- renderText({
            if (vel1() > c) "1. Velocity from the non-relativistic formula is more than the velocity of light, which is unrealistic. 
2. Velocity from the relativistic formula is comparable to the velocity of light. 
3. Thus, the relativisitc formula should be used. 
4. Note that the velocity from the relativistic formula will never exceed the velocity of light."
            else if (ratio() > 1.001) "1. Velocity from the non-relativistic is more than point one percent larger than velocity from the relativistic formula. 
2. Velocity from the relativistic formula is comparable to the velocity of light. 
3. Thus, the relativisitc formula should be used."
            else "1. Velocity from the non-relativistic formula is a good approximation of velocity from the relativistic formula. 
2. Both velocities are much less than the velocity of light. 
3. Thus, the non-relativistic formula is preferred since it's simpler than the relativistic formula."
            })
    output$concl <- renderText({"1. After playing with this applicaiton, you may conclude that when velocity is around 15000000 m/s and above, relativistic effect should be considered.
2. Sending missions to Moon doesn't need to consider the relativistic effect, since the sending velocity is around 11200 m/s.
3. Studying the explosion of stars needs to consider the relativistic effect, since the exploding velocity is around 15000000 m/s." 
            })
    
     }
  
)
