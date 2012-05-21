class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.integer :pic_id
      t.references :picture

      t.timestamps
    end
    add_index :comments, :picture_id
  end
end
