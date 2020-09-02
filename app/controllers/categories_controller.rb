class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.order('created_at DESC')
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "#{@category.name} category created"
      redirect_to articles_path
    else
      flash[:errors] = @category.errors.full_messages
      redirect_to new_category_path
    end
  end

  private

  def category_params
    params.permit(:name, :priority)
  end
end
