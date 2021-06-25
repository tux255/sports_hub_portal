Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts, only: %i[show index]

  # get 'page/:name' => 'page#show'

  namespace :admin do
    # Admin pages here
    root 'home#index'

    resources :surveys
    post 'surveys/vote' => 'surveys#vote', as: 'survey_vote'
    post 'surveys/close' => 'surveys#close', as: 'survey_close'
    post 'surveys/publish' => 'surveys#publish', as: 'survey_publish'

    resources :users
    resources :posts
    resources :categories
    resources :banners

    get 'languages' => 'languages#show'
    get 'footer' => 'footer#show'
    get 'social-networks' => 'social_networks#show'
    get 'users' => 'users#index'
    get 'ia' => 'ia#show'
    get 'teams' => 'teams#show'
    get 'partners-news' => 'partners_news#show'
    get 'advertising' => 'advertising#show'

    # Devise lock/unlock user actions
    patch :lock_access
    patch :unlock_access
  end
end
