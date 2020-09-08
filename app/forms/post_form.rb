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

  validates_with LinkingBookValidator
  validates_with LinkedBookValidator
  validates :linking_content, presence: true
  validates :linked_content, presence: true

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
      @linking_book.id = Book.find_by(isbn: self.linking_isbn).id if @linking_book.id.nil?

      @linked_book = Book.find_or_create_by(title: self.linked_title,
                                           author: self.linked_author,
                                           isbn: self.linked_isbn,
                                           publisher: self.linked_publisher,
                                           book_image: self.linked_image,
                                           book_url: self.linked_url)

      @linked_book.id = Book.find_by(isbn: self.linked_isbn).id if @linked_book.id.nil?

      @linking_book_content = LinkingBook.new(post_id: @post.id,
                                               book_id: @linking_book.id,
                                               content: self.linking_content)

      @linked_book_content = LinkedBook.new(post_id: @post.id,
                                               book_id: @linked_book.id,
                                               content: self.linked_content)
      @linking_book_content.save!
      @linked_book_content.save!
    end
  end
end
