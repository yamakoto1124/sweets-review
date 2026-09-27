class HomesController < ApplicationController
  # top と about はログインしていなくてもアクセスできるように許可
  allow_unauthenticated_access only: [:top, :about]

  def top
    @posts = Post.all.order(created_at: :desc)
  end

  def about
  end
end
