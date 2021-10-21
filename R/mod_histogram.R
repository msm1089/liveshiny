#' histogram UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_histogram_ui <- function(id){
  ns <- NS(id)
  tagList(
    selectInput(ns("var"), "Variable", choices = names(mtcars)),
    numericInput(ns("bins"), "bins", value = 10, min = 1),
    plotOutput(ns("hist"))
  )
}

# histogramUI <- function(id) {
#   tagList(
#     selectInput(NS(id, "var"), "Variable", choices = names(mtcars)),
#     numericInput(NS(id, "bins"), "bins", value = 10, min = 1),
#     plotOutput(NS(id, "hist"))
#   )
# }

# choice_ui <- function(id) {
#   # This ns <- NS structure creates a 
#   # "namespacing" function, that will 
#   # prefix all ids with a string
#   ns <- NS(id)
#   tagList(
#     sliderInput(
#       # This looks the same as your usual piece of code, 
#       # except that the id is wrapped into 
#       # the ns() function we defined before
#       inputId = ns("choice"), 
#       label = "Choice",
#       min = 1, max = 10, value = 5
#     ),
#     actionButton(
#       # We need to ns() all ids
#       inputId = ns("validate"),
#       label = "Validate Choice"
#     )
#   )
# }
    
#' histogram Server Functions
#'
#' @noRd 
mod_histogram_server <- function(id){
  moduleServer( id, function(input, output, session){
    #ns <- session$ns
    data <- reactive(mtcars[[input$var]])
    output$hist <- renderPlot({
      hist(data(), breaks = input$bins, main = input$var)
    }, res = 96)
  })
}

# histogramServer <- function(id) {
#   moduleServer(id, function(input, output, session) {
#     data <- reactive(mtcars[[input$var]])
#     output$hist <- renderPlot({
#       hist(data(), breaks = input$bins, main = input$var)
#     }, res = 96)
#   })
# }

# choice_server <- function(id) {
#   # Calling the moduleServer function
#   moduleServer(
#     # Setting the id
#     id,
#     # Defining the module core mechanism
#     function(input, output, session) {
#       # This part is the same as the code you would put 
#       # inside a standard server
#       observeEvent( input$validate , {
#         print(input$choice)
#       })
#     }
#   )
# }
    
## To be copied in the UI
# mod_histogram_ui("histogram_ui_1")
    
## To be copied in the server
# mod_histogram_server("histogram_ui_1")
