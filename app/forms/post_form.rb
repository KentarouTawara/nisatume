class PostForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :linking_title, :string
  attribute :linking_author, :string
  attribute :linking_isbn, :integer
  attribute :linking_publisher, :string
  attribute :linking_image, :string
  attribute :linking_url, :string
  attribute :linking_content, :string

  attribute :linked_title, :string
  attribute :linked_author, :string
  attribute :linked_isbn, :integer
  attribute :linked_publisher, :string
  attribute :linked_image, :string
  attribute :linked_url, :string
  attribute :linked_content, :string

  validates :linking_title, presence: { message: ''}
  validates :linking_author, presence: true
  validates :linking_isbn, presence: true
  validates :linking_publisher, presence: true
  validates :linking_image, presence: true
  validates :linking_url, presence: true
  validates :linking_content, presence: true

  validates :linked_title, presence: true
  validates :linked_author, presence: true
  validates :linked_isbn, presence: true
  validates :linked_publisher, presence: true
  validates :linked_image, presence: true
  validates :linked_url, presence: true
  validates :linked_content, presence: true

  # def initialize(params: {})
  #   @linking_book = Book.new(title: params[:linking_title],
  #                            author: params[:linking_author],
  #                            isbn: params[:linking_isbn],
  #                            publisher: params[:linking_publisher],
  #                            book_image: params[:linking_image],
  #                            book_url: params[:linking_url])
  #
  #   @linked_book = Book.new(title: params[:linked_title],
  #                            author: params[:linked_author],
  #                            isbn: params[:linked_isbn],
  #                            publisher: params[:linked_publisher],
  #                            book_image: params[:linked_image],
  #                            book_url: params[:linked_url])
  #
  #   @linking_book_content = LinkingBook.new(content: params[:linking_content])
  #   @linked_book_content = LinkingBook.new(content: params[:linked_content])
  # end

  def save(current_user)
    return false if invalid?
    ActiveRecord::Base.transaction do
      @post = Post.create(user_id: current_user.id)
      @linking_book = Book.find_or_create_by(title: self.linking_title,
                                           author: self.linking_author,
                                           isbn: self.linking_isbn,
                                           publisher: self.linking_publisher,
                                           book_image: self.linking_image,
                                           book_url: self.linked_url)

      @linked_book = Book.find_or_create_by(title: self.linked_title,
                                           author: self.linked_author,
                                           isbn: self.linked_isbn,
                                           publisher: self.linked_publisher,
                                           book_image: self.linked_image,
                                           book_url: self.linked_url)

      @linking_book_content = LinkingBook.create(post_id: @post.id,
                                               book_id: @linking_book.id,
                                               content: self.linking_content)

      @linked_book_content = LinkedBook.create(post_id: @post.id,
                                               book_id: @linked_book.id,
                                               content: self.linked_content)
    end
    # @linked_book.save
    # @linking_book_content.create(post_id: @post.id,
    #                              book_id: @linking_book.id)
    # @linked_book_content.create(post_id: @post.id,
    #                              book_id: @linked_book.id)

    # # Bookが重複する？　find_or_create_byみたいなやつ　トランザクションを貼る
    # # isbがユニークだから
    # @linked_book = Book.create(linked_book_params)
    # # 下記をきれいにしたい。
    # @linking_book_content = LinkingBook.create(post_id: @post.id, book_id: @linking_book.id, content:
    #   params[:linking][:content])
    # @linked_book_content = LinkedBook.create(post_id: @post.id, book_id: @linked_book.id, content:
    #   params[:linked][:content])
  end
end