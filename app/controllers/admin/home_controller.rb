module Admin
  class HomeController < AdminController
    def index
      authorize User, :index?
    end

    def authorize(record, query = nil)
      super([:admin, record], query)
    end
  end
end
