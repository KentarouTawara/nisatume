class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top]

  def top
    @posts = Post.order(created_at: :desc).limit(3)
  end
end
