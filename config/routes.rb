Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :users, only: [:index, :show, :create, :edit, :update] 
  resources :relationships, only: [:create, :destroy]
  resources :messages, only: [:create]
  resources :rooms, only: [:show, :create, :index]
  resources :posts, except: :index do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end

  resources :cards, only: [:new, :show, :index] do
    collection do
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  
end
