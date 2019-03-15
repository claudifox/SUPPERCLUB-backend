Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :create, :update, :destroy] do
    resources :suppers, only: [:index, :create, :update, :destroy]
    resources :bookings, only: [:index, :create, :update, :destroy]
  end

  post 'login', to: 'users#login'
  get 'validate', to: 'users#validate'
  get 'user_info', to: 'users#user_info'

end
