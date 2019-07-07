# Define UI for application that draws a histogram
dashboardPage(
  dashboardHeader(title = "Análise sobre as informações públicas do Airbnb.", titleWidth = "95%"),
  dashboardSidebar(
    sliderInput("minAnunciosBairro", "Mínimo de Anúncios por Bairro:", 1, 3000, 50),
    sliderInput("maxResultados", "Limite de Resultados:", 1, 10, 5)
  ),
  dashboardBody(
    fluidRow(
      box(
        width = "100%",
        title = "Caso de estudo: Rio de Janeiro ",
        "Base de dados: Anúncios de hospedagem do site Airbnb existentes na cidade do Rio de Janeiro, em 21/05/2019. ", br(), 
        "Fonte: http://data.insideairbnb.com/brazil/rj/rio-de-janeiro/2019-05-21/data/listings.csv.gz "
        )
    ),
    fluidRow(
      tabBox(
        # The id lets us use input$tabset1 on the server to find the current tab
        id = "tabset1", width = "100%", side = "right",title = "Perguntas:",selected = "1",
        tabPanel("10", h4("Modelo de Regressao Linear"), 
                 h5("- Qual a relação entre as avaliações recebidas e taxa de ocupação mensal da acomodação?"),
                 "Gráfico de Dispersão:", plotOutput("graficoDipersao"),
                 "Coeficiente de Correção Linear", verbatimTextOutput("cor"), br(),
                 "Teste de Hipótese", verbatimTextOutput("corTest"),
                 "Modelo", verbatimTextOutput("model"),
                 "Summary", verbatimTextOutput("summary"),
                 "anova", verbatimTextOutput("anova"),
                 "Gráficos do Modelo", plotOutput("grafico1Modelo"), plotOutput("grafico2Modelo"), plotOutput("grafico3Modelo"), plotOutput("grafico4Modelo"),
                 "ggplot", plotOutput("ggplot")
                 ),
        tabPanel("9", h4("Quantos anuncios tem os maiores anunciantes?"),
                 dataTableOutput("totalPorAnunciante")
                 ),
        tabPanel("8", h4("Quais os apartamentos com maior frequência de ocupação mensal, onde ficam e qual seu valor/dia?"), 
                 dataTableOutput("aptMaisOcupadoMes")
                 ),
        tabPanel("7", h4("Quais os apartamentos com maior número de reviews, onde fica e qual seu valor/dia?"),  
                 dataTableOutput("aptMaisOcupado")
                 ),
        tabPanel("6", h4("Qual é o tipo de acomodação mais anunciado e o mais procurado?"), 
                 h5("obs: de acordo com média de reviews"),
                 dataTableOutput("tipoAptMaisProcurado")
                 ),
        tabPanel("5", h4("Quais os bairros com maior frequência de ocupação mensal?"), 
                 "Se observarmos apenas a média de reviews, podemos não considerar situações onde ocorreu uma alta ocupação esporádica em determinado bairro, mas que não corresponda uma frequência habitual de ocupação. Assim, cabe tambpem observar a média mensal de ocupação de cada bairro.",
                 br(),br(),
                 dataTableOutput("bairrosMaisReservasMensal")
                 ),
        tabPanel("4", h4("Quais os bairros com maior taxa de ocupação?"), 
                 "Segundo o projeto 'Inside Airbnb', a base de dados foi populada a partir dos dados públicos capturados do site. Como não existe abertamente no site os dados sobre os aluguéis realizados de cada hospedagem anunciada, a taxa de ocupação dos imóveis pode ser estimada a partir da quantidade de reviews de cada anúncio. De acordo com o projeto estima-se que em 50% dos casos os usuários deixam reviews, assim quanto maior a quantidade de reviews mais podemos considerar que o anúncio foi reservado pelo site.", 
                 br(), br(),
                 dataTableOutput("bairrosMaisReservas")
                ),
        tabPanel("3", h4("Quais os bairros mais baratos?"),  br(),
                 dataTableOutput("bairrosMaisBaratos")
                 ),
        tabPanel("2", h4("Quais os bairros mais caros?"),  br(),
                 dataTableOutput("bairrosMaisCaros")
                ),
        tabPanel("1", h4("Quais os bairros com mais acomodações anunciadas?"), br(),
                 dataTableOutput("bairrosMaisApt")
                 )
      )
    )
  )
)
