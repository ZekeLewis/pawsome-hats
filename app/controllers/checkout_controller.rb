
class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @cart_items = @user.cart.cart_items
    @subtotal = @cart_items.sum { |item| item.hat.price }
    @taxes = @subtotal * 0.1 # Assuming a 10% tax rate
    @total = @subtotal + @taxes
  end

  def create
      @order = current_user.orders.build(:status => 'pending')
  
      if @order.save
        current_user.cart.cart_items.all.each do |item|
          OrderItem.create(order: @order, hat: item.hat)
        end
        @order.update(status: 'complete')
        clear_cart_items
        redirect_to home_path, notice: 'Your order has been placed successfully!'

      else
        render :new
      end
    end
  
    private
  
    def order_params
      params.require(:order).permit(:status) # Add other fields as needed
    end

    def clear_cart_items
      current_user.cart.cart_items.destroy_all
    end
end
