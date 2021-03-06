library(shiny)
library(shinydashboard)


dashboardPage(
  skin = "blue",
  dashboardHeader(title = "BioScript"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Species Data", tabName = "rawdata", icon = icon("database")),
      menuItem("Environment Data", tabName = "rawdata_2", icon = icon("database")),
      menuItem("Basic Plots", tabName = "basic_plots", icon = icon("eye")),
      menuItem("Ordination", tabName = "ordination", icon = icon("eye"))
    ),
    fileInput('file1', 'Upload Species Data',
              accept=c('text/csv',
                       'text/comma-separated-values,text/plain',
                       '.csv')),
    fileInput('file2', 'Upload Enivornment Data',
              accept=c('text/csv',
                       'text/comma-separated-values,text/plain',
                       '.csv')),
    selectInput("variable", "Diversity Index:",
                c("Shannon" = "shannon",
                  "Simpson" = "simpson",
                  "Invsimpson" = "invsimpson"))
  ),
  dashboardBody(tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  ),

  tabItems(
    tabItem(tabName = "rawdata",
            dataTableOutput("rawdata")
    ),
    tabItem(tabName = "rawdata_2",
            dataTableOutput("rawdata_2")
    ),

    tabItem(tabName = "basic_plots",
            box(title = "Rarefaction Curve",  status = "primary", solidHeader = TRUE,
                collapsible = TRUE, plotOutput('rarecurve')),
            box(title = "Diversity Metrics (per site)", status = "primary", solidHeader = TRUE,
                collapsible = TRUE, plotOutput('diversity'))
    ),
    tabItem(tabName = "ordination",
            box(title = "Ordination Plot (MDS)", status = "primary", solidHeader = TRUE,
                collapsible = TRUE, plotOutput('ordination')),
            box(title = "Ordination Stressplot", status = "primary", solidHeader = TRUE,
                collapsible = TRUE, plotOutput('ordination_stress')),
            box(title = "Ordination - Environment Fit", status = "primary", solidHeader = TRUE,
                collapsible = TRUE, plotOutput('ordination_env_fit'))
    )
  )
  )
)
