module Animefront
  class FollowAnimesController < ClientController
    def index
      @following_animes = current_user.follow_animes
    end

    def create
      @follow_anime = current_user.follow_animes.new(anime: Anime.find(params[:anime_id]))

      if @follow_anime.save
        redirect_to "/following", status: :ok
      else
        flash.now[:notice] = "Unable to follow this anime"
      end
    end

    def destroy
      @following_anime = current_user.follow_animes.find(params[:id])
      if @following_anime.destroy
        redirect_to "/following", status: :ok
      else
        flash.now[:notice] = "Unable to unfollow this anime"
      end
    end
  end
end
