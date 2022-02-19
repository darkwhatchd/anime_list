require "rails_helper"

RSpec.describe "Animefront::Homes", type: :request do
  describe "GET /index" do
    it "should return http success" do
      get "/"
      expect(response).to have_http_status(:ok)
    end
  end
end
