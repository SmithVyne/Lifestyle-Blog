class Category < ApplicationRecord

  has_many :articles_categories, foreign_key: :category_id
  has_many :articles, through: :articles_categories

  validates :name, presence: true, uniqueness: true,
                   length: { maximum: 30 }

  validates :priority, presence: true, 
                   :inclusion => {:in => 1..3}
end
