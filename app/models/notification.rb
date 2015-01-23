class Notification < ActiveRecord::Base
  belongs_to :notified, class_name: "Product"
  belongs_to :notifier, class_name: "User"
  validates :notified, presence: true
  validates :notifier, presence: true
  validates_presence_of :information

  scope :uncheck_notification,->{
    where ischeck:false
  }
  def update_unread
    self.update_attributes isread:true
  end  
end
