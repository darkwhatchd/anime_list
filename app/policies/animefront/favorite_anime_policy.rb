class Animefront::FavoriteAnimePolicy < ClientPolicy
  def index?
    user&.otaku?
  end

  def create?
    user&.otaku? && record.user == user
  end

  def destroy?
    user&.otaku? && record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
