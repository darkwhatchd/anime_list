module Animefront
  class AnimesController < ClientController
    def index
      @animes = Anime.all
    end

    def show
      @anime = Anime.find(params[:id])
    end
  end
end
