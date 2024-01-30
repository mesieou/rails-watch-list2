Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks, only: [:create, :index]
  end
  resources :bookmarks, only: [:destroy]
end
