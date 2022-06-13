Blorgh::Engine.routes.draw do
  root to: "articles#index"
  get "/articles/:article_id/comments/:id/reply", to: "comments#show_reply", as: "reply"
  post "/articles/:article_id/comments/:parent_id/", to: "comments#create_reply", as: "create_reply"

  get "/reports/show", to: "reports#show"
  get "/reports/", to: "reports#index"
  get "/reports/download", to: "reports#download"

  resources :articles do
    resources :comments
  end
end
