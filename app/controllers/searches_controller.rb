class SearchesController < ApplicationController
  def search
    @range = params[:range] #search target
    @word = params[:word]   #search keyword
    @search = params[:search] #seacrh query

    if @range == "User"
       @users = User.looks(@search, @word) #if the search target is a user
    else
      @posts = Post.looks(@search, @word) #if the search target is a post
    end
  end
end
