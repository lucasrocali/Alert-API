require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:categories).dependent(:destroy) }
  it { should have_many(:category_preferences).dependent(:destroy) }
  it { should have_many(:events).dependent(:destroy) }
end
