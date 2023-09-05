class Member < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :user, :project, presence: true
  validates :user_id, uniqueness: { scope: :project_id, message: "is already a member of this project" }

  validates :status, inclusion: { in: [true, false] }
end
