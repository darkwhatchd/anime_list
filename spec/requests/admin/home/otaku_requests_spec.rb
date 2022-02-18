require "rails_helper"

RSpec.describe "Admin::Home as :otaku", type: :request do
  let(:user) { create(:user, profile: :otaku) }

  context "GET /admin" do
    let(:url) { "/admin" }
    before(:each) { get url, headers: sign_in(user) }

    include_examples "forbidden access"
  end
end
