require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { should belong_to(:api_user) }
  it { should have_many(:tags).dependent(:destroy) }
  it { should have_many(:event_tags).dependent(:destroy) }
end
