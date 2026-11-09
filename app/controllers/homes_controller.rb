class HomesController < ApplicationController
  # top と about はログインしていなくてもアクセスできるように許可
  allow_unauthenticated_access only: [:top, :about]

  def top
    @recent_posts = Post.all.order(created_at: :desc).Limit(5) # 新着投稿を最新の５件だけ取得
  end

  def about
  end
end
