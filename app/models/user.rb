class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  def self.looks(search, word)
    if search == "perfect_match"
      User.where("last_name LIKE ? OR first_name LIKE ?", "#{word}", "#{word}")
    elsif search == "forward_match"
      User.where("last_name LIKE ? OR first_name LIKE ?", "#{word}%", "#{word}%")
    elsif search == "backward_match"
      User.where("last_name LIKE ? OR first_name LIKE ?", "%#{word}", "%#{word}")
    elsif search == "partial_match"
      User.where("last_name LIKE ? OR first_name LIKE ?", "%#{word}%", "%#{word}%")
    else
      User.all
    end
  end
end