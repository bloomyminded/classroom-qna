class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_user

  def not_found
      raise ActionController::RoutingError.new('Not Found')
  end

  def authenticate_admin! 
    if @user.is_admin?
      true
    else
      return redirect_to "/"
    end
  end

  private

  def get_user
    @user = current_user
  end

end
