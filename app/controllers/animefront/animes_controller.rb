module Animefront
  class AnimesController < ClientController
    def index
      authorize Anime, :index?
      @animes = Anime.all
    end

    def show
      authorize Anime, :show?
      @anime = Anime.find(params[:id])
    end
  end
end
