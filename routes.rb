Application.routes.config do

  get "/quotes", route_to: "quotes#index"

end