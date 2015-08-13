class QuestionsController < ApplicationController
  before_action :set_question, only: [:upvote_question, :show, :edit, :update, :destroy]
  before_action :upvote, only: :upvote_question

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
    @comment = Comment.new(question: @question)
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @questions = Question.all
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    
    redirect_to @question, notice: 'Question was sucessfully updated.'
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    redirect_to @question, notice: 'Question was successfully updated.'
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  def upvote_question
    @question.increment_counter(:upvote, 5)
    redirect_to questions_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :description)
    end
end
