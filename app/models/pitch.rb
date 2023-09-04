class Pitch < ApplicationRecord
  belongs_to :user_id

  validates :title, presence: true
  validates :languages, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :source, presence: true
end
