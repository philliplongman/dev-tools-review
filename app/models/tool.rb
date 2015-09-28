class Tool < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  belongs_to :category

  validates :user, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true

  def average_rating
    sum = 0
    count = reviews.count
    reviews.each do |review|
      sum += review.rating
    end
    sum / count
  end

  def average_stars
    '★' * average_rating
  end
end
