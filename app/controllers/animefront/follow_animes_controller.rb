module Animefront
  class FollowAnimesController < ClientController
    before_action :authenticate_user!

    def index
      authorize FollowAnime, :index?
      @following_animes = current_user.follow_animes.order(
        created_at: :desc,
      ).page(params[:page]).per(5)
    end

    def create
      @follow_anime = current_user.follow_animes.new(anime: Anime.find(params[:anime_id]))
      authorize @follow_anime, :create?

      if @follow_anime.save
        redirect_to "/following"
      else
        flash.now[:notice] = "Unable to follow this anime"
      end
    end

    def destroy
      @following_anime = current_user.follow_animes.find(params[:id])
      authorize @following_anime, :destroy?

      UnfollowFavorite.new(current_user, @following_anime).unfollow_favorite
      if @following_anime.destroy
        redirect_to "/following"
      else
        flash.now[:notice] = "Unable to unfollow this anime"
      end
    end
  end
end
