Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :items, only: [:index, :show]
end
