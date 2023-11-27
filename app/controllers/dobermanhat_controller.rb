class DobermanhatController < ApplicationController
    def index
        @dobermanhats = Hat.where('title ILIKE ?', '%Doberman%')
        if params[:query].present?
            # Add the user's query to the search. Use ILIKE for case-insensitive search if using PostgreSQL.
            @dobermanhats = @dobermanhats.where('title ILIKE ?', "%#{params[:query]}%")
          end
       
      end
      def show
        @hat = Hat.find(params[:id])
      end
end



