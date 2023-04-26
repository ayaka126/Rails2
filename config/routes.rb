Rails.application.routes.draw do
  root 'top#index'
  get 'rooms/search'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }
  get 'users/mypage' => 'users#mypage'
  resources :rooms do
    resources :reservations
  end
  post 'reservation/confirm' => 'reservations#confirm'
  post 'rooms/:room_id/reservations' => 'reservations#create'
  get 'rooms/:room_id/reservations/:id/edit' => 'reservations#edit'
  delete 'rooms' => 'rooms#destroy'
  resources :users
end
