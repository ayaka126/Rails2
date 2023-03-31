Rails.application.routes.draw do
  root 'top#index'
  get 'reservations/index'
  get 'rooms/index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
   }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rooms 
  resources :reservations
end
