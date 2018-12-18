Application.routes.config do

  get "/quotes", route_to: "quotes#index"
  get "/v1/quotes/show", route_to: "quotes#show"
  post "/v1/quotes/like", route_to: "like#update"
  post "/v1/quotes/dislike", route_to: "dislike#update"
end