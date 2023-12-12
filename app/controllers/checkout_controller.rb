
class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @cart_items = @user.cart.cart_items
    @shipping = 5.00
    @subtotal = @cart_items.sum { |item| item.quantity * item.hat.price }
    @taxes = @subtotal * 0.1 # Assuming a 10% tax rate
    @total = @subtotal + @taxes + @shipping
  end

  def create
    @order = current_user.orders.build(order_params.merge(status: 'pending'))

    current_user.cart.cart_items.each do |item|
      @order.order_items.build(hat: item.hat, quantity: item.quantity)
    end

    if @order.save
      mark_hats_as_sold(@order)
      clear_cart_items
      OrderMailer.order_confirmation(current_user, @order).deliver_now
      redirect_to home_path, notice: 'Your order has been placed successfully!'
    else
      render :new
    end
  end
  
    private
  
    def order_params
      params.require(:order).permit(:shipping_name, :shipping_address, :shipping_city, :shipping_state, :shipping_zip, :shipping_country)
    end

    def clear_cart_items
      current_user.cart.cart_items.destroy_all
    end

    def mark_hats_as_sold(order)
      order.order_items.each do |item|
        item.hat.update(is_trade: false) if item.hat.is_trade
      end
    end
end
