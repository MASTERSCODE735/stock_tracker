Rails.application.routes.draw do
  root "welcome#index"
  get '/my_portfolio',to: "users#my_portfolio"
  get 'stock_search', to: 'stocks#stock_search'
  devise_for :users
  resources :user_stocks
end


