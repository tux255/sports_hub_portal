Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts, only: %i[show index]

  # get 'page/:name' => 'page#show'

  namespace :admin do
    # Admin pages here
    root 'home#show'

    get 'surveys' => 'surveys#show'
    get 'banners' => 'banners#show'
    get 'languages' => 'languages#show'
    get 'footer' => 'footer#show'
    get 'social-networks' => 'social_networks#show'
    get 'users' => 'users#index'
    get 'ia' => 'ia#show'
    get 'teams' => 'teams#show'
    get 'partners-news' => 'partners_news#show'
    get 'advertising' => 'advertising#show'

    # Devise lock/unlock user actions
    post :lock_accessr
    post :unlock_access
  end
end
