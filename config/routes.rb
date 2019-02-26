Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'pairs#index'
  resources :pairs, except: [ :index ] do
    resources :bookings, only: [ :new, :create ]
  end
  patch '/booking/:id', to: "bookings#update"
  delete '/booking/:id', to: "bookings#destroy"
  resources :profiles, only: [ :show, :edit, :update ]
  get 'profiles/:id/dashboard', to: "profiles#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
