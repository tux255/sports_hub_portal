Rails.application.routes.draw do
  devise_for :users

  resources :articles
  root 'articles#index' # same as root to: 'articles#index'
end
