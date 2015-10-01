require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:tool) }
  it { should validate_presence_of(:user) }
  it { should validate_numericality_of(:rating).only_integer }
  it { should validate_inclusion_of(:rating).in_range(1..5) }
  it { should belong_to(:user) }
  it { should belong_to(:tool) }
  it { should have_many(:comments) }
  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:votes).dependent(:destroy) }

  describe "#vote_count" do
    it "should tally the total upvotes minus the total downvotes" do
      review = FactoryGirl.create(:review)
      review2 = FactoryGirl.create(:review)
      FactoryGirl.create(:vote, 12, review: review2)
      FactoryGirl.create(:vote, 6, review: review)
      FactoryGirl.create(:vote, 3, review: review, state: "downvote")
      expect(review.vote_count).to eq(3)
    end
  end
end
