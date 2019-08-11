class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :discussion_id
end
