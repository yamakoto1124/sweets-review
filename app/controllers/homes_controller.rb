class HomesController < ApplicationController
  # top と about はログインしていなくてもアクセスできるように許可
  allow_unauthenticated_access only: [:top, :about]

  def top
  end

  def about
  end
end
