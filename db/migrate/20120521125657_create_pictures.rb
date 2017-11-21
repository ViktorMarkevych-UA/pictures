class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.integer :cat_id
      t.string :img

      t.timestamps
    end
  end


end
