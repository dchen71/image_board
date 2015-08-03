#Create users
15.times do |n|
  name  = Faker::Internet.user_name
  email = "example-#{n+1}@yahoo.com"
  password = "password"
  User.create!(username: name,
               email: email,
               password:              password,
               password_confirmation: password,)
end

#Create images
users = User.take(8)
start = 1
users.each do |user|
	link = "#{Rails.root}/seed/k" + start.to_s + ".jpg"
	user.images.create(:pictures => File.new(link))
	start += 1
end
User.find_by(id: 2).images.create(:pictures => File.new("#{Rails.root}/seed/s1.jpg"))
User.first.images.create(:pictures => File.new("#{Rails.root}/seed/s2.jpg"))

#Create comments
images = Image.take(5)
users = User.take(5)
images.each do |image|
	users.each do |user|
		content = Faker::Lorem.sentence(1)
		image.comments.create!(content: content, user_id: user.id)
	end
end

#Create tags
images = Image.take(5)
Tag.create!(tag:'store')
Tag.create!(tag:'cheese')
Tag.create!(tag:'Strawberry')
Tag.create!(tag:'chocolate')
tags = Tag.take(4)

images.each do |image|
	tags.each do |tag|
		Tagging.create!(image_id: image.id, tag_id: tag.id)
	end
end