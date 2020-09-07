class PostsController < ApplicationController
  def new
    @post_form = PostForm.new
  end

  def create
    @post_form = PostForm.new(post_form_params)
    if @post_form.save(current_user)
      redirect_to mypage_path, success: '紹介カードを作成しました'
    else
      flash.now[:danger] = '紹介カードの作成ができません'
      render :new
    end
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
    redirect_to mypage_path, success: '削除しました'
  end

  private

  def post_form_params
    params.require(:post_form).permit!
  end
end
