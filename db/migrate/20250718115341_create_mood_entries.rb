class CreateMoodEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :mood_entries do |t|
      t.string :mood
      t.text :note
      t.date :entry_date

      t.timestamps
    end
  end
end
