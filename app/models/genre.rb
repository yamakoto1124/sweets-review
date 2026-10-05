class Genre < ApplicationRecord
  has_many :posts    #関連付け　ジャンルはたくさんの投稿を持っている
end
