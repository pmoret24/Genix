class ChangeDescriptionInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column(:users, :description, :text)
  end
end
