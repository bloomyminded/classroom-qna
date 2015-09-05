class LecturesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_instance, only: [:show]

  def index
    @course = Course.find(params[:course_id])
    authenticate_student!
    @lectures = @course.lectures
  end

  def show
    authenticate_student!
    @questions = @lecture.questions
  end

  private
  
  def authenticate_student!
    if ( current_user.is_admin? || current_user.is_student?(@course) )
      true
    else
      return redirect_to "/"
    end
  end

  def get_instance
    @lecture = Lecture.find(params[:id])
    @course = @lecture.course
  end

  def private_params
    params.require(:lecture).permit(:course, :question)
  end

end
