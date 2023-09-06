class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :project, null: false, foreign_key: { to_table: :projects }
      t.boolean :status

      t.timestamps
    end
  end
end
