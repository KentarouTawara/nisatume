class LinkingBook < ApplicationRecord
  belongs_to :post
  belongs_to :book
end
