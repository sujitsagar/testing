class Product < ActiveRecord::Base
   #attr_accessible :productname, :subgroup, :maingroup
   #ajaxful_rateable :dimensions => [:speed, :beauty, :price], :allow_update => true
 
   belongs_to :subgroup

   has_many :productlikes, :dependent => :destroy
   has_many :users, :through => :productlikes
   
   has_many :productcomments, :dependent => :destroy
   has_many :users, :through => :productcomments
 
   validates :productname, :presence => true,
                           :length => { :within => 2..50 }
   validates :subgroup_id, :presence => true
   
   
    def productliked?(user)
         productlikes.find_by_user_id(user)
    end
    def productlike!(user)
         productlikes.create!( :user_id => user.id, :rating1 => Random.new.rand(1..10), :rating2 => Random.new.rand(1..10), :rating3 => Random.new.rand(1..10), :rating4 => Random.new.rand(1..10), :rating5 => Random.new.rand(1..10) )
    end
    def productunlike!(user)
         productlikes.find_by_user_id(user).destroy
    end
end
