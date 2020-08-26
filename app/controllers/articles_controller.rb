class ArticlesController < ApplicationController

  def create
    @article = current_user.articles.create(title: params[:title], text: params[:text], image: params[:image])
  end

  private

  # def article_params
  #   params.require(:article).permit(:title, :text, :image)
  # end
end
