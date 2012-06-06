class RenamePicIdToPictureId < ActiveRecord::Migration
  def up
    rename_column(:likes, :pic_id, :picture_id)
  end

  def down
    rename_column(:likes, :picture_id, :pic_id)
  end
end
