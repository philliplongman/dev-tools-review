class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.belongs_to :user, null: false
      t.belongs_to :review, null: false
      t.timestamps null: false
    end
  end
end
