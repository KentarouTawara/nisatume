class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

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
    @role = params[:role]
    @keyword = params[:keyword]
    if @keyword.present? && @role.present?
      if @role == 'linking'
        @linking_books = RakutenWebService::Books::Book.search(title: params[:keyword])
      elsif @role == 'linked'
        @linked_books = RakutenWebService::Books::Book.search(title: params[:keyword])
      end
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
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
