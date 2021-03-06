namespace :db do
 desc "Fill database with sample data"
 Rake::Task['db:reset'].invoke
 task :populate => :environment do
  require 'faker'
  make_users
  make_microposts
  make_maingroups
  make_subgroups
  make_products
  make_relationships
  make_productlikes
  make_cities
  make_deals
  make_deallikes
  make_attendances
  make_productcomments
  make_merchants
  make_merchantcomments
  make_merchantlikes
end
end

def make_users
  admin = User.create!(:name => "Sujit",:lastname => "Sagar",:email =>"sujit@likes.com",:password  =>"sujitsagar",:password_confirmation => "sujitsagar", :city_id => 1, :sex => "male", :birthday_date => "01-01-1990", :profession => "profession0", :company => "company0" )
  admin.toggle!(:admin)
  admin.toggle!(:active)
  99.times do |n|
  name = Faker::Name.first_name
  confirm = Faker::Name.first_name
  lastname = Faker::Name.last_name
  email = "test#{n+1}@likes.com"
  password = "likesdiary"
  city = Random.new.rand(1..4)
  sex = "male"
  birthday = "1990-07-31"
  profession = "profession#{n+1}"
  company = "company#{n+1}"
  User.create!(:name => name, :lastname => lastname,:email => email,:password => password,:password_confirmation => password, :city_id => city, :sex => sex, :birthday_date => birthday, :profession => profession, :company => company , :active => 0, :confirmation => confirm )
  end
end

def make_microposts
User.all(:limit => 6).each do |user|
50.times do
content = Faker::Lorem.sentence(5)
user.microposts.create!(:content => content)
end
end
end

def make_relationships
users = User.all
User.all(:limit => 6).each do |user|
following = users[1..50]
followers = users[3..40]
following.each { |followed| user.follow!(followed) }
followers.each { |follower| follower.follow!(user) }
end
end

def make_maingroups
 30.times do|n| 
   groupname = Faker::Name.first_name
   image = "/productimages/maingroups.jpg"
   Maingroup.create!(:maingroup => groupname , :maingroupimage => image)
 end
end

def make_subgroups
  1800.times do |n| 
   groupname = Faker::Name.first_name
   mainid = n%30+1
   image = "/productimages/subgroups/image#{n+1}.jpg"
   cate1 = Faker::Name.first_name
   cate2 = Faker::Name.first_name
   Subgroup.create!(:subgroup => groupname , :maingroup_id => mainid, :cate1 => cate1, :cate1image => image,:cate2 => cate2, :cate2image => image )
 end
end

def make_products
 User.all(:limit => 6).each do |user|
 count =1
 300.times do |n|
  pro = Product.new
  pro[:productname] = Faker::Name.name
  pro[:subgroup_id] = count
  pro[:user_id] = user.id
  pro[:productimage] = "/productimages/products/image1.jpg"
  pro.save
  count += 1
 end
 end
end

def make_productlikes
 users = User.all
 products = Product.all
 product = Product.first
 user = User.first
 users.each { |user| product.productlike!(user) }
 products.each { |product| product.productlike!(user) }
 product = Product.last
 user = User.find_by_id(2)
 users = users[4..57]
 products = products[10..90]
 users.each { |user| product.productlike!(user) }
 products.each { |product| product.productlike!(user) }
end

def make_deallikes
 users = User.all
 deals = Deal.all
 deal = Deal.first
 user = User.first
 users.each { |user| deal.deallike!(user) }
 deals.each { |deal| deal.deallike!(user) }
 deal = Deal.last
 user = User.find_by_id(2)
 users = users[4..57]
 deals = deals[10..90]
 users.each { |user| deal.deallike!(user) }
 deals.each { |deal| deal.deallike!(user) }
end

def make_cities
  cityarr =  ["Kanpur","Delhi","Mumbai","Chennai"]
  4.times do |n|
  name = cityarr[n-1]
  City.create!( :cityname => name )
  end
end

def make_deals
  30.times do |n|
  name = Faker::Name.name
  city_id = "#{n%4+1}"
  oprice = 1009
  discount = 105
  max= 20 
  startat = "2011-04-08 00:00"
  endat = "2011-04-18 00:00"
  image = "/images/dealsimage.jpg"
  content = Faker::Lorem.sentence(5)
  info1 = Faker::Lorem.sentence(5)
  terms = Faker::Lorem.sentence(30)
  aboutdeal = Faker::Lorem.sentence(30)
  info2 = Faker::Lorem.sentence(30)
  address= Faker::Lorem.sentence(20)
  Deal.create!(:name => name,:city_id => city_id, :image => image, :info1 => info1 , :terms => terms, :aboutdeal => aboutdeal, :info2 => info2, :address => address, :orignalprice => oprice, :discount => discount, :maxattenders => max, :startat => startat, :endat => endat )
  end
end

def make_attendances
 users = User.all
 deals = Deal.all
 deal = Deal.first
 user = User.first
 users.each { |user| deal.dealattend!(user) }
 deals.each { |deal| deal.dealattend!(user) }
 deal = Deal.last
 user = User.find_by_id(2)
 users = users[4..57]
 deals = deals[10..90]
 users.each { |user| deal.dealattend!(user) }
 deals.each { |deal| deal.dealattend!(user) }
end

def make_productcomments
 User.all(:limit => 6).each do |user|
50.times do |n|
content = Faker::Lorem.sentence(5)
product_id = n%10 + 1
type = "comment"
user.productcomments.create!(:content => content, :product_id => product_id, :type => type )
end
end

def make_merchants
 10.times do |n|
  mer = Merchant.new
  mer[:merchantname] = Faker::Name.name
  mer[:merchantimage] = "/merchants/image.jpg"
  mer[:menulink] = "/merchants/menus/menu.pdf"
  mer[:tribecomment] = Faker::Lorem.sentence(25)
  mer[:merachantinfo] = Faker::Lorem.sentence(15)
  mer[:merspectext] = Faker::Lorem.sentence(1)
  mer[:merspecimage] = "/merchants/image.jpg"
  mer[:meroffertext] = Faker::Lorem.sentence(1)
  mer[:merofferimage] = "/merchants/image.jpg"
  mer[:meraddress] = Faker::Lorem.sentence(3)
  mer[:merchantphone] = Faker::PhoneNumber.phone_number
  mer.save
 end
end

def make_merchantcomments
 User.all(:limit => 6).each do |user|
50.times do |n|
content = Faker::Lorem.sentence(5)
merchant_id = n%10 + 1
user.merchantcomments.create!(:content => content, :merchant_id => merchant_id )
end
end
end


def make_merchantlikes
 users = User.all
 merchants = Merchant.all
 merchant = Merchant.first
 user = User.first
 users.each { |user| merchant.merchantlike!(user) }
 merchants.each { |merchant| merchant.merchantlike!(user) }
 merchant = Merchant.last
 user = User.find_by_id(2)
 users = users[4..57]
 merchants = merchants[10..90]
 users.each { |user| merchant.merchantlike!(user) }
 merchants.each { |merchant| merchant.merchantlike!(user) }
end

end




