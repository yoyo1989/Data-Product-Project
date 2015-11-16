library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Need to consider relativistic effect?"),
  
    sidebarPanel(
      numericInput('KE', 'Kinetic Energy (J)', 90, min = 0, step = 5),
      numericInput('Mass', 'Mass (kg)', 50, min = 0, step = 5),
      submitButton('Submit'),
      
      helpText("This app reads in the kinetic energy (the energy of motion) and mass, calculates velocities using 
               two formulae below, and exams whether the relativisitic effect needs to be considered."),
      withMathJax(helpText("If the velocity (v) is much less than the velocity of light (c), 
                the kinetic energy (E) of a point mass (m) can be calculated using the 
                non-relativistic formula: $$E=mv^2/2$$")),
      withMathJax((helpText("If the velocity (v) is comparable with the velocity of light (c), then 
                 the kinetic energy (E) must be calculated using the relativistic 
                formula: $$E=mc^2(\\frac{1}{\\sqrt{1-v^2/c^2}}-1)$$"))),
      withMathJax((helpText("where c=299792458.0 km/s."))),
      helpText("Thus, given the input, if two velocities from the above formulae are similar, that means the relativistic 
                effect is negligible and the non-relativistic formula is a good approximation of the relativistic 
                formula at those velocities. Otherwise, the relativistic effect should be considered and the 
               relativistic formula should be used."),
      helpText("Examples of input: "),
      helpText("KE=90, M=50"),
      helpText("KE=1,000,000,000, M=0.0000001"),
      helpText("KE=1,000,000,000, M=0.00000001"),
      helpText(a(href="http://www.cosmo.nyu.edu/SNYU/", target="_blank", "View code"))
    ),
    
    mainPanel(
        h3('Corresponding velocities'),
        h4('You entered'),
        verbatimTextOutput("inputValue"),
        h4('Velocity 1 (km/s, using the non-relativistic formula on the left)'),
        verbatimTextOutput("velocityCal1"),
        h4('Velocity 2 (km/s, using the relativistic formula on the left)'),
        verbatimTextOutput("velocityCal2"),
        h4('Ratio of velocity 1 to velocity 2'),
        verbatimTextOutput("velocityRatio"),
        h4('Ratio of velocity 2 to the velocity of light'),
        verbatimTextOutput("velocity2c"),
        h4('Comments on the result'),
        verbatimTextOutput("commentVel"),
        h4('Conclusion'),
        verbatimTextOutput("concl")
    )
  )
)

