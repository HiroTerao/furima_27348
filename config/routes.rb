Rails.application.routes.draw do
  root "items#index"
  devise_for :users
  resources :users
  resources :items do
    resources :transactions
  end
  resources :orders, only:[:create]
end
