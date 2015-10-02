class AddVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :state
      t.belongs_to :user, null: false
      t.belongs_to :review, null: false
    end

    add_index(:votes, [:user_id, :review_id], unique: true)
  end
end
