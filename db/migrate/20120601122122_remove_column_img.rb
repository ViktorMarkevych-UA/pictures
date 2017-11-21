class RemoveColumnImg < ActiveRecord::Migration[5.1]
  def change
    remove_column :pictures, :img
  end
end
