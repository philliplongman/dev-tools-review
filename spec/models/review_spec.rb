require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:tool_id) }
  it { should validate_presence_of(:user_id) }
  it { should validate_numericality_of(:rating).only_integer }
  it { should validate_inclusion_of(:rating).in_range(1..5) }
  it { should belong_to(:user) }
  it { should belong_to(:tool) }
end
