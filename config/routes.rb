Rails.application.routes.draw do
  root 'top#index'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }
  get '/mypage' => 'users#mypage'
  resources :rooms
  resources :reservations do
    member do
      post 'confirm' => 'reservations#confirm'
    end
  end
  get 'reservations/index'
  get 'reservations/new' => 'reservations#new'
  post 'reservations/confirm' => 'reservations#confirm'
  post 'reservations/back' => 'reservations#back'
  post 'reservations/complete' => 'reservations#complete'

  resources :users, only: [:new, :create, :show] do
    member do
      post :confirm
    end
  end
end
