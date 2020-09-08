class LinkedBookValidator < ActiveModel::Validator
  def validate(record)
    if record.linked_title.blank? || record.linked_author.blank? || record.linked_isbn.blank? || record
                                                                                                 .linked_publisher
                                                                                                   .blank? || record
                                                                                                              .linked_image.blank? || record.linked_url.blank?
      record.errors[:base] << '二冊目を選んでください'
    end
  end
end
