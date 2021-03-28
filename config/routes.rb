Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, except: [ :delete ] do
    resources :bookings, except: [ :delete ]
    resources :reviews, except: [ :edit, :update, :delete ]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
