class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.order('created_at DESC')
  end

  def create
    @category = Category.create(name: params[:name], priority: params[:priority])

    redirect_to articles_path if @category
  end
end
