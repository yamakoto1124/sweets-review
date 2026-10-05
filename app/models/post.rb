class Post < ApplicationRecord
  belongs_to :user #関連付け　一つの投稿は一人のユーザに属する？
  belongs_to :genre #関連付け　１つの投稿は1つのジャンルに属する？

  validates :title, presence: true
  validates :body, presence: true #タイトルとボディを入れてね

end
