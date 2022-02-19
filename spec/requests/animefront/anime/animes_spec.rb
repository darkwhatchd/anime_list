require "rails_helper"

RSpec.describe "Animefront::Animes", type: :request do
  describe "GET /index" do
    let(:url) { "/animes" }

    context "/animes" do
      it "returns http status success" do
        get url
        expect(response).to have_http_status(:ok)
      end
    end

    context "/animes/:id" do
      let!(:anime) { create(:anime, cover: fixture_file_upload("test.jpg", "image/jpg")) }
      let(:url) { "/animes/#{anime.id}" }

      it "returns http status success" do
        get url
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
