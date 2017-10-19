class EventSerializer < ActiveModel::Serializer
  attributes :id, :importance, :comment, :created_at, :up_count, :down_count, :readable_date, :user_name

  has_one :location
  has_one :category
  has_many :event_tags

  # has_many :strengths

  def created_at
  	object.created_at.strftime("%F %H:%M")
  end

  def readable_date
  	object.created_at.strftime("%e %B at %H:%M")
  end

  def user_name
  	object.location.user.user_info.name
  end
end
