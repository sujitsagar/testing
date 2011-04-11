require 'faker'
namespace :db do
 desc "Fill database with sample data"
 Rake::Task['db:reset'].invoke
 task :populate => :environment do
  make_users
  make_microposts
  make_products
  make_relationships
  make_productlikes
 end
end
def make_users
 admin = User.create!(:name => "Sujit Sagar",:email =>"sujit@likes.com",:password => "sujitsagar",:password_confirmation => "sujitsagar")
 admin.toggle!(:admin)
 99.times do |n|
 name = Faker::Name.name
 email = "fake#{n+1}@likes.com"
 password = "sujitsagar"
User.create!(:name => name,
:email => email,
:password => password,
:password_confirmation => password)
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
user = users.first
following = users[1..50]
followers = users[3..40]
following.each { |followed| user.follow!(followed) }
followers.each { |follower| follower.follow!(user) }
end

def make_products
 User.all(:limit => 6).each do |user|
 30.times do |n|
 productname = Faker::Name.name
 subgroup = "subgroup#{n%20}"
 maingroup = "maingroup#{n%5}"
 Product.create!(:productname => productname,:subgroup => subgroup, :maingroup => maingroup )

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

end

