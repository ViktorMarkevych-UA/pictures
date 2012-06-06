class RemoveColumnPicId < ActiveRecord::Migration
  def change
    remove_column :comments, :pic_id
  end
end
