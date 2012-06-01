class RenameCatIdToCategoryId < ActiveRecord::Migration
  def up
    rename_column(:pictures, :cat_id, :category_id)
  end

  def down
    rename_column(:pictures, :category_id, :cat_id)
  end
end
