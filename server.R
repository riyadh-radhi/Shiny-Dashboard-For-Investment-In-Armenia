server <- function(input, output) {

  
  output$plot1 <- renderPlot({
    df_filtered <- melted_df  %>%  filter(Economic_sector %in% input$input20)
    IAC_plot <- ggplot(df_filtered, aes(x=Year, y=Investment, by = Economic_sector, color = Economic_sector)) +
      geom_line() + 
      geom_point() +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            panel.background = element_blank(), axis.line = element_line(colour = "black"),
            legend.text=element_text(size=15),
            axis.title.x=element_blank(),
            axis.title.y=element_blank())+
      scale_y_continuous(breaks=c(seq(-200000,200000,10000)))

    IAC_plot
  })
  
  output$plot2 <- renderPlot({
  

   plot_two <-ggplot(filter(plot_two_df, plot_two_df$Economic_sector %in% input$per, plot_two_df$Year %in% input$year))+
      geom_bar(aes(y=Investment, x= Economic_sector, fill = input$per),
               stat = "identity")+
      coord_flip()+
     scale_fill_discrete(name = "Economic Sector")+
     theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
           panel.background = element_blank(), axis.line = element_line(colour = "black"),
           legend.text=element_text(size=15),
           axis.title.x=element_blank(),
           axis.title.y=element_blank(),
           axis.text.y = element_blank(),
           axis.ticks.y = element_blank())+
     scale_y_continuous(breaks=c(seq(-200000,200000,10000)))
   plot_two
  })
  
  output$plot3 <- renderPlot({
    
    FDI_plot <- ggplot(FDI_df, aes(x=year,y =`foreign direct investments (mln. US)`))+
      scale_x_continuous(breaks=2009:2017)+
      geom_histogram(aes(x=year),  stat = "identity")+
      geom_line(aes(x=year,y=`ECONOMIC FREEDOM`*80),colour="red")+
      geom_point(aes(x=year,y=`ECONOMIC FREEDOM`*80))+
      scale_y_continuous(name = expression("Foreign Direct Investments (mln. US)"), 
                         sec.axis = sec_axis(~ . *1/80 , 
                                             name = "Economic Freedom Index"))+
      theme(axis.title.x = element_blank(),
            axis.title.y = element_text(margin = margin(t = 0, r = 10, b = 0, l = 0)),
            axis.title.y.right = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10)))
    
    
  
    FDI_plot
    
  })
  
  output$plot33 <- renderPlotly({
    
    FDI_plot2 <- ggplot(FDI_df, aes(x=`ECONOMIC FREEDOM` ,y =`foreign direct investments (mln. US)`))+
      scale_x_continuous(breaks=2009:2017)+
      geom_point()+
      geom_line()
    
    
    ggplotly(FDI_plot2)
    
  })
  
  output$plot5 <- renderPlot({
    plot_five <-ggplot(filter(melted_country_df,melted_country_df$year %in% input$year_country))+
      geom_bar(aes(x= Country, y=`Invesment mln amd`, fill = Country), stat = "identity")+
      coord_flip()+
      ylim(0, input$slider0)+
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            panel.background = element_blank(), axis.line = element_line(colour = "black"),
            legend.text=element_text(size=15),
            axis.title.x=element_blank(),
            axis.title.y=element_blank(),
            axis.text.y = element_blank(),
            axis.ticks.y = element_blank())
     scale_y_continuous(breaks=c(50000))
      
    
    plot_five
    
  })

  output$plot6 <- renderPlot({
    df_filtered <- IAC_df  %>%  filter(Country %in% input$country)
    IAC_plot <- ggplot(df_filtered, aes(x=Year, y=Investment, by = Country, color = Country)) + geom_line() + geom_point() +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            panel.background = element_blank(), axis.line = element_line(colour = "black"),
            legend.text=element_text(size=15),
            axis.title.x=element_blank(),
            axis.title.y=element_blank())+
      scale_y_continuous(breaks=c(seq(-2000000,2000000,100000)))
    
    IAC_plot    
  })
}