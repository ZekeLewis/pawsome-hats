class ChihuahuahatController < ApplicationController
    def index
        @chihuahuahats = Hat.where('title ILIKE ?', '%Chihuahua%')
        if params[:query].present?
            # Add the user's query to the search. Use ILIKE for case-insensitive search if using PostgreSQL.
            @chihuahuahats = @chihuahuahats.where('title ILIKE ?', "%#{params[:query]}%")
          end
       
      end
      def show
        @hat = Hat.find(params[:id])
      end
end
