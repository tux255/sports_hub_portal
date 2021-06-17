module Admin
  class IaController < Admin::BaseController
    def show
      @ia = Category.all
    end
  end
end
