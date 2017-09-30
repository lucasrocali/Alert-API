class ApiUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :api_name, :api_token

  has_many :users, dependent: :destroy
  has_many :features, dependent: :destroy
  has_many :slots, dependent: :destroy
  has_many :time_ranges, dependent: :destroy

  before_validation(on: :create) do
    self.api_token = Devise.friendly_token(20)
  end

end
