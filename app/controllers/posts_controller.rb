class PostsController < ApplicationController
  def new

  end

  def search
    if params[:role] == 'linking'
      @linking_books = RakutenWebService::Books::Book.search(title: params[:keyword])
    else
      @linked_books = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
    render :new
  end
end
