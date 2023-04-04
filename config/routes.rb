Rails.application.routes.draw do
  root 'top#index'
  get 'reservations/index'
  get 'rooms/index'
  get 'reservations/new' => 'reservations#new'
  post 'reservations/confirm' => 'reservations#confirm'
  post 'reservations/back' => 'reservations#back'
  post 'reservations/complete' => 'reservations#complete'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }
  resources :rooms
  resources :reservations
  resources :users, only: [:show]
  get '/mypage' => 'users#mypage'

end
