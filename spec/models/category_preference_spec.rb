require 'rails_helper'

RSpec.describe CategoryPreference, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:category) }
end
