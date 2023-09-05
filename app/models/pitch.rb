class Pitch < ApplicationRecord
  belongs_to :user

  validates :title, :languages, :category, :description, :source, presence: true
end
