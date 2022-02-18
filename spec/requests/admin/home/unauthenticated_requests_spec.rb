require "rails_helper"

RSpec.describe "Admin::Home without authentication", type: :request do
  context "GET /admin" do
    let(:url) { "/admin" }
    before(:each) { get url }

    include_examples "unauthenticated access"
  end
end
