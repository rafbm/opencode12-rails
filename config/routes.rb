OpenCode12::Application.routes.draw do
  root to: 'home#index'

  resources :signups, only: [:new, :create]
end
