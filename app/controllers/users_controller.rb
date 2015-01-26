class UsersController < ApplicationController
  respond_to :html
  before_action :authenticate_user!

  def index
  end
  def show
  end
  def manage
    @users = User.all
    respond_with(@users)
  end
end
