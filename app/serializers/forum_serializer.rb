class ForumSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :poly_comments, as: :commantable
end
