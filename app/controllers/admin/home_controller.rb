module Admin
  class HomeController < ApplicationController
    layout 'admin/admin_layout'

    def show
      @home_content = 'some home content'
    end
  end
end
