class Project < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: "owner_id"
  has_many :members, dependent: :destroy

  validates :title, :description, :category, :languages, :github, presence: true

  validates :description, length: { in: 10..1000 }
  validates :category, length: { maximum: 50 }
  validates :languages, length: { maximum: 350 }

  validates :github, format: { with: URI::DEFAULT_PARSER.make_regexp(['http', 'https']), message: 'must be a valid URL' }
  validates :owner, presence: true
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_projects,
    against: [ :title, :languages, :category],
      using: {
      tsearch: { prefix: true }
      }
end
