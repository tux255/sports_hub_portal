module Admin
  class UsersController < Admin::BaseController
    before_action :authenticate_user!
    after_action :verify_authorized

    def index
      @users = User.all
      authorize User
    end

    def show
      @users = User.all
      authorize User
    end

    def update
      @user = User.find(params[:id])
      authorize @user

      if @user.update(secure_params)
        redirect_to admin_users_path, notice: 'User updated.'
      else
        redirect_to admin_users_path, notice: 'Unable to update user.'
      end
    end

    def destroy
      user = User.find(params[:id])
      authorize user
      user.destroy
      redirect_to admin_users_path, notice: 'User deleted.'
    end

    def secure_params
      params.require(:user).permit(:role)
    end

    def lock_access
      user = User.find(params[:id])
      authorize user
      user.lock_access!({ send_instructions: false })
      redirect_to admin_users_path, notice: 'User locked.'
    end

    def unlock_access
      user = User.find(params[:id])
      authorize user
      user.unlock_access!
      redirect_to admin_users_path, notice: 'User unlocked.'
    end
  end
end
