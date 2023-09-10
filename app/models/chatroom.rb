class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :sender, uniqueness: { scope: :receiver }

  include PgSearch::Model
  pg_search_scope :search_chatrooms,
                  against: [:name],
                  associated_against: {
                    receiver: [ :first_name, :last_name ],
                    sender: [ :first_name, :last_name ]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
