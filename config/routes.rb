Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks, only: [:create, :index]
    resources :reviews, only: [:create]
  end
  resources :bookmarks, only: [:destroy]
end
