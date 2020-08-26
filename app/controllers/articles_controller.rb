class ArticlesController < ApplicationController

  def create
    @article = current_user.articles.create(title: params[:title], text: params[:text], image: params[:image])
  end
end
