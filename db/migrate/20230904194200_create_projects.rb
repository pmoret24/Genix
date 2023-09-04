class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.string :title
      t.text :description
      t.string :category
      t.string :languages
      t.text :github

      t.timestamps
    end
  end
end
