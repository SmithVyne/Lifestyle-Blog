class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :votes

  has_many :articles_categories, foreign_key: :article_id
  has_many :categories, through: :articles_categories
  has_one_attached :image

  validates :title, presence: true,
                    length: { maximum: 50 }
  validates :text, presence: true
end
