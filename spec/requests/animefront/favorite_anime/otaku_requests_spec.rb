require "rails_helper"

RSpec.describe "Animefront::FavoriteAnimes, as :otaku", type: :request do
  let(:otaku) { create(:user, profile: :otaku) }

  context "GET /favorites" do
    let(:url) { "/favorites" }

    it "returns http status success" do
      get url, headers: sign_in(otaku)

      expect(response).to have_http_status(:ok)
    end
  end

  context "POST /animes/:anime_id/favorites" do
    let!(:anime) { create(:anime, cover: fixture_file_upload("test.jpg", "image/jpg")) }
    let(:favorite_anime_params) { { favorite_anime: attributes_for(:favorite_anime, anime_id: anime.id) } }
    let(:url) { "/animes/#{favorite_anime_params[:favorite_anime][:anime_id]}/favorite_animes" }

    it "adds a new favorite anime" do
      expect do
        post url, headers: sign_in(otaku), params: favorite_anime_params
      end.to change(FavoriteAnime, :count).by(1)
    end

    it "returns last Anime favorited" do
      post url, headers: sign_in(otaku), params: favorite_anime_params
      expected_anime = otaku.favorite_animes.last.anime
      expect(favorite_anime_params[:favorite_anime][:anime_id]).to eq expected_anime.id
    end

    it "returns found status" do
      post url, headers: sign_in(otaku), params: favorite_anime_params
      expect(response).to have_http_status(:found)
    end
  end

  context "DELETE /animes/:anime_id/favorite_animes/:id" do
    let!(:favorite_anime) { create(:favorite_anime, user: otaku, anime: create(:anime, cover: fixture_file_upload("test.jpg", "image/jpg"))) }
    let(:url) { "/animes/#{favorite_anime[:anime_id]}/favorite_animes/#{favorite_anime[:id]}" }

    it "removes Favorited Anime" do
      expect do
        delete url, headers: sign_in(otaku)
      end.to change(FavoriteAnime, :count).by(-1)
    end

    it "returns found status" do
      delete url, headers: sign_in(otaku)
      expect(response).to have_http_status(:found)
    end
  end
end
