require 'rails_helper'

RSpec.describe EventTag, type: :model do
  it { should belong_to(:event) }
  it { should belong_to(:tag) }
end
