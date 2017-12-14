class CreateTablePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.integer 'category_id'
      t.string 'name'
      t.integer 'likes_count', default: 0
      t.attachment :image

      t.timestamps
    end
  end
end
