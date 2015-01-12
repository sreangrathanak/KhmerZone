class User < ActiveRecord::Base
  has_many :products, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
   has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  attr_accessor :remember_token, :password_not_require
  before_save -> { self.email.downcase! }
  
  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email
  validates_format_of :email, with: /[^@\s]+@[\w\-_\.]+\.\w{2,4}/i
  validates_length_of :password, minimum: 6, unless: :password_not_require
  
  has_secure_password
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
end
