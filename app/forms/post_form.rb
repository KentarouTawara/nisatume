class PostForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :user_id, :string
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

  validates_with LinkingBookValidator
  validates_with LinkedBookValidator
  validates :linking_content, presence: true
  validates :linked_content, presence: true

  def save
    return false if invalid?

    ActiveRecord::Base.transaction do
      @post = Post.create(user_id: user_id)
      @linking_book = Book.find_or_create_by(title: linking_title,
                                             author: linking_author,
                                             isbn: linking_isbn,
                                             publisher: linking_publisher,
                                             book_image: linking_image,
                                             book_url: linked_url)
      @linking_book.id = Book.find_by!(isbn: linking_isbn).id if @linking_book.id.nil?

      @linked_book = Book.find_or_create_by(title: linked_title,
                                            author: linked_author,
                                            isbn: linked_isbn,
                                            publisher: linked_publisher,
                                            book_image: linked_image,
                                            book_url: linked_url)

      @linked_book.id = Book.find_by!(isbn: linked_isbn).id if @linked_book.id.nil?

      @linking_book_content = LinkingBook.new(post_id: @post.id,
                                              book_id: @linking_book.id,
                                              content: linking_content)

      @linked_book_content = LinkedBook.new(post_id: @post.id,
                                            book_id: @linked_book.id,
                                            content: linked_content)
      @linking_book_content.save!
      @linked_book_content.save!
    end
  end
end
