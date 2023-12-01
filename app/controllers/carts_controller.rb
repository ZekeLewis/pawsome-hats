class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_cart
  before_action :set_current_cart

  def show
      render :show
    @cart = current_user.cart
    @cart_items = @cart.cart_items.includes(:hat)
  end
  
  def set_current_cart
      @current_cart = current_user.cart if user_signed_in?
    end
    
    def add_item
      @cart = current_user.cart
      @hat = Hat.find(params[:hat_id])
      @cart_item = @cart.cart_items.build(hat: @hat, quantity: 1)
  
      if @cart_item.save
        redirect_to cart_path, notice: 'Package added to cart successfully.'
      else
        redirect_to @hat, alert: 'Failed to add package to cart.'
      end

    end

    def destroy
      cart_item = CartItem.find_by(id: params[:id])
      if cart_item.destroy
        flash[:notice] = 'Item removed successfully'
      else
        flash[:error] = 'Error occured while removing item'
      end
      
      redirect_to review_cart_path
    end


    def review
      @cart_items = CartItem.all
      render :cart
    end

  private

  def set_current_cart
    @cart = current_user.cart || current_user.create_cart
  end
  def initialize_cart
    @cart = current_user.cart || current_user.create_cart
    end
    
  def apply_promo_code
    promo_code = params[:promo_code]

    case promo_code
    when '10OFF'
      @discount = @cart.subtotal * 0.10
    when '15OFF'
      @discount = @cart.subtotal * 0.15
    when '20OFF'
      @discount = @cart.subtotal * 0.20
    else
      @discount = 0
    end

    @cart.calculate_totals_with_discount(@discount)

    respond_to do |format|
      format.js { render partial: 'update_cart_totals' }
    end
  end

end
