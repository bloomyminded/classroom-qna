class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_question

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @comments = @question.comments
  end

  def new
  end
  
  def create
  end

  def destroy
  end

  private

  def get_question
    @question = Question.find(params[:id])
    @lecture = @question.lecture
    @course = @lecture.course
  end

  def private_params
    params.require(:question)
  end

end
