class UnfollowFavorite
  def initialize(user, following)
    @user = user
    @following = following
  end

  def unfollow_favorite
    if @user.favorite_animes.find_by(anime: @following.anime)
      @user.favorite_animes.find_by(anime: @following.anime).destroy
    end
  end
end
