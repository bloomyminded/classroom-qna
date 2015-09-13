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

  def new
    @course = Course.find(params[:course_id])
    @lecture = Lecture.new
  end

  def create
    @course = Course.find(params[:course_id])
    @lecture = @course.lectures.create(lecture_params) 

    if @lecture.save
      redirect_to course_lectures_path(@course), notice: "New lecture created!"
    else
      render :new
    end
  end

  def destroy
    @lecture = Lecture.find(params[:id])

    if @lecture.destroy
      redirect_to :back, notice: "Lecture deleted"
    else
      redirect_to course_lectures_path, notice: "Deletion failed"
    end
  end

  private

  def get_instance
    @lecture = Lecture.find(params[:id])
    @course = @lecture.course
  end

  def lecture_params 
    params.require(:lecture).permit(:course_id, :question, :title)
  end

end
