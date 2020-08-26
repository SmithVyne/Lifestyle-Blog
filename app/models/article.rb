class Article < ApplicationRecord
  belongs_to :author, class_name: "User"
  
  has_many :votes
  
  has_many :articles_categories, foreign_key: :category_id
  has_many :categories, through: :articles_categories

  validates :title, presence: true,
                    length: { maximum: 50 }
  validates :text, presence: true
  validates :image, presence: true
end
