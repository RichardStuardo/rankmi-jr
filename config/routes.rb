Rails.application.routes.draw do
  resources :requirements, only: [:index, :create]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'requirements#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
