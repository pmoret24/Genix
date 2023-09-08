class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :sender, uniqueness: { scope: :receiver }
end
