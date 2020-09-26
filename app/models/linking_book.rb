class LinkingBook < ApplicationRecord
  belongs_to :post
  belongs_to :book

  validates :post_id, uniqueness: { scope: :book_id }
end
