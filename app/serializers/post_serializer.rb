class PostSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :poly_comment, as: :commentable
end
