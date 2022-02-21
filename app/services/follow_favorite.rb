class FollowFavorite
  def initialize(user, favorite)
    @user = user
    @favorite = favorite
  end

  def follow_favorite
    unless @user.follow_animes.find_by(anime: @favorite.anime)
      @user.follow_animes.create(anime: @favorite.anime)
    end
  end
end
