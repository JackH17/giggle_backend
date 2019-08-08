class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :user, :event

  def user
    UserSerializer.new(self.object.user)
  end

  def event
    EventSerializer.new(self.object.event)
  end 

end
