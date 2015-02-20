class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = t('flashes.errors.denied')
    redirect_to root_path
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
