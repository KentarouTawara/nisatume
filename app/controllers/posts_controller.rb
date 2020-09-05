class PostsController < ApplicationController
  def new; end

  def create
    @post = current_user.posts.create
    @linking_book = Book.create(linking_book_params)
    @linked_book = Book.create(linked_book_params)
    @linking_book_content = LinkingBook.create(post_id: @post.id, book_id: @linking_book.id, content:
      params[:linking][:content])
    @linked_book_content = LinkedBook.create(post_id: @post.id, book_id: @linked_book.id, content:
      params[:linked][:content])

    render json: { post: @post.id }, status: :ok
  end

  def search
    if params[:role] == 'linking'
      @linking_books = RakutenWebService::Books::Book.search(title: params[:keyword])
      @role = params[:role]
    else
      @linked_books = RakutenWebService::Books::Book.search(title: params[:keyword])
      @role = params[:role]
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.linking_book.update(content: params[:linking][:content])
    @post.linked_book.update(content: params[:linked][:content])

    render json: { post: @post.id }, status: :ok
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to mypage_path success '削除しました'
  end

  private

  def linking_book_params
    params.require(:linking).permit(:title, :author, :isbn, :publisher, :book_image, :book_url)
  end

  def linked_book_params
    params.require(:linked).permit(:title, :author, :isbn, :publisher, :book_image, :book_url)
  end
end
