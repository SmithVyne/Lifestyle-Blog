class ArticlesController < ApplicationController
  def index
    @max = Vote.most_voted
    @categories = Category.all.order('priority DESC').includes(:articles)
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      @artcat = @article.articles_categories.build(cat_params)
      if @artcat.save
        flash[:success] = ['Article successfully created']
        redirect_to @article
      else
        flash[:errors] = @artcat.errors.full_messages
        redirect_to new_article_path
      end
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

  def cat_params
    params.permit(:category_id)
  end
end
