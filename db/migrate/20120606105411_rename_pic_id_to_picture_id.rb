class RenamePicIdToPictureId < ActiveRecord::Migration[5.1]
  def up
    rename_column(:likes, :pic_id, :picture_id)
  end

  def down
    rename_column(:likes, :picture_id, :pic_id)
  end
end
