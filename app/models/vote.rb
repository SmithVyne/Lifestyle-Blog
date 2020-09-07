class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  def self.most_voted
    return unless any?

    articles = group(:article).count
    articles.max_by { |_k, v| v }[0]
  end

  validates :user_id, uniqueness: { scope: :article_id }
end
