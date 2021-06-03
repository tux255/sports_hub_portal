module Admin
  class BaseController < ApplicationController
    layout 'admin/admin_layout'
    before_action :authenticate_user!
  end
end
