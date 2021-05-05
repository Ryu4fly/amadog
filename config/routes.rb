Rails.application.routes.draw do
  resources :room_messages
  resources :rooms
  devise_for :users do
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration"
  end

  root to: 'pages#home'

  resources :users, except: [:delete] do
    resources :bookings, except: [:delete]
    resources :reviews, except: %i[edit update delete]
    resources :room_messages
    resources :rooms

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
