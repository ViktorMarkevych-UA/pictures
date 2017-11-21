class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :eventtable_type
      t.integer :eventtable_id
      t.integer :user_id
      t.text :eventtable_body

      t.timestamps
    end
  end
end
