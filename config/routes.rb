Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'pairs#index'
  resources :pairs, except: [ :index ] do
    resources :bookings, only: [ :new, :create ]
  end
  get '/booking/:id/edit', to: "bookings#edit"
  get '/booking/:id/increment_status', to: "bookings#increment_status", as:'increment'
  get '/booking/:id/decrement_status', to: "bookings#decrement_status", as:'decrement'
  patch '/booking/:id', to: "bookings#update", as:'booking'
  delete '/booking/:id', to: "bookings#destroy"
  resources :profiles, only: [ :create, :show, :edit, :update ]
  get 'profiles/:id/dashboard', to: "profiles#dashboard", as: 'dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
