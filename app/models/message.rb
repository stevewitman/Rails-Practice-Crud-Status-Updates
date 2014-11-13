class Message < ActiveRecord::Base
  validates :user, :status, :likes, presence: true
end
