class User < ActiveRecord::Base
  belongs_to :location
  has_many :product_rates
  has_many :rated_products, :through => :product_rates, :source => :products
  has_many :products, dependent: :destroy
  has_many :product_comments, dependent: :destroy

  has_many :user_notices, :through =>:products, :source => :notifications
  has_many :notifications, class_name:  "Notification",
                                  foreign_key: "notifier_id", 
                                  dependent: :destroy

  has_many :product_likes, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :send_messages, class_name:  "Message",
                                  foreign_key: "sender_id",
                                  dependent:   :destroy
   has_many :recive_messages, class_name:  "Message",
                                   foreign_key: "reciver_id",
                                   dependent:   :destroy
  has_many :recivers, through: :send_messages, source: :reciver
  has_many :senders, through: :recive_messages, source: :sender

  attr_accessor :remember_token, :password_not_require
  before_save -> { self.email.downcase! }

  mount_uploader :image, PictureUploader
  mount_uploader  :cover, PictureUploader

  validate  :picture_size
  validate  :picture_cover_size

  validates_presence_of :name, :email,:url_name,:store_name
  validates_uniqueness_of :name, :email,:url_name
  validates_format_of :email, with: /[^@\s]+@[\w\-_\.]+\.\w{2,4}/i  
  validates :password, length:{minimum: 6}, allow_blank: true
  extend FriendlyId
    friendly_id :url_name
  has_secure_password

  before_validation :check_url_and_store_name

  def check_url_and_store_name
    if self.url_name.blank?
      self.url_name=self.name
    end
    if self.store_name.blank?
      self.store_name=self.name
    end
  end

  def self.digest(string)
    BCrypt::Password.create string
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    self.password_not_require = true
    update_attributes! remember_digest: User.digest(remember_token)
    self.password_not_require = false
  end

  def forget
    self.password_not_require = true
    update_attributes! remember_digest: nil
    self.password_not_require = false
  end

  def authenticated?(remember_token)
     return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def signed_up_at
    created_at.strftime "%h %d, %Y %l:%M %p"
  end
  
  def last_updated_at
    updated_at.strftime "%h %d, %Y %l:%M %p"
  end

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
  # Returns a user's status feed.
  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Product.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

  def picture_size
      if image.size > 2.megabytes
        errors.add(:image, "should be less than 2MB")
      end
  end

  def picture_cover_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end

  def recive_messages_unread
    self.recive_messages.where(unread: true)
  end

  def update_uncheck_notification
    self.user_notices.each do |notification|      
      notification.update_attributes ischeck:true
    end
  end
end