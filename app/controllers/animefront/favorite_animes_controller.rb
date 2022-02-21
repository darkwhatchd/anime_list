module Animefront
  class FavoriteAnimesController < ClientController
    before_action :authenticate_user!

    def index
      authorize FavoriteAnime, :index?
      @favorites = current_user.favorite_animes.order(
        created_at: :desc,
      ).page(params[:page]).per(5)
    end

    def create
      @favorite = current_user.favorite_animes.new(anime: Anime.find(params[:anime_id]))
      authorize @favorite, :create?

      if @favorite.save
        FollowFavorite.new(current_user, @favorite).follow_favorite

        redirect_to "/favorites"
      else
        flash.now[:notice] = "Unable to favorite this anime"
      end
    end

    def destroy
      @favorite = current_user.favorite_animes.find(params[:id])
      authorize @favorite, :destroy?

      if @favorite.destroy
        redirect_to "/favorites"
      else
        flash.now[:notice] = "Unable to unfavorite this anime"
      end
    end
  end
end
