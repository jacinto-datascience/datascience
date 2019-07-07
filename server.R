server <- function(input, output) {

  #Pergunta 1  
  output$bairrosMaisApt = renderDataTable({
    dt = airbnb %>%
      group_by(Bairro) %>%
      filter(n()>=input$minAnunciosBairro) %>%
      summarise(totalAnuncios = n_distinct(id),
                precoMedio=round(mean(price, na.rm=TRUE), digits = 2),
                reviewsMedia=round(mean(number_of_reviews), digits = 2),
                reviewsMediaMes=round(mean(reviews_per_month, na.rm=TRUE), digits = 2)) %>%
      arrange(-totalAnuncios)%>%
      rename("Total de anúncios" = totalAnuncios) %>%
      rename("Preço Médio (R$)" = precoMedio)%>%
      rename("Média de Reviews" = reviewsMedia) %>%
      rename("Média Reviews/Mês" = reviewsMediaMes) %>%
      head(input$maxResultados)
    datatable(
      dt, rownames = FALSE,
      extensions = 'Buttons', options = list(dom = 'B', 
                                             buttons = list(list(extend = "colvis", 
                                                                 text = "Exibir/Ocultar Mais Dados")),
                                             columnDefs = list(list(visible=FALSE, targets=c(2,3,4)))
                                             )
    )
  })
  
  #Pergunta 2  
  output$bairrosMaisCaros = renderDataTable({
    dt = airbnb %>%
      group_by(Bairro) %>%
      filter(n()>=input$minAnunciosBairro) %>%
      summarise(precoMedio=round(mean(price, na.rm=TRUE), digits = 2),
                totalAnuncios = n_distinct(id),
                reviewsMedia=round(mean(number_of_reviews), digits = 2),
                reviewsMediaMes=round(mean(reviews_per_month, na.rm=TRUE), digits = 2)) %>%
      arrange(-precoMedio) %>%
      rename("Total de anúncios" = totalAnuncios) %>%
      rename("Preço Médio (R$)" = precoMedio)%>%
      rename("Média de Reviews" = reviewsMedia) %>%
      rename("Média Reviews/Mês" = reviewsMediaMes) %>%
      head(input$maxResultados)
    datatable(
      dt, rownames = FALSE,
      extensions = 'Buttons', options = list(dom = 'B', 
                                             buttons = list(list(extend = "colvis", 
                                                                 text = "Exibir/Ocultar Mais Dados")),
                                             columnDefs = list(list(visible=FALSE, targets=c(2,3,4)))
      )
    )
  })
  
  #Pergunta 3  
  output$bairrosMaisBaratos = renderDataTable({
    dt = airbnb %>%
      group_by(Bairro) %>%
      filter(n()>=input$minAnunciosBairro) %>%
      summarise(precoMedio=round(mean(price, na.rm=TRUE), digits = 2),
                totalAnuncios = n_distinct(id),
                reviewsMedia=round(mean(number_of_reviews), digits = 2),
                reviewsMediaMes=round(mean(reviews_per_month, na.rm=TRUE), digits = 2)) %>%
      arrange(precoMedio) %>%
      rename("Total de anúncios" = totalAnuncios) %>%
      rename("Preço Médio (R$)" = precoMedio)%>%
      rename("Média de Reviews" = reviewsMedia) %>%
      rename("Média Reviews/Mês" = reviewsMediaMes) %>%
      head(input$maxResultados)
    
    datatable(
      dt, rownames = FALSE,
      extensions = 'Buttons', options = list(dom = 'B', 
                                             buttons = list(list(extend = "colvis", 
                                                                 text = "Exibir/Ocultar Mais Dados")),
                                             columnDefs = list(list(visible=FALSE, targets=c(2,3,4)))
      )
    )  
  })
  
  #Pergunta 4  
  output$bairrosMaisReservas = renderDataTable({
    dt = airbnb %>%
      group_by(Bairro) %>%
      filter(n()>=input$minAnunciosBairro) %>%
      summarise(reviewsMedia=round(mean(number_of_reviews), digits = 2),
                reviewsMediaMes=round(mean(reviews_per_month, na.rm=TRUE), digits = 2),
                totalAnuncios = n_distinct(id),
                precoMedio=round(mean(price, na.rm=TRUE), digits = 2)
                ) %>%
      arrange(-reviewsMedia) %>%
      rename("Total de anúncios" = totalAnuncios) %>%
      rename("Preço Médio (R$)" = precoMedio)%>%
      rename("Média de Reviews" = reviewsMedia) %>%
      rename("Média Reviews/Mês" = reviewsMediaMes) %>%
      head(input$maxResultados)
    datatable(
      dt, rownames = FALSE,
      extensions = 'Buttons', options = list(dom = 'B', 
                                             buttons = list(list(extend = "colvis", 
                                                                 text = "Exibir/Ocultar Mais Dados")),
                                             columnDefs = list(list(visible=FALSE, targets=c(2,3,4)))
      )
    )  
  })
  
  #Pergunta 5  
  output$bairrosMaisReservasMensal = renderDataTable({
    dt = airbnb %>%
      group_by(Bairro) %>%
      filter(n()>=input$minAnunciosBairro) %>%
      summarise(reviewsMediaMes=round(mean(reviews_per_month, na.rm=TRUE), digits = 2),
                reviewsMedia=round(mean(number_of_reviews), digits = 2),
                totalAnuncios = n_distinct(id),
                precoMedio=round(mean(price, na.rm=TRUE), digits = 2)
                ) %>%
      arrange(-reviewsMediaMes) %>%
      rename("Total de anúncios" = totalAnuncios) %>%
      rename("Preço Médio (R$)" = precoMedio)%>%
      rename("Média de Reviews" = reviewsMedia) %>%
      rename("Média Reviews/Mês" = reviewsMediaMes) %>%
      head(input$maxResultados)
    datatable(
      dt, rownames = FALSE,
      extensions = 'Buttons', options = list(dom = 'B', 
                                             buttons = list(list(extend = "colvis", 
                                                                 text = "Exibir/Ocultar Mais Dados")),
                                             columnDefs = list(list(visible=FALSE, targets=c(2,3,4)))
      )
    )  
  })
  
  #Pergunta 6  
  output$tipoAptMaisProcurado = renderDataTable({
    dt = airbnb %>%
      group_by(room_type)%>%
      summarise(totalAnuncios = n_distinct(id),
                reviewsMediaMes = round(mean(reviews_per_month, na.rm=TRUE), digits = 2),
                precoMedio=round(mean(price, na.rm=TRUE), digits = 2)) %>%
      arrange(-reviewsMediaMes) %>%
      head(input$maxResultados) %>%
      rename("Tipo de acomodação" = room_type) %>%
      rename("Média Mensal de Reviews" = reviewsMediaMes) %>%
      rename("Total de anúncios" = totalAnuncios) %>%
      rename("Preço Médio (R$)" = precoMedio)
    datatable(
      dt, rownames = FALSE,
      options = list(dom = '')
    )  
  })
  
  #Pergunta 7  
  output$aptMaisOcupado = renderDataTable({
    dt = airbnb %>%
      group_by(Bairro) %>%
      filter(n()>=input$minAnunciosBairro) %>%
      select(listing_url, Bairro, number_of_reviews, price) %>%
      arrange(-number_of_reviews) %>%
      head(input$maxResultados) %>%
      rename("URL do anúncio" = listing_url) %>%
      rename("Reviews" = number_of_reviews) %>%
      rename("Preço (R$)" = price)
    datatable(
      dt, rownames = FALSE,
      options = list(dom = '')
    )  
  })
  
  #Pergunta 8  
  output$aptMaisOcupadoMes = renderDataTable({
    dt = airbnb %>%
      group_by(Bairro) %>%
      filter(n()>=input$minAnunciosBairro) %>%
      select(listing_url, Bairro, reviews_per_month, price) %>%
      arrange(-reviews_per_month) %>%
      head(input$maxResultados) %>%
      rename("URL do anúncio" = listing_url) %>%
      rename("Reviews/Mês" = reviews_per_month) %>%
      rename("Preço (R$)" = price)
    datatable(
      dt, rownames = FALSE,
      options = list(dom = '')
    )  
  })
  
  #Pergunta 9  
  output$totalPorAnunciante = renderDataTable({
    dt = airbnb %>%
      group_by(Bairro) %>%
      filter(n()>=input$minAnunciosBairro) %>%
      group_by(host_id, host_name, host_url) %>%
      summarise(totalAnuncios = n_distinct(id))%>%
      arrange(-totalAnuncios)%>%
      head(input$maxResultados) %>%
      rename("Nome" = host_name) %>%
      rename("URL do Anunciante" = host_url) %>%
      rename("Total de Anúncios" = totalAnuncios) 
    datatable(
      dt, rownames = FALSE,
      options = list(dom = '',
                     columnDefs = list(list(visible=FALSE, targets=c(0)))
      )
    )  
  })
  
  #Pergunta 10
  output$graficoDipersao = renderPlot({
    plot(airbnb$review_scores_rating, airbnb$reviews_per_month)
  })
  
  output$cor = renderPrint({
    cor(!is.na(airbnb$review_scores_rating), !is.na(airbnb$reviews_per_month))
  })
  
  output$corTest = renderPrint({
    cor.test(airbnb$review_scores_rating, airbnb$reviews_per_month)
  })
  
  model = lm(reviews_per_month~review_scores_rating, data=airbnb)
  output$model = renderPrint({
    model
  })
  output$summary = renderPrint({
    summary(model)
  })
  output$anova = renderPrint({
    anova(model)
  })
    
  output$grafico1Modelo = renderPlot({
    plot(model, which=1)
  })
  output$grafico2Modelo = renderPlot({
    plot(model, which=2)
  })
  output$grafico3Modelo = renderPlot({
    plot(model, which=3)
  })
  output$grafico4Modelo = renderPlot({
    plot(model, which=4)
  })
  
  output$ggplot = renderPlot({
    ggplot(airbnb, aes(x=review_scores_rating,y=reviews_per_month,color=price))+ geom_point() + geom_line()
  })
  
  
}

