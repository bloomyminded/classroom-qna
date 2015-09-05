class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_question, only: [:show]

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

  def get_question
    @question = Question.find(params[:id])
  end

end
