class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  after_create :add_user_notify

  private
    def add_user_notify
      Notification.create notifier_id:follower.id,notified_id:followed.id,
                        information:"following"
    end
end
