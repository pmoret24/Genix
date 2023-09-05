class Project < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: "owner_id"

  validates :title, :description, :category, :languages, :links, presence: true

  validates :title, length: { in: 5..100 }
  validates :description, length: { in: 10..1000 }
  validates :category, length: { maximum: 50 }
  validates :languages, length: { maximum: 350 }
  validates :github, presence: true

  validates :github, format: { with: URI::DEFAULT_PARSER.make_regexp(['http', 'https']), message: 'must be a valid URL' }

  validates :owner, presence: true
end
