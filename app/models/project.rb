class Project < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  # Presence validations
  validates :title, :description, :category, :languages, :links, presence: true

  # Length validations (adjust as needed)
  validates :title, length: { in: 5..100 } # Titles usually aren't very long
  validates :description, length: { in: 10..1000 } # Adjust max length as you see fit
  validates :category, length: { maximum: 50 } # Assuming a single-word or short phrase for category
  validates :languages, length: { maximum: 255 } # Adjust if you expect a long list of languages
  validates :links, length: { maximum: 1000 } # Adjust based on your needs

  # Format validations
  # For links, you might want to ensure it's a valid URL format:
  validates :links, format: { with: URI::DEFAULT_PARSER.make_regexp(['http', 'https']), message: 'must be a valid URL' }

  # Ensure owner exists (this is somewhat redundant since Rails will ensure a referenced object exists)
  validates :owner, presence: true
end
