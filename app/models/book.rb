class Book < ApplicationRecord
  has_one :linking_book, dependent: :destroy
  has_one :linked_book, dependent: :destroy
end
