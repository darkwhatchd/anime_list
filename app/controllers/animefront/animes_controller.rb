module Animefront
  class AnimesController < ClientController
    def index
      authorize Anime, :index?
      @animes = Anime.all.order(
        created_at: :desc,
      ).page(params[:page]).per(5)
    end

    def show
      authorize Anime, :show?
      @anime = Anime.find(params[:id])
    end
  end
end
