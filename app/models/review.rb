class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :tool
  validates_presence_of :user
  validates_presence_of :tool
  validates_presence_of :rating
  validates_numericality_of :rating, only_integer: true
  validates_inclusion_of :rating, { in: 1..5, message: "must be between 1 and 5"}

end
