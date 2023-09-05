class Comment < ApplicationRecord
  belongs_to :pitch
  belongs_to :user

  validates :content, length: { minimum: 6 }
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

end
