class UserInfo < ApplicationRecord
	belongs_to :user, dependent: :destroy

	validates :name, presence: true
	validates_uniqueness_of :user_id
end
