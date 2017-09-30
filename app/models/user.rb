class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :auth_token
  has_secure_password

  belongs_to :api_user, dependent: :destroy

  has_one :user_info, dependent: :destroy

  validates_presence_of :email, :password_digest
  validates :email, uniqueness: { scope: :api_user }

  accepts_nested_attributes_for :user_info

end
