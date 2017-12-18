class AddColumnUserIdIntoCategories < ActiveRecord::Migration[5.1]
  def up
    add_column :categories, :user_id, :integer
    add_index :categories, :user_id
  end

  def down
    remove_index :categories, :user_id
    remove_column :categories, :user_id
  end
end
