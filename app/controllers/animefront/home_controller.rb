module Animefront
  class HomeController < ClientController
    def index
      @animes = Anime.all.sample(5)
      @favorites = current_user.favorite_animes if current_user
      @following = current_user.follow_animes if current_user
    end
  end
end
