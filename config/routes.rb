Rails.application.routes.draw do
  root 'top#index'
  get 'reservations/index'
  get 'rooms/index'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }
  resources :rooms 
  resources :reservations
  resources :users, only: [:show]
  get '/mypage' => 'users#mypage'

end
