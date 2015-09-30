class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :tool
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5 }
  validates :tool, presence: true
  validates :user, presence: true

  def vote_count
    upvotes = votes.where(state: "upvote")
    downvotes = votes.where(state: "downvote")
    upvotes.count - downvotes.count
  end
end
