class LinkedBookValidator < ActiveModel::Validator
  def validate(record)
    linked_book_info = [record.linked_title, record.linked_author, record.linked_isbn, record.linked_publisher, record.linked_image, record.linked_url]

    record.errors[:base] << '二冊目を選んでください' if linked_book_info.any?(&:blank?)
  end
end
