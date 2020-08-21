class Article < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :votes

  validates :title, presence: true,
                    length: { maximum: 50 }
  validates :text, presence: true
  validates :image, presence: true
end
