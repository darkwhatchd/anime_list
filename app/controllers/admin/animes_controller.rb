module Admin
  class AnimesController < AdminController
    before_action :set_anime, only: %i[show edit update destroy]

    def index
      authorize Anime, :index?
      @animes = Anime.all
    end

    def show
      authorize Anime, :show?
    end

    def new
      authorize Anime, :new?
    end

    def edit
      authorize Anime, :edit?
    end

    def create
      authorize Anime, :create?

      @anime = Anime.new
      @anime.attributes = anime_params

      if @anime.save
        redirect_to admin_animes_path, notice: "Anime was successfully created.", status: :ok
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      authorize Anime, :update?

      @anime.attributes = anime_params

      if @anime.save
        redirect_to admin_animes_path, notice: "Anime was successfully updated.", status: :ok
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize Anime, :destroy?

      @anime.destroy
      redirect_to admin_users_path, notice: "User was successfully destroyed.", status: :ok
    end

    private

    def set_anime
      @anime = Anime.find(params[:id])
    end

    def anime_params
      params.require(:anime).permit(:id, :name, :description, :status, :cover, :release_date, :finish_date)
    end
  end
end
