Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :watches do
    resources :bookings, shallow: true, except: [:index]
  end

  # make method called dashboard
  # need a view dashboard.html.erb
  get "/dashboard", to: "bookings#dashboard"

end
