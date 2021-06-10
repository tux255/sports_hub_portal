module Admin
  class HomeController < Admin::BaseController
    def show
      @home_content = 'some home content'
    end
  end
end
