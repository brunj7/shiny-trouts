ui <- navbarPage(
    
    title = "LTER Animal Data Explorer",
    
    # (Page 1) intro tabPanel ----
    tabPanel(title = "About this App",
             
             "background info will go here" # REPLACE THIS WITH CONTENT
             
    ), # END (Page 1) intro tabPanel
    
    # (Page 2) data viz tabPanel ----
    tabPanel(title =  "Explore the Data",
             
             # tabsetPanel to contain tabs for data viz ----
             tabsetPanel(
                 
                 # trout tabPanel ----
                 tabPanel(title = "Trout",
                          
                          # trout sidebarLayout ----
                          sidebarLayout(
                              
                              # trout sidebarPanel ----
                              sidebarPanel(
                                  
                                  "trout plot input(s) go here" # REPLACE THIS WITH CONTENT
                                  
                              ), # END trout sidebarPanel
                              
                              # trout mainPanel ----
                              mainPanel(
                                  
                                  "trout plot output goes here" # REPLACE THIS WITH CONTENT
                                  
                              ) # END trout mainPanel
                              
                          ) # END trout sidebarLayout
                          
                 ), # END trout tabPanel 
                 
                 # penguin tabPanel ----
                 tabPanel(title = "Penguins",
                          

                          
                 ) # END penguin tabPanel
                 
             ) # END tabsetPanel
             
    ) # END (Page 2) data viz tabPanel
    
) # END navbar page