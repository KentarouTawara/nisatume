class LinkingBookValidator < ActiveModel::Validator
  def validate(record)
    linking_book_info = [record.linking_title, record.linking_author, record.linking_isbn, record.linking_publisher, record.linking_image, record.linking_url]

    record.errors[:base] << '一冊目を選んでください' if linking_book_info.any?(&:blank?)
  end
end
