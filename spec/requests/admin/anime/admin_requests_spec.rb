require "rails_helper"

RSpec.describe "Admin::Animes, as :admin", type: :request do
  let!(:admin_user) { create(:user) }
  describe "GET /animes" do
    let(:url) { "/admin/animes" }

    it "returns success status" do
      get url, headers: sign_in(admin_user)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /animes" do
    let(:url) { "/admin/animes" }

    context "with valid params" do
      let(:anime_params) { { anime: attributes_for(:anime, cover: fixture_file_upload("test.jpg", "image/jpg")) } }

      it "adds a new anime" do
        expect do
          post url, headers: sign_in(admin_user), params: anime_params
        end.to change(Anime, :count).by(1)
      end

      it "returns last added Anime name" do
        post url, headers: sign_in(admin_user), params: anime_params
        expected_anime = Anime.last
        expect(anime_params[:anime][:name]).to eq expected_anime.name
      end

      it "returns found status" do
        post url, headers: sign_in(admin_user), params: anime_params
        expect(response).to have_http_status(:found)
      end
    end

    context "with invalid params" do
      let(:anime_invalid_params) do
        { anime: attributes_for(:anime, name: nil) }
      end

      it "does not add a new Anime" do
        expect do
          post url, headers: sign_in(admin_user), params: anime_invalid_params
        end.to_not change(Anime, :count)
      end

      it "returns unprocessable_entity status" do
        post url, headers: sign_in(admin_user), params: anime_invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /animes" do
    context "PATCH /animes/:id" do
      let(:anime) { create(:anime, cover: fixture_file_upload("test.jpg", "image/jpg")) }
      let(:url) { "/admin/animes/#{anime.id}" }

      context "with valid params" do
        let(:new_name) { "My new Anime" }
        let(:anime_params) { { anime: { name: new_name } } }

        it "updates Anime" do
          patch url, headers: sign_in(admin_user), params: anime_params
          anime.reload
          expect(anime.name).to eq new_name
        end

        it "returns updated Anime" do
          patch url, headers: sign_in(admin_user), params: anime_params
          anime.reload
          expected_anime = anime
          expect(Anime.find(anime.id)).to eq(expected_anime)
        end

        it "returns found status" do
          patch url, headers: sign_in(admin_user), params: anime_params
          expect(response).to have_http_status(:found)
        end
      end

      context "with invalid params" do
        let(:anime_invalid_params) do
          { anime: attributes_for(:anime, name: nil) }
        end

        it "does not update Anime" do
          old_name = anime.name
          patch url, headers: sign_in(admin_user), params: anime_invalid_params
          anime.reload
          expect(anime.name).to eq(old_name)
        end

        it "returns unprocessable_entity status" do
          patch url, headers: sign_in(admin_user), params: anime_invalid_params
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  context "DELETE /animes/:id" do
    let!(:anime) { create(:anime, cover: fixture_file_upload("test.jpg", "image/jpg")) }
    let(:url) { "/admin/animes/#{anime.id}" }

    it "removes Anime" do
      expect do
        delete url, headers: sign_in(admin_user)
      end.to change(Anime, :count).by(-1)
    end

    it "returns success status" do
      delete url, headers: sign_in(admin_user)
      expect(response).to have_http_status(:found)
    end
  end
end
