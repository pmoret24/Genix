class Comment < ApplicationRecord
  belongs_to :pitch
  belongs_to :user

  validates :content, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
