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

  # sets link to edit by the specific article.
  def edit
    @article = Article.find(params[:id])
  end

  # re-fetches the editable article and will patch if passes validations
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  # Delete method
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    # could use root path as well!
    redirect_to articles_path
  end


  # Requires article, and allows addition of title / body -- variable for article fields
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
