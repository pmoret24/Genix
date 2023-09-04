class Comment < ApplicationRecord
  belongs_to :pitch
  belongs_to :user

  validates :content, presence: true
  validates :rating, presence: true
end
