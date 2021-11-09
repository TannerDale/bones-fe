Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  resources :dogs
  get '/dashboard', to: 'users#show'

  resources :users, only: [:edit, :update]

  resources :play_dates, only: [:index, :new, :create, :update]

  delete 'logout', to: 'sessions#destroy'

  resources :locations, only: :index

end
