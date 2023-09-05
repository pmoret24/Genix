class AddSenderToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :sender, foreign_key: { to_table: :users }
    add_reference :chatrooms, :receiver, foreign_key: { to_table: :users }
  end
end
