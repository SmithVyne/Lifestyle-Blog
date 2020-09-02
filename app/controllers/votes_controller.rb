class VotesController < ApplicationController
  def create
    @article = Article.find(params[:id])
    @vote = current_user.votes.create(article: @article)
    redirect_to articles_path if @vote
  end
end
