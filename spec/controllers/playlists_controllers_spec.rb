require "rails_helper"

RSpec.describe PlaylistsController, type: :controller do
  describe "GET #index" do
    it "assigns all playlists as @playlists and renders the index template" do
      playlist = Playlist.create(name: "Jones")

      get(:index)

      expect(assigns(:playlists)).to eq([playlist])
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested playlist as @playlist and renders the show template" do
      playlist = Playlist.create(name: "Jones")
      get(:show, {id: playlist.to_param})
      expect(assigns(:playlist)).to eq(playlist)
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "creates a new playlist as @playlist" do
      get :new
      expect(assigns(:playlist)).to be_a_new(Playlist)
    end
  end

  describe "GET #edit" do
    it "assigns the requested playlist as @playlist" do
      playlist = Playlist.create(name: "Jones")
      get :edit, {id: playlist.to_param}
      expect(assigns(:playlist)).to eq(playlist)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new playlist" do
        song = Song.create(title: "blue", artist: create(:artist))
        expect {
          post :create, {playlist: {name: "jones", song_ids: song.id}}
        }.to change(Playlist, :count).by(1)
      end

      it "assigns a newly created playlist as @playlist" do
        song = Song.create(title: "Arugala", artist: create(:artist))
        post :create, {playlist: {name: "crunchy face", song_ids: song.id}}
        expect(assigns(:playlist)).to be_a(Playlist)
        expect(assigns(:playlist)).to be_persisted
      end
    end

    it "redirects to the created artist" do
      song = Song.create(title: "Arugala", artist: create(:artist))

      post :create, {playlist: {name: "blue people", song_ids: song.id}}
      expect(response).to redirect_to(Playlist.last)
    end
  end

    context "with invalid params" do
      it "assigns a newly created but unsaved playlist as @playlist" do
        song = Song.create(title: "this thing", artist: create(:artist))
        post :create, {playlist: {name: nil, song_ids: song.id}}
        expect(response).to render_template("new")
      end
    end

    describe "Put #update" do
      context "with valid params" do
        it "updates the requested playlist" do
        playlist = create(:playlist)
        put :update, {id: playlist.to_param, playlist: attributes_for(:playlist, name: "Frank")}
        playlist.reload
        expect(playlist.name).to eq("Frank")
      end

      it "assigns the requested playlist as @playlist" do
        playlist = create(:playlist)
        put :update, {id: playlist.to_param, playlist: attributes_for(:artist, name: "Frank again")}
        expect(assigns(:playlist)).to eq(playlist)
      end

      it "redirects to the playlist" do
        playlist = create(:playlist)
        put :update, {id: playlist.to_param, playlist: attributes_for(:playlist, name: "Frank") }
        expect(response).to redirect_to(playlist)
      end
    end

    context "with invalid params" do
      it "assigns the playlist as @playlist" do
        playlist = create(:playlist)
        put :update, {id: playlist.to_param, playlist: attributes_for(:playlist, name: nil)}
        expect(assigns(:playlist)).to eq(playlist)
      end

      it "re-renders the 'edit' template" do
        playlist = create(:playlist)
        put :update, {id: playlist.to_param, playlist: attributes_for(:playlist, name: nil)}
        expect(response).to render_template("edit")
      end
    end
  end
end
