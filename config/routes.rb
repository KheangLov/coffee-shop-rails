Rails.application.routes.draw do
  # get 'homes/index'

  namespace :admin do
    get 'stock_categories/index'
  end

  namespace :admin do
    get 'stocks/index'
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }

  root "homes#index"

  namespace :admin do
    get 'users/dashboard'
    resources :branches
    resources :stock_categories
    resources :stocks
    resources :users
    resources :companies
  end

  namespace :my do
    get 'users/dashboard'
    resources :companies
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
