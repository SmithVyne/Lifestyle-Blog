class User < ApplicationRecord
  has_many :articles, foreign_key: 'author_id'
  has_many :votes

  validates :name, presence: true, uniqueness: true,
                   length: { maximum: 30 }

  def voted?(article)
    votes.find_by(article: article)
  end
end
