class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  has_many :posts, dependent: :destroy
end

def self.looks(search, word)
   if search == "perfect_match"
    User.where("last_name LIKE ? OR first_name LIKE ?", "#{word}", "#{word}")
   elseif search == "forward_match"
    User.where("last_name LIKE ? OR first_name LIKE ?", "#{word}%", "#{word}%")
   elseif search == "backward_match"
    User.where("last_name LIKE ? OR first_name LIKE ?", "%#{word}", "%#{word}")
   elseif search == "partial_match"
    User.where("last_name LIKE ? OR first_name LIKE ?", "%#{word}%", "%#{word}%")
   else
    User.all
   end
end
