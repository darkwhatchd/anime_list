module Admin
  class HomeController < AdminController
    def index
      authorize User, :index?
    end
  end
end
