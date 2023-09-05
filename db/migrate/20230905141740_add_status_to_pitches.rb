class AddStatusToPitches < ActiveRecord::Migration[7.0]
  def change
    add_column :pitches, :status, :boolean, default: false
  end
end
