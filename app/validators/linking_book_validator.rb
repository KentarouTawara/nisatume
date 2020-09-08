class LinkingBookValidator < ActiveModel::Validator
  def validate(record)
    if record.linking_title.blank? || record.linking_author.blank? || record.linking_isbn.blank? || record
                                                                                                   .linking_publisher
                                                                                                   .blank? || record
                                                                                                                .linking_image.blank? || record.linking_url.blank?
      record.errors[:base] << '一冊目を選んでください'
    end
  end
end
