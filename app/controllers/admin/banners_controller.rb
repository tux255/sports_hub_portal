module Admin
  class BannersController < ApplicationController
    layout 'admin/admin_layout'

    def show
      @banners = 'banners here'
    end
  end
end
