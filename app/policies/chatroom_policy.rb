class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(sender: user).or(scope.where(receiver: user))
    end
  end

  def create?
    true
  end

  def show?
    participant?
  end

  def participant?
    record.sender == user || record.receiver == user
  end
end
