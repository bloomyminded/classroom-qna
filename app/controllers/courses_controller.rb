class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_course, only: [:show]
  before_action :authenticate_student!, only: [:show]

  def index
    @courses = current_user.courses
  end

  def show
    @instructor = User.find(@course.user_id) if @course.user_id?
    @lectures = @course.lectures
  end

  private

  def authenticate_student!
    if ( current_user.is_admin? || current_user.is_student?(@course) )
      true
    else
      return redirect_to "/"
    end
  end

  def get_course
    @course = Course.find(params[:id])
  end

  def private_params
    params.require(:course)
  end
end
