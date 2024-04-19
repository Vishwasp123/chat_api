class ChatSerializer < ActiveModel::Serializer
  attributes :id, :title

  def messages
    object.messages
  end
end
