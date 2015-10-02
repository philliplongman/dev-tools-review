require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:review) }
  it { should validate_inclusion_of(:state).in_array(["upvote", "downvote"]) }
  it { should allow_value(nil).for(:state) }
end
