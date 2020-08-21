class User < ApplicationRecord
  has_many :articles
  has_many :votes
  
  validates :name, presence: true,
                   length: { maximum: 30 }
end