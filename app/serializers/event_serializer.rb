class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :doors, :date, :venue

  def venue
    VenueSerializer.new(self.object.venue)
  end 


end
