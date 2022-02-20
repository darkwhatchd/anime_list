module Animefront
  class FavoriteAnimesController < ClientController
    def index
      authorize FavoriteAnime, :index?
      @favorites = current_user.favorite_animes
    end

    def create
      @favorite = current_user.favorite_animes.new(anime: Anime.find(params[:anime_id]))
      authorize @favorite, :create?

      if @favorite.save
        FollowFavorite.new(current_user, @favorite).follow_favorite

        redirect_to "/favorites", status: :ok
      else
        flash.now[:notice] = "Unable to favorite this anime"
      end
    end

    def destroy
      @favorite = current_user.favorite_animes.find(params[:id])
      authorize @favorite, :destroy?

      if @favorite.destroy
        redirect_to "/favorites", status: :ok
      else
        flash.now[:notice] = "Unable to unfavorite this anime"
      end
    end
  end
end
