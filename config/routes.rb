Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:new, :create]
    get '/songs', to: 'songs#artist_index'
  end

  resources :songs, only: [:show, :edit, :update, :index, :destroy]
  resources :playlists, only: [:index, :new, :create, :show, :edit, :update]
end
