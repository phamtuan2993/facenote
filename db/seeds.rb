(1..3).each do |idx|
  user = User.create!(id: idx, username: idx.to_s, email: idx.to_s, password: idx.to_s * 9)
  post = Post.create!(id: idx, content: idx.to_s * 9, author: User.find(idx))
  user.follow(post)
end

user_1 = User.first
user_2 = User.find(2)
user_3 = User.find(3)

user_1.follow(user_2)
user_2.follow(user_3)
user_3.follow(user_1)
user_3.follow(user_2)
