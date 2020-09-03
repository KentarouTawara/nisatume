class Post < ApplicationRecord
  belongs_to :user
  has_one :linking_book, dependent: :destroy
  has_one :linked_book, dependent: :destroy
end
