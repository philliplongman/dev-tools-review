class RemoveCategoryIdColumn < ActiveRecord::Migration
  def up
    remove_column :tools, :category_id, :integer
  end

  def down
    add_column :tools, :category_id, :integer, null: false
  end
end
