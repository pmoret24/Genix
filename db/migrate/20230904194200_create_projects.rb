class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.references :owner, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :category
      t.string :languages
      t.text :links

      t.timestamps
    end
  end
end
