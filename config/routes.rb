Rails.application.routes.draw do
  root 'articles#index' # same as root to: 'articles#index'

  devise_for :users
  # TODO: change sign paths
  # as :user do
  #   get 'signin', to: 'devise/sessions#new'
  #   get 'signup', to: 'devise/registrations#new'
  #   delete 'signout', to: 'devise/sessions#destroy'
  # end

  resources :articles
end
