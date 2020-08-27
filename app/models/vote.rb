class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  def self.most_voted
    articles = self.group(:article).count
    max = articles.max_by{|k,v| v}[0]
  end
end
