class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.time :doors
      t.date :date
      t.references :venue, foreign_key: true

      t.timestamps
    end
  end
end
