class Category < ActiveRecord::Base
  has_many :tools

  validates_presence_of :name
end
