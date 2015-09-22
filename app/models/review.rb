class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :tool

  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5 }
  validates :tool_id, presence: true
  validates :user_id, presence: true
end
