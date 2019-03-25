Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    get 'hosted_suppers', to:  'users#get_hosted_suppers'
    post 'hosted_suppers', to: 'suppers#create_new_supper'
    get 'attended_suppers', to: 'users#get_attended_suppers'
    get 'user_info', to: 'users#user_info'
    post 'attended_suppers', to: 'bookings#create_attended_supper'
    delete 'attended_suppers', to: 'bookings#delete_attended_supper'
  end

  resources :bookings, only: [:index, :update]
  resources :suppers, only: [:index, :update, :destroy]

  post 'login', to: 'users#login'
  get 'validate', to: 'users#validate'


end
