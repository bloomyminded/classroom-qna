class VotesController < ApplicationController
  
  def new
    @vote = Vote.new
  end

  def create
    @question = Question.find(params[:question_id])
    @vote = @question.votes.create(vote_params)
  end

  private

  def vote_params
    params.require(:vote).permit(:up, :question_id) 
  end
end
