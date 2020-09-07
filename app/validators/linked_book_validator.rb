class LinkedBookValidator < ActiveModel::Validator
  def validate(record)
    if record.linked_title.blank? || record.linked_author.blank? || record.linked_isbn || record.linked_publisher || record.linked_image || record.linked_url
      record.errors[:base] << '二冊目を選んでください'
    end
  end
end
