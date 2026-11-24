class Post < ApplicationRecord
  belongs_to :user #関連付け　一つの投稿は一人のユーザに属する？
  belongs_to :genre #関連付け　１つの投稿は1つのジャンルに属する？

  validates :title, presence: true
  validates :body, presence: true #タイトルとボディを入れてね

  has_many :post_comments, dependent: :destroy

def self.looks(search, word)
    if search == "perfect_match"
      Post.where("title LIKE ?", "#{word}")
    elseif search == "forward_match"
      Post.where("title LIKE ?", "#{word}%")
    elseif search == "backward_match"
      Post.where("title LIKE ?", "%#{word}")
    elseif search == "partial_match"
      Post.where("title LIKE ?", "%#{word}%")
    else
      Post.all
    end
  end
end
