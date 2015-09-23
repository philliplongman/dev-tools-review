require 'rails_helper'

RSpec.describe Tool, type: :model do
  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }

  it { should have_many(:reviews) }
  it { should belong_to(:user) }
end
