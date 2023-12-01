class CustomController < ApplicationController
    before_action :authenticate_user!
    before_action :initialize_cart
    before_action :set_current_cart
  #before_action :set_hat, only: [:destroy]


  def new
    @hat = Hat.new
  end

  def create
    @hat = Hat.new(hat_params)
    if @hat.save
      # Assuming there is a current_user method available,
      # and each user has a cart associated with them.
      current_user.cart.hats << @hat
      # Redirect to the cart review path or any other desired path
      redirect_to review_cart_path, notice: 'Hat successfully added to cart.'
    else
      render :new
    end
  end

  private

  def hat_params
    params.require(:hat).permit(:title, :description, :price, :image)
  end

  def set_current_cart
    @cart = current_user.cart || current_user.create_cart
  end
  def initialize_cart
      @cart = current_user.cart || current_user.create_cart
end





end