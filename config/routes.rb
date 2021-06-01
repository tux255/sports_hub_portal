Rails.application.routes.draw do
  root 'articles#index' # same as root to: 'articles#index'

  devise_for :users
  # TODO: change sign paths
  # as :user do
  #   get 'signin', to: 'devise/sessions#new'
  #   get 'signup', to: 'devise/registrations#new'
  #   delete 'signout', to: 'devise/sessions#destroy'
  # end

  resources :articles, only: %i[show index]

  namespace :admin do
    resources :users do
      post :lock_access, on: :member
      post :unlock_access, on: :member
    end
    # get 'surveys', to: 'surveys#index'
    # post 'users/lock_access', to: 'users#lock_access'
  end
end
