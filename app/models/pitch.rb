class Pitch < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :photo
  validates :title, :languages, :category, :description, :source, presence: true
end
