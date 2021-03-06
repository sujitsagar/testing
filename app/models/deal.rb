class Deal < ActiveRecord::Base
   #attr_accessible :name, :city_id, :image, :details

   has_many :attendances, :dependent => :destroy
   has_many :users, :through => :attendances
   
   has_many :deallikes, :dependent => :destroy
   has_many :users, :through => :deallikes

   validates :name, :presence => true,
                           :length => { :within => 2..50 }
   validates :city_id, :presence => true

   

   has_attached_file :photo, :styles => { :normal => "404x250#", :small => ["170x150#", :jpg] },
		      :default_style => :normal,
		      :path => ":rails_root/public/system/deals/:attachment/:id/:style/:basename.:extension",
		      :url => "/system/deals/:attachment/:id/:style/:basename.:extension",
	       	      :default_url => "/system/deals/:attachment/missing_:style.png"


    def dealattended?(user)
         attendances.find_by_user_id(user)
    end
    def dealattend!(user)
         attendances.create!( :user_id => user.id)
    end
    def dealnotattend!(user)
         attendances.find_by_user_id(user).destroy
    end
    
    def dealliked?(user)
         deallikes.find_by_user_id(user)
    end
    def deallike!(user)
         
         deallikes.create!( :user_id => user.id )
    end
    def dealunlike!(user)
         deallikes.find_by_user_id(user).destroy
    end
end
