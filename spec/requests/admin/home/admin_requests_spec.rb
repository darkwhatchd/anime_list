require "rails_helper"

RSpec.describe "Admin::Home as :admin", type: :request do
  describe "GET /index" do
    let(:user) { create(:user) }
    let(:url) { "/admin" }

    it "tests home" do
      get url, headers: sign_in(user)
      expect(response).to have_http_status(:ok)
    end
  end
end
