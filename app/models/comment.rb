class Comment < ApplicationRecord
  belongs_to :pitch_id
  belongs_to :user_id

  validates :content, presence: true
  validates :rating, presence: true
end
