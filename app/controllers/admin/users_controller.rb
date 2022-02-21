module Admin
  class UsersController < AdminController
    before_action :set_user, only: %i[show edit update destroy]

    def index
      authorize User, :index?
      @users = User.all.order(
        created_at: :desc,
      ).page(params[:page]).per(15)
    end

    def show
      authorize User, :show?
      @favorites = @user.favorite_animes.order(
        created_at: :desc,
      ).page(params[:page]).per(15)

      @following = @user.follow_animes.order(
        created_at: :desc,
      ).page(params[:page]).per(15)
    end

    def new
      authorize User, :new?
      @user = User.new
    end

    def edit
      authorize User, :edit?
    end

    def create
      authorize User, :create?

      @user = User.new
      @user.attributes = user_params
      if @user.save
        redirect_to admin_users_path, notice: "User was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      authorize User, :update?

      @user.attributes = user_params

      if @user.save
        redirect_to admin_users_path, notice: "User was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize User, :destroy?

      @user.destroy
      redirect_to admin_users_path, notice: "User was successfully destroyed."
    end

    private

    def user_params
      params.require(:user).permit(:id, :name, :email, :password, :password_confirmation, :profile)
    end

    def set_user
      @user = User.find(params[:id])
    end
  end
end
