Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, except: [:index] do
    resources :bookmarks, only: [:create, :index]
    resources :reviews, only: [:create]
  end
  resources :bookmarks, only: [:destroy]
end
