class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def search
    if params[:role] == 'linking'
      @linking_books = RakutenWebService::Books::Book.search(title: params[:keyword])
      @role = params[:role]
    else
      @linked_books = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
  end
end
