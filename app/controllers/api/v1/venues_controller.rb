class Api::V1::VenuesController < ApplicationController

      def create
        venue = Venue.create( venue_params )
            if venue.valid?
            render json: { venue: VenueSerializer.new(venue)}, status: :created
            # render json: { venue: venue, token: issue_token(venue_id: venue.id) }, status: :created
         else
            render json: { errors: venue.errors.full_messages }, status: :not_accepted
         end
        end
    
         def index
             @venues = Venue.all
             render json: {venues: @venues}
            # render json: { venues: @venues.map{ |venue| venueSerializer.new(venue) }}, include: ['applications', 'cvs': ["title", "content", "experience"]]  
        end
    
            private
    
            def venue_params
            params.require(:venue).permit(:name, :location, :website)
            end
end
