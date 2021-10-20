library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title="Quality of Education"),
  ## Sidebar content
  dashboardSidebar(
    sidebarMenu(
      menuItem("Introduction", tabName = "splash", icon = icon("dashboard")),
      menuItem("School Closures", tabName = "question1", icon = icon("th")),
      menuItem("Quality of Education", tabName = "question2", icon = icon("th")),
      menuItem("Mental Health", tabName = "question3", icon = icon("th"))
    )
  ),
  ## Body Content
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "splash", 
          h2("Effects of COVID-19 on Education"),
          
          div(style="text-align: center;",
              img(src = "slide_cover.PNG", width = 800, height = 450)
          ),
          
          div(style="text-align: left;",
              h2(strong("Description of the problem:")),
              p("Covid 19 has made it a mission in order to prevent students from around the world from receiving optimal learning environments and even the freedom of education due to issues such as poverty. We wanted to see how covid-19 has affected the quality of education for students around the world, understand their struggle and success in terms of providing an affordable and accessible form of education. We also wanted to understand how covid-19 has impacted the mental health of students from being isolated from the community."),
        
              
              h2(strong("A short literature review that outlines the problem. The literature review should be accessible by the non-academic community members, and property cited.")),
              p("Covid 19 has made it a mission in order to prevent students from around the world from receiving optimal learning environments and even the freedom of education due to issues such as poverty. We wanted to see how covid-19 has affected the quality of education for students around the world, understand their struggle and success in terms of providing an affordable and accessible form of education. We also wanted to understand how covid-19 has impacted the mental health of students from being isolated from the community."),
          ),
        
      ),
      
      # Second tab content
      tabItem(tabName = "question1",
              h2("WHEN WILL SCHOOL SYSTEMS RETURN BACK TO THE PHYSICAL LEARNING ENVIRONMENT?"),
              
              div(style="text-align: center;",
                  img(src = "Graph.png", width = 800, height = 450)
              ),
              
              div(style="text-align: left;",
                  h2(strong("Overview of Graph:")),
                  p("The data above shows covid-19 cases per capita and the status of the school systems in the country."),
                  p("Looking at trends in covid case numbers we can predict the point at which they will be low enough that schools can reopen.")
              ),
              
              div(style="text-align: center;",
                  img(src = "schoolstats.png")
              ),
              
              div(style="text-align: left;",
                  h3(strong("P Value: Greater than 0.05")),
                  p("Therefore there is not significant statistical evidence for the alternative hypothesis (that there is a correlation between covid cases per capita and whether or not a country closes its schools.")
              )
      ),
      
      # Third tab content
      tabItem(tabName = "question2",
              h2("How Quality of Education is Affected by Covid"),
        
              div(style="text-align: center;",
                  img(src = "graph2.png", width = 800, height = 450)
              ),
        
              div(style="text-align: left;",
                  h2(strong("Overview of Graph:")),
                  p("The data above shows student responses to how much they think digital learning tools affect their academic performance."),
                  p("We can see that the mean tends towards strongly agreeing that digital learning tools are a major factor in their academic performance.")
              ),
              
              div(style="text-align: center;",
                  img(src = "lm2a.png")
              ),
              
              div(style="text-align: center;",
                  img(src = "lm2b.png")
              ),
              
              div(style="text-align: left;",
                  h3(strong("P Value: Greater than 0.05")),
                  p("Therefore there is not significant statistical evidence for the alternative hypothesis (that there is a correlation between hours spent online (before and during covid) and how important students think digital learning tools are for their academic performance.")
              )
      ),
      
      # 4th tab content
      tabItem(tabName = "question3", 
              h2("Predicting Mental health of students based on number of COVID cases per capita"),
              
              div(style="text-align: center;",          
                img(src="graph info.PNG",height='450px',width='800px')
              ),
              
              div(style="text-align: left;",
                h2("Graph Overview"),
                p("The data above uses the number of COVID cases per capita and the percentage of individuals having symptoms of anxiety/depression"),
                p("Looking at the graph above, we can predict how the number of covid cases per capita can affect the mental health of students")
              ),
              
              div(style="text-align: center;",
                img(src="lm info.PNG",height='250px',width='600px')
              ),
              
              div(style="text-align: left;",
                h2("P-value: Greater than 0.05"),
                p("Therefore there is not significant statistical evidence for the alternative hypothesis (that there is a correlation between covid cases in each state per capita and whether or not a state showed indicators of poor mental health")
              )
      )
      
      
    )
  )
)

server <- function(input, output){
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)