Rails.application.routes.draw do
  resources :requirements, only: [:index, :create] do
    resources :comments, only: [:create]
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'requirements#index'
  post 'requirements/:id/positive', to:'requirements#positive', as: 'positive'
  post 'requirements/:id/negative', to:'requirements#negative', as: 'negative'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
