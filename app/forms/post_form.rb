class PostForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :linking_book_isbn, :integer
  attribute :linking_book_title, :string
  attribute :linking_book_image, :string
  attribute :linking_book_author, :string
  attribute :linking_book_product_url, :string
  attribute :linking_book_content, :string

  attribute :linked_book_isbn, :integer
  attribute :linked_book_title, :string
  attribute :linked_book_image, :string
  attribute :linked_book_author, :string
  attribute :linked_book_product_url, :string
  attribute :linked_book_content, :string

end