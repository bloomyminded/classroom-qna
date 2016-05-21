class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_filter :auth_user

  def after_sign_in_path_for(resource)
    courses_path
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def auth_user
    if authenticate_user!
      @user = current_user
    end
  end
end
