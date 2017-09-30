require 'rails_helper'

RSpec.describe User, type: :model do
  it { should belong_to(:api_user) }
  it { should have_one(:user_info).dependent(:destroy) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }

end
