class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.integer :pic_id
      t.references :picture

      t.timestamps
    end
  end
end
