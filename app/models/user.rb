class User < ApplicationRecord
  has_many :articles, foreign_key: 'author_id'
  has_many :votes
  
  validates :name, presence: true, uniqueness: true,
                   length: { maximum: 30 }

  def voted?(article)
    vote = Vote.find_by(user: self, article: article)
  end
end
