require "rails_helper"

RSpec.describe "Admin::Users as :admin", type: :request do
  let!(:admin_user) { create(:user) }
  describe "GET /users" do
    let(:url) { "/admin/users" }

    it "returns success status" do
      get url, headers: sign_in(admin_user)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /users" do
    let(:url) { "/admin/users" }

    context "with valid params" do
      let(:user_params) { { user: attributes_for(:user) } }

      it "adds a new user" do
        expect do
          post url, headers: sign_in(admin_user), params: user_params
        end.to change(User, :count).by(1)
      end

      it "returns last added User name" do
        post url, headers: sign_in(admin_user), params: user_params
        expected_user = User.last
        expect(user_params[:user][:name]).to eq expected_user.name
      end

      it "returns success status" do
        post url, headers: sign_in(admin_user), params: user_params
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      let(:user_invalid_params) do
        { user: attributes_for(:user, name: nil) }
      end

      it "does not add a new User" do
        expect do
          post url, headers: sign_in(admin_user), params: user_invalid_params
        end.to_not change(User, :count)
      end

      it "returns unprocessable_entity status" do
        post url, headers: sign_in(admin_user), params: user_invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "PATCH /users/:id" do
      let(:user) { create(:user) }
      let(:url) { "/admin/users/#{user.id}" }

      context "with valid params" do
        let(:new_name) { "My new User" }
        let(:user_params) { { user: { name: new_name } } }

        it "updates User" do
          patch url, headers: sign_in(admin_user), params: user_params
          user.reload
          expect(user.name).to eq new_name
        end

        it "returns updated User" do
          patch url, headers: sign_in(admin_user), params: user_params
          user.reload
          expected_user = user
          expect(User.find(user.id)).to eq(expected_user)
        end

        it "returns success status" do
          patch url, headers: sign_in(admin_user), params: user_params
          expect(response).to have_http_status(:ok)
        end
      end

      context "with invalid params" do
        let(:user_invalid_params) do
          { user: attributes_for(:user, name: nil) }
        end

        it "does not update User" do
          old_name = user.name
          patch url, headers: sign_in(admin_user), params: user_invalid_params
          user.reload
          expect(user.name).to eq(old_name)
        end

        it "returns unprocessable_entity status" do
          patch url, headers: sign_in(admin_user), params: user_invalid_params
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context "DELETE /users/:id" do
      let!(:user) { create(:user) }
      let(:url) { "/admin/users/#{user.id}" }

      it "removes User" do
        expect do
          delete url, headers: sign_in(admin_user)
        end.to change(User, :count).by(-1)
      end

      it "returns success status" do
        delete url, headers: sign_in(admin_user)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
