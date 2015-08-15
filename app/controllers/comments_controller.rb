class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @question = Question.find(params[:question_id])
    @comment  = @question.comments.create(comment_params)

    if @comment.save
      redirect_to questions_path, notice: "Comment was created!"
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :question_id)
  end

end
