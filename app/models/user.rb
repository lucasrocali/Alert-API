class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :auth_token
  has_secure_password

  belongs_to :api_user, dependent: :destroy

  has_one :user_info, dependent: :destroy

  has_many :category_preferences, dependent: :destroy
  has_many :tag_preferences, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :strengths, dependent: :destroy

  validates_presence_of :email, :password_digest
  validates :email, uniqueness: { scope: :api_user }

  accepts_nested_attributes_for :user_info

end
