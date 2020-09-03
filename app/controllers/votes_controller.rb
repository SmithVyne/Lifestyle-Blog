class VotesController < ApplicationController
  def create
    @article = Article.find_by(vote_params)
    @vote = current_user.votes.new(article: @article)
    redirect_to articles_path if @vote.save
  end
  
  private
  
  def vote_params
    params.permit(:id)
  end
end
