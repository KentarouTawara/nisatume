class PostForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :keyword, :string
end