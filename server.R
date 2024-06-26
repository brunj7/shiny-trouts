server <- function(input, output) {
  
  # filter trout data according to user inputs----
  trout_filtered_df <- reactive({
    
    clean_trout %>% 
      filter(channel_type %in% c(input$channel_type_input)) %>%
      filter(section %in% c(input$section_input))
    
  })
  
  # trout scatterplot ----
  output$trout_scatterplot_output <- renderPlot({
    
    ggplot(trout_filtered_df(), aes(x = length_mm, y = weight_g, color = channel_type, shape = channel_type)) +
      geom_point(alpha = 0.7, size = 5) +
      scale_color_manual(values = c("cascade" = "#2E2585", "riffle" = "#337538", "isolated pool" = "#DCCD7D",
                                    "pool" = "#5DA899", "rapid" = "#C16A77", "step (small falls)" = "#9F4A96",
                                    "side channel" = "#94CBEC")) +
      scale_shape_manual(values = c("cascade" = 15, "riffle" = 17, "isolated pool" = 19,
                                    "pool" = 18, "rapid" = 8, "step (small falls)" = 23,
                                    "side channel" = 25)) +
      scale_x_continuous(limits = c(40, 260)) +
      scale_y_continuous(limits = c(0, 120)) +
      labs(x = "Trout Length (mm)", y = "Trout Weight (g)", color = "Channel Type", shape = "Channel Type") +
      myCustomTheme()
    
  }) 
  
  output$trout_table_output <- DT::renderDT({
    
    DT::datatable(trout_filtered_df())
    
    
  }) 
  
} # END server