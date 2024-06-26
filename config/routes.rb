Rails.application.routes.draw do
  root 'items#index'

  get 'about', to: 'pages#about'

  resources :items, only: [:index, :show]
end
