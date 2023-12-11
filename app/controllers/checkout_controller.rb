
class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @cart_items = @user.cart.cart_items
    @shipping = 5.00
    @subtotal = @cart_items.sum { |item| item.quantity * item.hat.price }  + @shipping
    @taxes = @subtotal * 0.1 # Assuming a 10% tax rate
    @total = @subtotal + @taxes
  end

  def create
    @order = current_user.orders.build(order_params.merge(status: 'pending'))
  
      if @order.save
        current_user.cart.cart_items.all.each do |item|
          #OrderItem.create(order: @order, hat: item.hat)
          @order.order_items.find_or_initialize_by(hat: item.hat, quantity: item.quantity)

        end
        @order.update(status: 'complete')
        clear_cart_items
        OrderMailer.order_confirmation(current_user, @order).deliver_now
        redirect_to home_path, notice: 'Your order has been placed successfully!'

      else
        render :new
      end
    end
  
    private
  
    def order_params
      params.require(:order).permit(:status, :shipping_name, :shipping_address, :shipping_city, :shipping_state, :shipping_zip, :shipping_country)
    end

    def clear_cart_items
      current_user.cart.cart_items.destroy_all
    end
end
