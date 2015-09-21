class AddReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :body

      t.belongs_to :tool, null: false
      t.belongs_to :user, null: false

      t.timestamps null: false
    end
  end
end
