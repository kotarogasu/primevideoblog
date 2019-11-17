Rails.application.routes.draw do
  root "videos#index"
  resources :tweets, only: [:new, :create]
end
