class Category < ActiveRecord::Base
  has_many :tools

  validates :name, presence: true
end
