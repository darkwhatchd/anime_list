require "rails_helper"

RSpec.describe "Admin::Anime without authentication", type: :request do
  context "GET /animes" do
    let(:url) { "/admin/animes" }
    let!(:animes) { create_list(:anime, 5, cover: fixture_file_upload("test.jpg", "image/jpg")) }

    before(:each) { get url }

    include_examples "unauthenticated access"
  end

  context "POST /animes" do
    let(:url) { "/admin/animes" }

    before(:each) { post url }

    include_examples "unauthenticated access"
  end

  context "PATCH /animes/:id" do
    let(:anime) { create(:anime, cover: fixture_file_upload("test.jpg", "image/jpg")) }
    let(:url) { "/admin/animes/#{anime.id}" }

    before(:each) { patch url }

    include_examples "unauthenticated access"
  end

  context "DELETE /animes/:id" do
    let!(:anime) { create(:anime, cover: fixture_file_upload("test.jpg", "image/jpg")) }
    let(:url) { "/admin/animes/#{anime.id}" }

    before(:each) { delete url }

    include_examples "unauthenticated access"
  end
end
