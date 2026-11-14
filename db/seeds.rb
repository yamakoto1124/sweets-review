# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#   
## 1. テストユーザーの作成（パスワードは任意のもの）
user1 = User.find_or_create_by!(email_address: "tanaka@example.com") do |user|
  user.last_name = "田中"
  user.first_name = "太郎"
  user.last_name_kana = "タナカ"
  user.first_name_kana = "タロウ"
  user.password = "password"
  user.password_confirmation = "password"
end

user2 = User.find_or_create_by!(email_address: "suzuki@example.com") do |user|
  user.last_name = "鈴木"
  user.first_name = "花子"
  user.last_name_kana = "スズキ"
  user.first_name_kana = "ハナコ"
  user.password = "password"
  user.password_confirmation = "password"
end


["ケーキ", "プリン", "和菓子", "アイス", "焼き菓子"].each do |name|
  Genre.find_or_create_by!(genre_name: name)
 end

# 3. テストレビュー投稿の作成
Post.find_or_create_by!(title: "濃厚なめらかカスタードプリン") do |post|
  post.body = "卵のコクがしっかりしていて、カラメルのほろ苦さと相性抜群でした！"
  post.user = user1
  
  post.genre = Genre.find_by(genre_name: "プリン")
end

Post.find_or_create_by!(title: "季節のいちごショートケーキ") do |post|
  post.body = "生クリームが甘すぎず軽やかで、スポンジもふわふわでした。またリピートしたいです。"
  post.user = user2
  post.genre = Genre.find_by(genre_name: "ケーキ")
end
