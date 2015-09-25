class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false
    end

    add_reference :tools, :category, null: false
  end
end
