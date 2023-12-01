
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
        # Initialize an order with a 'pending' status as we start the checkout process
        @order = current_user.orders.build(:status => 'pending')
    
        if @order.save
          # Payment logic would go here
          # If payment is successful, update the order status
          @order.update(status: 'complete')
    
          # Redirect to a success page, such as the order details page
          redirect_to home_path, notice: 'Your order has been placed successfully!'
        else
          # If there's a problem with the order itself, handle the error
          # by re-rendering the checkout form with error messages
          render :new
        end
      end
    
      private
    
      def order_params
        # Strong parameters for the order, adjust the permitted parameters to match your order form
        # Remove any reference to 'order_id' here if it exists
        params.require(:order).permit(:status) # Add other fields as needed
      end
  end
  