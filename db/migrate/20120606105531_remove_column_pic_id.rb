class RemoveColumnPicId < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :pic_id
  end
end
