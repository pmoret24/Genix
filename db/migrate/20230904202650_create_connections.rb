class CreateConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :connections do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false # foreign_key: { to_table: :users } essa parte é opcional
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
