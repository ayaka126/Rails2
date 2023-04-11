Rails.application.routes.draw do
  root 'top#index'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }
  get '/mypage' => 'users#mypage'
  resources :rooms do
    resources :reservations do
      member do
        post 'confirm' => 'reservations#confirm'
      end
    end
  end
  post 'rooms/:room_id/reservations' => 'reservations#create'
  get '/rooms/:room_id/reservations/:id/edit' => 'reservations#edit'
  delete 'rooms' => 'rooms#destroy'
  resources :users
end
