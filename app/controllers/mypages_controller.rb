class MypagesController < ApplicationController
  def show
    @posts = Post.where(user_id: current_user.id)
  end
end