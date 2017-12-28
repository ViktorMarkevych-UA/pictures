class AddAndChangeLikesCountsInPictures < ActiveRecord::Migration[5.1]
  def up
    rename_column :pictures, :likes_count, :positive_likes_count
    add_column :pictures, :negative_likes_count, :integer, default: 0
  end

  def down
    rename_column :pictures, :positive_likes_count, :likes_count
    remove_column :pictures, :negative_likes_count
  end
end
