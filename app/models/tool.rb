class Tool < ActiveRecord::Base
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
end
