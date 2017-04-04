Rails.application.routes.draw do
  root :to =>  'home#index'

  devise_for :users, controllers: { registrations: "registrations"}
  resources :users do
    resources :contacts
  end
  resources :users  do
    resources :messages
  end
end
