class UsersController < ApplicationController
  respond_to :html
  before_action :authenticate_user!

  def index
  end
  def show
    @user = current_user
  end
  def manage
    @users = User.paginate(:page => params[:page], :per_page => 10)
    if can? :manage, @users then
      @user = User.new
      respond_with(@users)
    else
      flash[:error] = t '.flashes.errors.access_denied'
      redirect_to root_url
    end
  end
  def create
    pass = Devise.friendly_token.first(8)
    user = User.new({:email => params[:user][:email], :password => pass, :password_confirmation => pass, :name => params[:user][:name], :clazz => params[:user][:clazz]})
    user.avatar = params[:user][:avatar]
    user.save!
    flash[:success] = t '.flashes.successes.account_creation_success'
    flash[:notice] = t '.flashes.notices.password', password: pass
    redirect_to :action => "manage"
  end
  def update
    @user = User.find(user_params[:id])
    if @user.update(user_params)
      # If password changed, bypass the user
      if @user == current_user then
        sign_in @user, :bypass => true
      end
      flash[:success] = t '.flashes.successes.success'
      redirect_to root_path
    else
      render "show"
    end
  end
  def update_avatar
    current_user.avatar = user_params[:avatar]
    current_user.save!

    redirect_to users_path
  end
  def avatar
    @user = current_user
  end
  def edit
    @user = User.find(user_params[:id])
    respond_with @user
  end
  def destroy
    @user = User.find(params[:id])
    name = @user.name

    if @user.destroy then
      redirect_to manage_users_url, notice: t('.flashes.notices.user_deleted', user_name: name)
    end
  end

  def test_alert
    flash[:success] = "Succes!"
    flash[:notice] = "Notice"
    flash[:alert] = "The monkeys are not safe!"
    flash[:error] = "Zombies ate your brains"
    redirect_to root_url
  end

  def admin
    if can? :manage, :users then
      user = User.find(params[:user][:id])
      user.role = User.roles[:admin]
      user.save
      flash[:success] = "User #{user.name} is now an admin."
    else
      flash[:error] = "Acces denied"
    end
    redirect_to root_url
  end

  def demote
    if can? :manage, :users then
      user = User.find(params[:user][:id])
      user.role = User.roles[:admin]
      user.save
      flash[:success] = "User #{user.name} is no longer an admin."
    else
      flash[:error] = "Acces denied"
    end
    redirect_to root_url
  end

  private

    def all_users
      @users = User.all
    end

    def user_params
      # params.require(:user).permit(:email, :name, :clazz, :password, :password_confirmation)
      params.require(:user).permit(:id, :email, :name, :clazz, :password, :password_confirmation, :role, :avatar, :avatar_cache)
    end
end
