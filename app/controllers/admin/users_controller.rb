module Admin
  class UsersController < AdminController
    before_action :set_user, only: %i[show edit update destroy]

    def index
      authorize User, :index?
      @users = User.all
    end

    def show
      authorize User, :show?
    end

    def new
      authorize User, :new?
    end

    def edit
      authorize User, :edit?
    end

    def create
      authorize User, :create?

      @user = User.new
      @user.attributes = user_params
      if @user.save
        redirect_to admin_users_path, notice: "Quiz category was successfully created.", status: :ok
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      authorize User, :update?

      @user.attributes = user_params

      if @user.save
        redirect_to admin_users_path, notice: "Quiz category was successfully updated.", status: :ok
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize User, :destroy?

      @user.destroy
      redirect_to admin_users_path, notice: "Quiz category was successfully destroyed.", status: :ok
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
