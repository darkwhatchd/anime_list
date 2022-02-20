require "rails_helper"

RSpec.describe "Animefront::FollowAnimes, as :otaku", type: :request do
  let(:otaku) { create(:user, profile: :otaku) }

  context "GET /following" do
    let(:url) { "/following" }

    it "returns http status success" do
      get url, headers: sign_in(otaku)

      expect(response).to have_http_status(:ok)
    end
  end

  context "POST /animes/:anime_id/follow_animes" do
    let!(:anime) { create(:anime, cover: fixture_file_upload("test.jpg", "image/jpg")) }
    let(:follow_anime_params) { { follow_anime: attributes_for(:follow_anime, anime_id: anime.id) } }
    let(:url) { "/animes/#{follow_anime_params[:follow_anime][:anime_id]}/follow_animes" }

    it "adds a new followed anime" do
      expect do
        post url, headers: sign_in(otaku), params: follow_anime_params
      end.to change(FollowAnime, :count).by(1)
    end

    it "returns last Anime followed" do
      post url, headers: sign_in(otaku), params: follow_anime_params
      expected_anime = otaku.follow_animes.last.anime
      expect(follow_anime_params[:follow_anime][:anime_id]).to eq expected_anime.id
    end

    it "returns success status" do
      post url, headers: sign_in(otaku), params: follow_anime_params
      expect(response).to have_http_status(:ok)
    end
  end

  context "DELETE /animes/:anime_id/follow_animes/:id" do
    let!(:follow_anime) { create(:follow_anime, user: otaku, anime: create(:anime, cover: fixture_file_upload("test.jpg", "image/jpg"))) }
    let(:url) { "/animes/#{follow_anime[:anime_id]}/follow_animes/#{follow_anime[:id]}" }

    it "removes Followed Anime" do
      expect do
        delete url, headers: sign_in(otaku)
      end.to change(FollowAnime, :count).by(-1)
    end

    it "returns success status" do
      delete url, headers: sign_in(otaku)
      expect(response).to have_http_status(:ok)
    end
  end
end
