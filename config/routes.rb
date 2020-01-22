Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products do
    collection do
      get :category_find
      get :search
      get :tag_search
      get :tags_index
    end
    member do
      get :category_show
    end
  end
  resources :users, only: :show
end
