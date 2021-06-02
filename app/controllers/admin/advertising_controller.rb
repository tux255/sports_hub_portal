module Admin
  class AdvertisingController < ApplicationController
    layout 'admin/admin_layout'

    def show
      @advertising = 'manage ads here'
    end
  end
end
