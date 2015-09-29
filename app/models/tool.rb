class Tool < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  belongs_to :category

  validates :user, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true

  def average_stars
    return "" if reviews.empty?
    '★' * reviews.average(:rating)
  end
end
