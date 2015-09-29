require 'rails_helper'

RSpec.describe Tool, type: :model do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:category) }

  it { should have_many(:reviews) }
  it { should belong_to(:user) }
  it { should belong_to(:category) }

  it { should have_many(:reviews).dependent(:destroy) }
end
