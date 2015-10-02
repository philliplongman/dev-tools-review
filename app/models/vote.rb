class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user, presence: true
  validates :review, presence: true
  validates :state, inclusion: { in: ["upvote", "downvote"], allow_nil: true }
end
