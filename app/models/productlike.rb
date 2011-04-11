class Productlike < ActiveRecord::Base

    belongs_to :user
    belongs_to :product

    validates :product_id, :presence => true
    validates :user_id, :presence => true
  

   default_scope :order => 'productlikes.created_at DESC'
   scope :from_users_followed_by, lambda { |user| followed_by(user) }
   private
    
       def self.followed_by(user) 
          product_ids = %(SELECT product_id FROM productlikes WHERE user_id = :user_id)
             where("user_id IN (#{product_ids}) OR user_id = :user_id",{ :user_id => user })
       end



end
