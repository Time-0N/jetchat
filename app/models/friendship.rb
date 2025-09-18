class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
  belongs_to :friend_request

  validates :user_id, uniqueness: { scope: :friend_id }
end
