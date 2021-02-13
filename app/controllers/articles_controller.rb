class ArticlesController < ApplicationController
  # sets what index populates, sets articles variable to for each
  def index
    @articles = Article.all
  end
  # sets what show populates, finds that article by request parameter
  def show
    @article = Article.find(params[:id])
  end
  
  # instantiates a new article, does not save --  works as a new Article entry for new articles
  def new
    @article = Article.new
  end

  # instantiates a new article, if saved navigates to that article!
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  # Requires article, and allows addition of title / body -- variable for article fields
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
