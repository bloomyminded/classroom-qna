class QuestionsController < ApplicationController
  before_action :set_question

  def index

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

  def set_question
    @question = Question.find(params[:id])
  end

  def questions_params
    params.require(:question).permit(:body)
  end
end
