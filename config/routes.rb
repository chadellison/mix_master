Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:new, :create]
  end

  resources :songs, only: [:show, :edit, :update]
end
