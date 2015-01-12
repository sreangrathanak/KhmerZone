User.create!(name:  "sreangrathanak",
               email: "sreangrathanak@gmail.com",
               password:              1234567890,
               password_confirmation: 1234567890)
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              1234567890,
               password_confirmation: 1234567890)
end
10.times do
  name  = Faker::Name.name
  Category.create(name: name)
end
category=Category.first

users = User.order(:created_at).take(6)
50.times do
  name = Faker::Lorem.sentence(1)
  price= 12
  description=Faker::Lorem.sentence(5)
  discount=0
  users.each { |user| 
    user.products.create!(name: name,description: description,
      price: price,discount: discount,category_id: category.id)
   }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }