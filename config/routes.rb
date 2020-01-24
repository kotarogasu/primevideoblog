Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products do
    collection do
      get :index_tv
      get :category_find
      get :search
      get :tags_index
      # get :
    end
    member do
      get :category_show
      get :tag_search
    end
  end
  resources :users, only: :show
end
