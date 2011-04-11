class Merchant < ActiveRecord::Base

   has_many :merchantlikes, :dependent => :destroy
   has_many :users, :through => :merchantlikes


   has_many :merchantcomments, :dependent => :destroy
   has_many :users, :through => :merchantcomments

    def merchantliked?(user)
         merchantlikes.find_by_user_id(user)
    end
    def merchantlike!(user)
         
         merchantlikes.create!( :user_id => user.id, :rating1 => Random.new.rand(1..10), :rating2 => Random.new.rand(1..10), :rating3 => Random.new.rand(1..10), :rating4 => Random.new.rand(1..10), :rating5 => Random.new.rand(1..10))
    end
    def merchantunlike!(user)
         merchantlikes.find_by_user_id(user).destroy
    end
end
