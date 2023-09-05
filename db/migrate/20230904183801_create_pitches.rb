class CreatePitches < ActiveRecord::Migration[7.0]
  def change
    create_table :pitches do |t|
      t.string :title
      t.string :languages
      t.string :category
      t.text :description
      t.text :source
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
