class QuestionsController < ApplicationController
  before_action :set_question, only: [:show]

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show

  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_path, notice: 'Question was added'
    else
      render :new
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
