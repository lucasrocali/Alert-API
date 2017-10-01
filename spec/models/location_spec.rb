require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should belong_to(:user) }
  it { should have_one(:event)}
  it { should have_one(:notification) }
  it { should validate_presence_of(:lat) }
  it { should validate_presence_of(:lon) }
end
