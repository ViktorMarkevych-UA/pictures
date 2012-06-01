class RemoveColumnImg < ActiveRecord::Migration
  def change
    remove_column :pictures, :img
  end
end
