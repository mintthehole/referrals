class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin_user!
    if current_user.nil?
      redirect_to root_url
      return
    end
  end
end
