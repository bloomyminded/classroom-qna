class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = Course.all #scope to current user
  end
end
