module Animefront
  class FollowAnimesController < ClientController
    def index
      authorize FollowAnime, :index?
      @following_animes = current_user.follow_animes
    end

    def create
      @follow_anime = current_user.follow_animes.new(anime: Anime.find(params[:anime_id]))
      authorize @follow_anime, :create?

      if @follow_anime.save
        redirect_to "/following", status: :ok
      else
        flash.now[:notice] = "Unable to follow this anime"
      end
    end

    def destroy
      @following_anime = current_user.follow_animes.find(params[:id])
      authorize @following_anime, :destroy?

      if @following_anime.destroy
        UnfollowFavorite.new(current_user, @following_anime).unfollow_favorite
        redirect_to "/following", status: :ok
      else
        flash.now[:notice] = "Unable to unfollow this anime"
      end
    end
  end
end
