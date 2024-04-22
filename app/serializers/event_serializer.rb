class EventSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :poly_comments, as: :commentable
end
