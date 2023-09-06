class Favorite < ApplicationRecord
  belongs_to :pitch
  belongs_to :user
  validates :user, uniqueness: { scope: :pitch, message: "is already a favorite" }
end
