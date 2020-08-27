class VotesController < ApplicationController

  def create
    @article = Article.find(params[:id])
    @vote = current_user.votes.create(article_id: @article.id)
    if @vote
      redirect_to @article
    end
  end
end
