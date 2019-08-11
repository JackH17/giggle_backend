class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :event, :user_id, :group_discussions
  has_many :memberships


  def event
    EventSerializer.new(self.object.event)
  end 

  def group_discussions
    self.object.discussions.map{|discussion| DiscussionSerializer.new(discussion)}
  end 


end
