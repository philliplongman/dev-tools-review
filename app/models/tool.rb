class Tool < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :user
  belongs_to :category

  validates :user, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
end
