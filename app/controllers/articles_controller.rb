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
    @article = current_user.articles.build(article_params)
    if @article.save
      ArticlesCategory.create(article: @article, category_id: params[:category])
      flash[:success] = "Article successfully created"
      redirect_to @article
    else
      flash[:errors] = @article.errors.full_messages
      redirect_to new_article_path
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
