module Admin
  class HomeController < AdminController
    def index
      authorize User, :index?
      @users = User.all.order(
        created_at: :desc,
      ).page(params[:page]).per(15)

      @animes = Anime.all.order(
        created_at: :desc,
      ).page(params[:page]).per(15)

      @favorites = FavoriteAnime.all.order(
        created_at: :desc,
      ).page(params[:page]).per(15)

      @following = FollowAnime.all.order(
        created_at: :desc,
      ).page(params[:page]).per(15)
    end
  end
end
