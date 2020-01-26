Rails.application.routes.draw do
  devise_for :users
  root  'products#index'
  resources :products do
    collection do
      get :post
      get :category_find
      get :search
      get :tags_index
    end
    member do
      get :index
      get :details
      get :category_show
      get :tag_search
    end
  end
  resources :users, only: :show
end
