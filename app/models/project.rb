class Project < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: "owner_id"

  # Presence validations
  validates :title, :description, :category, :languages, :links, presence: true

  validates :title, length: { in: 5..100 } # Titles usually aren't very long
  validates :description, length: { in: 10..1000 } # Adjust max length as you see fit
  validates :category, length: { maximum: 50 } # Assuming a single-word or short phrase for category
  validates :languages, length: { maximum: 255 } # Adjust if you expect a long list of languages
  validates :github

  validates :github, format: { with: URI::DEFAULT_PARSER.make_regexp(['http', 'https']), message: 'must be a valid URL' }

  validates :owner, presence: true
end
