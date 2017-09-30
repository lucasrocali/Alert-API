require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should belong_to(:user) }
  it { should have_one(:event).dependent(:destroy) }
  it { should have_one(:notification).dependent(:destroy) }
end
