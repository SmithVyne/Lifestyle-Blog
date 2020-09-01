class ArticlesController < ApplicationController
  def index
    @max = Vote.most_voted
    @categories = Category.all
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = current_user.articles.create(article_params)
    if @article
      ArticlesCategory.create(article_id: @article.id, category_id: params[:category])
      redirect_to @article
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.permit(:title, :text, :image)
  end
end
