class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :doors, :date, :venue, :event_groups

  def venue
    VenueSerializer.new(self.object.venue)
  end 

  def event_groups
    self.object.groups
  end 


end
