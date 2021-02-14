class CommentsController < ApplicationController
  
  # restricts who can delete comments
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  # allows Article show to create a new comment.
  # @article.comments.create adds to comments array in article.
  # redirect as a form of rendering
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  # allows a comment to be deleted
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  # sets the required fields for comment addition / editing
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
