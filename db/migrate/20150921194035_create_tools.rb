class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.integer :category_id, null: false
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :description, null: false
      
      t.timestamps null: false
    end
  end
end
