class Merchantlike < ActiveRecord::Base

    belongs_to :user
    belongs_to :merchant

    validates :merchant_id, :presence => true
    validates :user_id, :presence => true


    default_scope :order => 'merchantlikes.created_at DESC'
    scope :from_users_followed_by, lambda { |user| followed_by(user) }
    private

       def self.followed_by(user) 
          merchant_ids = %(SELECT merchant_id FROM merchantlikes WHERE user_id = :user_id)
             where("user_id IN (#{merchant_ids}) OR user_id = :user_id",{ :user_id => user })
       end


end
