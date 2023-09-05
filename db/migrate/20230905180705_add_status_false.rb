class AddStatusFalse < ActiveRecord::Migration[7.0]
  def up
    change_column_default :members, :status, false
  end

  def down
    change_column_default :members, :status, nil
  end
end
