Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts, only: %i[show index]

  # get 'page/:name' => 'page#show'

  namespace :admin do
    # Admin pages here
    root 'home#show'

    resources :surveys
    # get 'surveys' => 'surveys#show'
    post 'surveys/vote' => 'surveys#vote', as: 'survey_vote'

    get 'banners' => 'banners#show'
    get 'languages' => 'languages#show'
    get 'footer' => 'footer#show'
    get 'social-networks' => 'social_networks#show'
    get 'users' => 'users#index'
    get 'ia' => 'ia#show'
    get 'teams' => 'teams#show'
    get 'partners-news' => 'partners_news#show'
    get 'advertising' => 'advertising#show'

    resources :users, only: %i[index show]

    # Devise lock/unlock user actions
    post :lock_access
    post :unlock_access
  end
end
