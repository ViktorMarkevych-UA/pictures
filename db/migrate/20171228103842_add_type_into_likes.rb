class AddTypeIntoLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :type, :string
  end
end
