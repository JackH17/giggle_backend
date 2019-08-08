class Api::V1::EventsController < ApplicationController
  skip_before_action :authorize, only: [:create, :index, :show]

    def create
        event = Event.create( event_params )
        if event.valid?
            render json: { event: EventSerializer.new(event)}, status: :created
            # render json: { event: event, token: issue_token(user_id: event.id) }, status: :created
        else
            render json: { errors: event.errors.full_messages }, status: :not_accepted
        end
    end
    
    def index
      @events = Event.all
      # render json: {events: @events}
      render json: { events: @events.map{ |event| EventSerializer.new(event) }} 
    end
    
    private
    
    def event_params
      params.require(:event).permit(:name, :doors, :date)
    end

end
