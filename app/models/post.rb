class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  class Post < ApplicationRecord
  belongs_to :user
  # belongs_to :genre # （Genreモデル作成後に有効化）

  validates :title, presence: true
  validates :body, presence: true
 end
end
