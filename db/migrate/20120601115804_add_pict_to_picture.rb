class AddPictToPicture < ActiveRecord::Migration
  def self.up
    change_table :pictures do |t|
      t.has_attached_file :pict
    end
  end

  def self.down
    drop_attached_file :pictures, :pict
  end
end
