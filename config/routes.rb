Blorgh::Engine.routes.draw do
  root to: "articles#index"
  get "/articles/:article_id/comments/:id/reply", to: "comments#show_reply", as: "reply"
  post "/articles/:article_id/comments/:parent_id/", to: "comments#create_reply", as: "create_reply"

  get "/reports/", to: "reports#index"
  get "/reports/:id/download", to: "reports#download", as: "report_download"

  resources :articles do
    resources :comments
  end
end
