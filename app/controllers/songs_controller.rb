class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update]
  def artist_index
    @artist = Artist.find(params[:artist_id])
    @songs = @artist.songs.order(:title)
  end

  def index
    @songs = Song.all.order(:title)
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @song.update(song_params)

    redirect_to @song
  end

  def destroy
    @song = Song.find(params[:id]).destroy
    @songs = Song.all
    render :index
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title)
  end
end
