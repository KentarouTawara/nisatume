class LinkingbooksController < ApplicationController
  def create
    binding.pry
    @linking_book = current_user.posts.linkingbook.book.new(params)
  end
end
