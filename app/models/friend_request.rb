class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_one :friendship, dependent: :destroy

  validates :status, inclusion: { in: %w[pending accepted] }
  validates :sender_id, uniqueness: {
    scope: :receiver_id,
    conditions: -> { where(status: 'pending') },
    message: "Pending friend request already exists"
  }
  validate :cannot_send_to_self

  scope :pending, -> { where(status: "pending") }
  scope :accepted, -> { where(status: "accepted") }

  def accept!
    transaction do
      update!(status: "accepted", responded_at: Time.current)

      Friendship.create!([
                           { user: sender, friend: receiver, friend_request: self },
                           { user: receiver, friend: sender, friend_request: self }
                         ])
    end
  end

  def decline!
    # Simply delete the request instead of marking as declined
    # This allows the sender to send another request later
    destroy!
  end

  def pending?
    status == "pending"
  end

  private

  def cannot_send_to_self
    errors.add(:receiver_id, "You can't send a friend request to yourself") if sender_id == receiver
  end
end
