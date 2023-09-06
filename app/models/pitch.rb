class Pitch < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :photo
  validates :title, :languages, :category, :description, :source, presence: true

  include PgSearch::Model
  pg_search_scope :search_pitches,
    against: [ :title, :languages, :category],
      using: {
      tsearch: { prefix: true }
      }
end
