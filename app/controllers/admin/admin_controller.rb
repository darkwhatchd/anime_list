module Admin
  class AdminController < ApplicationController
    layout "admin/layouts/application"

    include Pundit::Authorization
    after_action :verify_authorized

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def policy_scope(scope)
      super([:admin, scope])
    end

    def authorize(record, query = nil)
      super([:admin, record], query)
    end

    private

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
  end
end
