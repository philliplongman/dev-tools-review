class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :tool
  has_many :comments

  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5 }
  validates :tool, presence: true
  validates :user, presence: true
end
