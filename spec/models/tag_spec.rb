require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { should belong_to(:api_user) }
  it { should have_many(:tags) }
  it { should have_many(:event_tags) }
  it { should validate_presence_of(:name) }
end
