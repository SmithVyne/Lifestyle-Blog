class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  def self.most_voted
    if any?
      articles = group(:article).count
      articles.max_by { |k, v| v }[0]
    end
  end
end
