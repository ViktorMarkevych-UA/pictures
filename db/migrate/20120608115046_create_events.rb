class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_type
      t.integer :event_id

      t.timestamps
    end
  end
end
