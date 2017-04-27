### Exercise 5 ###
library(jsonlite)
library(dplyr)
library(httr)

# Write a function that allows you to specify a movie, that does the following:
GetReview <- function(movie) {
  # base 
  base.uri <- 'https://api.nytimes.com/svc/movies/v2/reviews/search.json?'
  
  api.key <- '3e692bfb56664a00bf9d6c11cb4dc4a6'
  
  # Create a list of parameters that you want to use 
  query.params <- list(query = movie, api_key = api.key) 
  
  # getting the response 
  response <- GET(base.uri, query = query.params)
  
  # saving that response as a text
  # heads <- headers(response, 'text')
  body <- content(response, "text")
  
  # Construct a search query using YOUR api key
  # The base URL is https://api.nytimes.com/svc/movies/v2/reviews/search.json?
  # Your parameters should include a "query" and an "api_key"
  # Note: the HTTR library will take care of spaces in the arguments
  # See the interactive console for more detail:https://developer.nytimes.com/movie_reviews_v2.json#/Console/GET/reviews/search.json
  
  
  # Request data using your search query
  
  # text body is formated in to JSON 
  results <- fromJSON(body)
  
  # What type of variable does this return?
  # it returns a 
  
  # Flatten the data stored in the `$results` key of the data returned to you
  flattened <- flatten(results$results)
  
  # From the most recent review, store the headline, short summary, and link to full article each in their own variables
  recent.views <- flattened[1,]
  
  headline <- recent.views$headlines
  
  short.summary <- recent.views$summary_short
  
  link <- recent.views$link.url 

  # Return an list of the three pieces of information from above
  info <- list(headline = headline, summary = summary, link=link)
  return(info)
}

# Test that your function works with a movie of your choice
WhyHim <- GetReview('Why Him')
