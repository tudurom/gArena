class UsersController < ApplicationController
  respond_to :html
  before_action :authenticate_user!

  def index
  end
  def show
  end
  def manage
    @users = User.all
    @user = User.new
    respond_with(@users)
  end
  def create
    pass = Devise.friendly_token.first(8)
    user = User.new({:email => params[:user][:email], :password => pass, :password_confirmation => pass, :name => params[:user][:name], :clazz => params[:user][:clazz]})
    user.save!
    flash[:notice] = "Account creation succesful. Password: #{pass}"
    redirect_to :action => "manage"
  end

  private

    def all_users
      @users = User.all
    end

    def user_params
      params.require(:user).permit(:email, :name, :clazz)
    end
end
