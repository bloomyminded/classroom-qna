class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_question, only: [:create]

  def new
    @comment = Comment.new
  end
  
  def create
    @comment = @question.comments.create(comment_params)
    @comment.user_id = @user.id

    if @comment.save
      redirect_to question_path(@question), notice: "Comment was created!"
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment

    if @comment.destroy
      redirect_to :back, notice: "Comment was deleted!"
    else
      render :new, notice: "Deletion failed!"
    end
  end

  private

  def get_question
    @question = Question.find(params[:question_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :question_id)
  end

end
