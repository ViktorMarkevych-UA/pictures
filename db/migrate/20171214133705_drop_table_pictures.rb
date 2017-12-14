class DropTablePictures < ActiveRecord::Migration[5.1]
  def up
    drop_table :pictures
  end

  def down
    create_table :pictures do |t|
      t.integer 'category_id'
      t.string 'name'
      t.string 'pict_file_name'
      t.string 'pict_content_type'
      t.integer 'pict_file_size'
      t.datetime 'pict_updated_at'
      t.integer 'likes_count', default: 0

      t.timestamps
    end
  end
end
