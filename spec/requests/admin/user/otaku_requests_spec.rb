require "rails_helper"

RSpec.describe "Admin::User as :otaku", type: :request do
  let!(:otaku_user) { create(:user, profile: :otaku) }

  context "GET /users" do
    let(:url) { "/admin/users" }
    let!(:users) { create_list(:user, 5) }

    before(:each) { get url, headers: sign_in(otaku_user) }

    include_examples "forbidden access"
  end

  context "POST /users" do
    let(:url) { "/admin/users" }

    before(:each) { post url, headers: sign_in(otaku_user) }

    include_examples "forbidden access"
  end

  context "PATCH /users/:id" do
    let(:user) { create(:user) }
    let(:url) { "/admin/users/#{user.id}" }

    before(:each) { patch url, headers: sign_in(otaku_user) }

    include_examples "forbidden access"
  end

  context "DELETE /users/:id" do
    let!(:user) { create(:user) }
    let(:url) { "/admin/users/#{user.id}" }

    before(:each) { delete url, headers: sign_in(otaku_user) }

    include_examples "forbidden access"
  end
end
