require 'rails_helper'

RSpec.describe Notification, type: :model do
  it { should belong_to(:location) }
  it { should belong_to(:event) }
end
