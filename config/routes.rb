Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :users, only: [:show] 
  resources :relationships, only: [:create, :destroy]
  resources :posts, except: :index do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end

  resources :cards, only: [:new, :show] do
    collection do
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  
  # resource "posts", only: :show do
  #   resources :cards, only: :buy do
  #     collection do
  #       post "buy", to: "cards#buy"
  #     end
  #   end
  # end
end
