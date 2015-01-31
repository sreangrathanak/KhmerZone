["Phnom Penh","Pursat","Banteay Meanchey",
  "Battambang","Kampong Cham","Kampong Speu",
  "Kampong Thom","Kampot","Kandal","Koh Kong",
  "Kep","Kratié","Mondulkiri","Oddar Meanchey",
  "Pailin","Preah Sihanouk","Preah Vihear",
  "Prey Veng","Ratanakiri","Siem Reap",
  "Stung Treng","Svay Rieng","Takéo",
  "Tbong Khmum","Kampong Chhnang"].each do |name|
    Location.create name:name
  end

User.create!(name:  "sreangrathanak",
               email: "sreangrathanak@gmail.com",
               password:              1234567890,
               password_confirmation: 1234567890,
               store_name:"Sreang Flower",
               url_name:"rathanakjame",
               phone:"016921007",
               address:"St 23,No33",
               location_id:1,
               about:"This About Rathanak")
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  about = Faker::Lorem.paragraph(2)
  User.create!(name:  name,
               email: email,
               password:              1234567890,
               password_confirmation: 1234567890,
               store_name: name,
               url_name:"user_#{n}",
               phone:"01234567#{n}",
               address:"St wwwww, No wwwwwwwwwwww",
               location_id:2,
               about: about)
end
#Create Category
10.times do
  name  = Faker::Name.name
  Category.create(name: name)
end

#Create Product
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
#Create Comment
products=Product.order(:created_at).take(6)
#10.times do
  products.each{|product|
    users.each{|user|
      content=Faker::Lorem.sentence(2)
      product.product_comments.create!(user_id: user.id,content:content)
    }  
  }
#end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }