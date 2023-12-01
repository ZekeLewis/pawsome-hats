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

    before_action :authenticate_user!, only: [:add_to_cart]

    def add_to_cart
      flash[:notice] = 'Add to cart'
      hat = Hat.find(params[:id])
      #flash[:notice] = 'Add to cart'
      cart = Cart.find_or_create_by(user: current_user)
      cart_item = CartItem.create(hat: hat, cart: cart)
      if cart_item.save
        if cart.save
          flash[:notice] = 'Added to cart'
        else
          flash[:error] = 'Error occured while saving cart'
        end
      else
        flash[:error] = 'Error occured while saving cart item'
      end
      redirect_to chihuahuahat_path(3)
    end
end
