class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  def self.most_voted
    articles = group(:article).count
    max = articles.max_by { |_k, v| v }[0]
  end
end
