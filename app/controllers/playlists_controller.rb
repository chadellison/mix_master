class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.create(playlsit_params)
    redirect_to @playlist
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  private

  def playlsit_params
    params.require(:playlist).permit(:name, song_ids: [])
  end
end
