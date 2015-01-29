class CommentsController < ApplicationController
  def index
  end

  def new
  end
  def create
  	@article = Article.find(params[:article_id])
    @comment = @article.comment.create(comment_params)
    redirect_to article_path(@article)
  end

  def edit
  end
   private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
