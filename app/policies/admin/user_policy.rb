class Admin::UserPolicy < AdminPolicy
  def index?
    raise Pundit::NotAuthorizedError, "Forbidden access" unless user&.admin?
    user&.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
