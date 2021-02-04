Rails
  .application
  .routes
  .draw do
    root 'welcome#index'
    devise_for :users
    get 'my_portfolio', to: 'users#my_portfolio'
    get 'search_stock', to: 'stocks#search'
    resources :user_stocks, only: [:create, :destroy]
    get 'my_friends', to: 'users#my_friends'
    get 'search_friend', to: 'users#search'
    resources :friendships, only: [:create, :destroy]
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
