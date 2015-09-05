class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_question
  before_action :authenticate_student!

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
  end

  def new
  end
  
  def create
  end

  def destroy
  end

  private

  def authenticate_student!
    if ( current_user.is_admin? || current_user.is_student?(@course) )
      true
    else
      return redirect_to "/"
    end
  end

  def get_question
    @question = Question.find(params[:id])
    @lecture = @question.lecture
    @course = @lecture.course
  end

  def private_params
    params.require(:question)
  end

end
