require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should belong_to(:location) }
  it { should belong_to(:category) }
  it { should have_many(:event_tags).dependent(:destroy) }
  it { should have_many(:notifications).dependent(:destroy) }
  it { should have_many(:strengths).dependent(:destroy) }
end
