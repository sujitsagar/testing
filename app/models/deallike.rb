class Deallike < ActiveRecord::Base

    belongs_to :user
    belongs_to :deal

    validates :deal_id, :presence => true
    validates :user_id, :presence => true
  

   default_scope :order => 'deallikes.created_at DESC'
   scope :from_users_followed_by, lambda { |user| followed_by(user) }
   private
    
       def self.followed_by(user) 
          deal_ids = %(SELECT deal_id FROM deallikes WHERE user_id = :user_id)
             where("user_id IN (#{deal_ids}) OR user_id = :user_id",{ :user_id => user })
       end


end
