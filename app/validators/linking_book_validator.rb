class LinkingBookValidator < ActiveModel::Validator
  def validate(record)
    if record.linking_title.blank? || record.linking_author.blank? || record.linking_isbn || record.linking_publisher || record.linking_image || record.linking_url
      record.errors[:base] << '一冊目を選んでください'
    end
  end
end
