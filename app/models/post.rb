class Post < ApplicationRecord
  belongs_to :user
  has_one :linking_book
end