class QuestionsController < ApplicationController
  before_action :authenticate_user!

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

end
