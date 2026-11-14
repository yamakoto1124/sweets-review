class HomesController < ApplicationController
  # top と about はログインしていなくてもアクセスできるように許可
  allow_unauthenticated_access only: [:top, :about]

  def top
    @posts = Post.includes(:user).order(created_at: :desc).limit(5) # 新着投稿を最新の５件だけ取得
  end

  def about
  end
end
