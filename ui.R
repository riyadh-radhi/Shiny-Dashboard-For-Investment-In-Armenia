ui <- dashboardPage(
  dashboardHeader(title = "Investment In Armenia"),
  dashboardSidebar( sidebarMenu(
    menuItem("Invesment Per Sector", tabName = "Invesment_tab"),
    menuItem("Foreign direct investments ", tabName = "FDI_tab"),
    menuItem("Investment of Other Countries", tabName = "Investment_of_Countries")
  )),
  
  dashboardBody(

    tabItems(
      tabItem("Invesment_tab",    
              h3("Investment in Economic Sector (mln. dram)"),
              fluidRow(
        box(width=3,
            selectizeInput("input20", label = "Choose  Economic Sector", choices = unique(melted_df$Economic_sector),
                           multiple = T, options = list(maxItems = 5, placeholder = 'Select a Economic Sector'), 
                           selected = c("mining of metal ores", "construction of buildings")
                           )
            ),
        
        
        box(width = 9,plotOutput("plot1", height = 500, width = "100%"))
      ),
      
      fluidRow(
        box(width=3,selectInput("per", label = "Choose Economic Sector", multiple = TRUE,
                                choices = unique(melted_df$Economic_sector),
                                selected = c("mining of metal ores","construction of buildings" )),
            selectInput("year", label = "Choose Year",
                        choices = 2014:2017,
                        selected = 2014)
            ),
        
        box(width = 9,plotOutput("plot2", height = 500, width = "100%"))
      )),
      tabItem("FDI_tab",  
              h3("Foreign Direct Investment(mln.US) Vs Economic Freedom Over the Years"),
              fluidRow(
        
        box(width = 9, plotOutput("plot3", height = 500, width= "100%"))
              )
        ),
      tabItem("Investment_of_Countries",  
              h3("Top Foriegn Investment in mln.dram"),
              fluidRow(
        box(width=12,
            selectInput("year_country", label = "Choose One Year",
                        choices = 2014:2017,
                        selected = 2014)),
        box(width = 12,
          title = "Investments",
          sliderInput("slider0", "Number of Investment:", 1, 1700000, 1700000)
        ),
        
        box(width = 12, plotOutput("plot5", height = 500, width= "100%"))
      ),
      fluidRow(

        box(width = 12, selectizeInput("country", label = "Country Name", choices = unique(IAC_df$Country),
                                      multiple = T, options = list(maxItems = 5, placeholder = 'Select a country'), 
                                      selected = c("France", "Germany")
                                      
        )),
        box(width = 12, plotOutput("plot6", height = 500, width= "100%"))
  
        
      ))
      
    
      )
  

  )
)
