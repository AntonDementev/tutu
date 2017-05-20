Rails.application.routes.draw do
  resources :trains do
    resources :waggons, shallow: true
  end
  resources :railway_stations do
    patch :update_number_in_route, on: :member
  end
  resources :routes
  
  resource :search, only: [:show, :update] do
    patch :buy_ticket, on: :member
  end
  
  resources :tickets, only: [:new, :show, :index, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
