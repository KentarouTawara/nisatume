class Book < ApplicationRecord
  has_many :linking_book, dependent: :destroy
  has_many :linked_book, dependent: :destroy

  validates :isbn, uniqueness: true
end
