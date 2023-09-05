class Project < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: "owner_id"
  has_many :members

  validates :title, :description, :category, :languages, :github, presence: true

  validates :description, length: { in: 10..1000 }
  validates :category, length: { maximum: 50 }
  validates :languages, length: { maximum: 350 }

  validates :github, format: { with: URI::DEFAULT_PARSER.make_regexp(['http', 'https']), message: 'must be a valid URL' }
  validates :owner, presence: true
end
