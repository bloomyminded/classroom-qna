class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_course, only: [:show]

  def index
    @courses = @user.courses
    @courses = Course.all if @user.has_role? :admin
  end

  def show
    @instructor = User.find(@course.user_id) if @course.user_id?
    @lectures = @course.lectures
  end

  private

  def get_course
    @course = Course.find(params[:id])
  end

  def private_params
    params.require(:course)
  end
end
