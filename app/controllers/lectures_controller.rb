class LecturesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_instance, only: [:show]

  def index
    @course = Course.find(params[:course_id])
    @lectures = @course.lectures
  end

  def show
    @questions = @lecture.questions
  end

  private

  def get_instance
    @lecture = Lecture.find(params[:id])
    @course = @lecture.course
  end

  def private_params
    params.require(:lecture).permit(:course, :question)
  end

end
