class Connection < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  def other_person(a_user)
    if a_user == user
      return friend
    else
      return user
    end
  end
end
