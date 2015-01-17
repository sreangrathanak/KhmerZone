class Message < ActiveRecord::Base
  belongs_to :sender, class_name: "User"
  belongs_to :reciver, class_name: "User"
  validates :sender, presence: true
  validates :reciver, presence: true
  validates_presence_of :subject
  validates_presence_of :content

  def reciver_name
    reciver.name if reciver
  end

  def reciver_name= name
    self.reciver= User.find_by_name name if name.present?
  end
end
