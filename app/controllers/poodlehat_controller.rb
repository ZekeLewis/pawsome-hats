class PoodlehatController < ApplicationController
    def index
        @poodlehats = Hat.where('title ILIKE ?', '%poodle%')
        if params[:query].present?
            # Add the user's query to the search. Use ILIKE for case-insensitive search if using PostgreSQL.
            @poodlehats = @poodlehats.where('title ILIKE ?', "%#{params[:query]}%")
          end
       
      end
      def show
        @hat = Hat.find(params[:id])
      end
end
