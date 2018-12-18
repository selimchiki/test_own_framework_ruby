Application.routes.config do

  get "/quotes", route_to: "quotes#index"
  get "/quotes/show", route_to: "quotes#show"
end