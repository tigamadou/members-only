# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

datas = file = File.read('public/dumies.json')
data_hash = JSON.parse(file)
nusers = 0
nposts = 0
data_hash.each do |user|
    puts "****************************"
    puts "Creating #{user["username"]}"
    
    newuser = User.create(username: user["username"],email: user["email"],password:user["password"].to_s)
    nusers+=1
    puts "User #{newuser.username} created!"

    user["posts"].each do |post|
        newpost = Post.create(title:post["title"],body:post["body"],user_id:newuser.id)
        nposts+=1
        puts "#{newuser.username} created a new post!"
        puts "****************************"
    end
end
puts "#{nusers} Users added with #{nposts} posts!"

