module Admin
  class IaController < ApplicationController
    layout 'admin/admin_layout'

    def show
      @ia = 'some ia no idea what is ia'
    end
  end
end
