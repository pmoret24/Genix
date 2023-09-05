class Pitch < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :languages, :category, :description, :source, presence: true
end
