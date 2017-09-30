require 'rails_helper'

RSpec.describe User, type: :model do
  it { should belong_to(:api_user) }
  it { should have_one(:user_info).dependent(:destroy) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should have_many(:category_preferences).dependent(:destroy) }
  it { should have_many(:tag_preferences).dependent(:destroy) }
  it { should have_many(:locations).dependent(:destroy) }
  it { should have_many(:strengths).dependent(:destroy) }
end
