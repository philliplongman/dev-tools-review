class Tool < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true
  validates :description, presence: true
end
