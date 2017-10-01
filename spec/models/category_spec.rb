require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should belong_to(:api_user) }
  it { should have_many(:categories) }
  it { should have_many(:category_preferences) }
  it { should have_many(:events) }
  it { should validate_presence_of(:name) }
end
