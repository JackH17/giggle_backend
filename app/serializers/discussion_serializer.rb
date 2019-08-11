class DiscussionSerializer < ActiveModel::Serializer
  attributes :id, :name, :group_id
  has_many :posts

end
