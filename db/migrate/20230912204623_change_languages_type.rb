class ChangeLanguagesType < ActiveRecord::Migration[7.0]
  def change
    change_column :pitches, :languages, :string, default: [], array: true, using: "(string_to_array(languages, ','))"
    change_column :projects, :languages, :string, default: [], array: true, using: "(string_to_array(languages, ','))"
    change_column :users, :skills, :string, default: [], array: true, using: "(string_to_array(skills, ','))"
  end
end
