class ProductRate < ActiveRecord::Base
  belongs_to :product
  belongs_to :user  
  after_create :add_user_notify

  private
    def add_user_notify
      if product.user != user
        Notification.create notifier_id:user.id,notified_id:product.id,
                        information:"rate"
      end 
    end
end
