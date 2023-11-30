class TradeController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_hat, only: [:destroy]


  def new
    @hat = Hat.new
  end

  def create
    @hat = Hat.new(hat_params)
    @hat.is_trade = true  # Set is_trade to true for hats added through trade
  
    if @hat.save
      redirect_to trade_path, notice: 'Hat was successfully added.'
    else
      render :new
    end
  end

  def trade
    @hat = Hat.where(is_trade: true)  # Fetch only trade hats
  end


  def destroy
    @hat = Hat.find(params[:id])
    @hat.destroy
    flash[:success] = 'The hat item was successfully destroyed.'
    redirect_to trade_path, status: :see_other
  end

  def show
    @hat = Hat.find_by(id: params[:id])
    if @hat.nil?
      redirect_to trade_path, alert: 'Hat not found.'
    end
  end

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
    redirect_to trade_show_path(hat)
  end

  private

  def hat_params
    params.require(:hat).permit(:title, :description, :price, :image)
  end

  def set_hat
    @hat = Hat.find_by(id: params[:id])
    redirect_to trade_path, alert: 'Hat not found.' if @hat.nil?
  end

end
