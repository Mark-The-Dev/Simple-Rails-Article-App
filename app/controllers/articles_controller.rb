class ArticlesController < ApplicationController
  # sets what index populates, sets articles variable to for each
  def index
    @articles = Article.all
  end
  # sets what show populates, finds that article by request parameter
  def show
    @article = Article.find(params[:id])
  end
end
