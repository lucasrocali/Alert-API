require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should belong_to(:location) }
  it { should belong_to(:category) }
  it { should have_many(:event_tags) }
  it { should have_many(:notifications) }
  it { should have_many(:strengths) }
  it { should validate_presence_of(:importance) }
end
