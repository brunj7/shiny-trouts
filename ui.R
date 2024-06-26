ui <- navbarPage(
    
    title = "LTER Animal Data Explorer",
    
    # (Page 1) intro tabPanel ----
    tabPanel(title = "About this App",
             
             # intro text fluidRow ----
             fluidRow(
               
               # use columns to create white space on sides
               column(1),
               column(10, includeMarkdown("text/about.md")),
               column(1)
               
             ), # END intro text fluidRow
             
             hr(), # creates light gray horizontal line
             
    ), # END (Page 1) intro tabPanel
    
    # (Page 2) data viz tabPanel ----
    tabPanel(title =  "Explore the Trout Data",
             sidebarPanel(
               
               # channel type pickerInput ----
               pickerInput(inputId = "channel_type_input", label = "Select channel type(s):",
                           choices = unique(clean_trout$channel_type),
                           selected = c("cascade", "pool"),
                           options = pickerOptions(actionsBox = TRUE),
                           multiple = TRUE), # END channel type pickerInput
               
               # section checkboxGroupButtons ----
               checkboxGroupButtons(inputId = "section_input", label = "Select a sampling section(s):",
                                    choices = c("clear cut forest", "old growth forest"),
                                    selected = c("clear cut forest", "old growth forest"),
                                    individual = FALSE, justified = TRUE, size = "sm",
                                    checkIcon = list(yes = icon("check", lib = "font-awesome"), 
                                                     no = icon("xmark", lib = "font-awesome"))), # END section checkboxGroupInput
               
             ), # END trout sidebarPanel
             
             mainPanel(
             
             # tabsetPanel to contain tabs for data viz ----
             tabsetPanel(
                 
                 # trout tabPanel ----
                 tabPanel(title = "Trout Plot",
                          
                              # trout mainPanel ----
                              mainPanel(
                                  
                                plotOutput(outputId = "trout_scatterplot_output")
                                  
                              ) # END trout mainPanel
                              
                 
                 ), # END trout tabPanel 
                 tabPanel(title = "Trout Table",
                            
                            # trout mainPanel ----
                            mainPanel(
                              
                              DT::DTOutput(outputId = "trout_table_output") 
                              
                            ) # END trout mainPanel
                            
                          # ) # END trout sidebarLayout
                          
                 ), # END trout tabPanel 
             )
             ) # END tabsetPanel
             
    ) # END (Page 2) data viz tabPanel
    
) # END navbar page