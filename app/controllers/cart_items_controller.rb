class CartItemsController < ApplicationController

  def update_quantity
    cart_item = CartItem.find(params[:id])
    
    if cart_item.update(cart_item_params)
      # Recalculate cart totals and respond
      new_totals = recalculate_cart_totals(current_user.cart)
      respond_to do |format|
        format.html { redirect_to review_cart_path, notice: "Cart updated." }
        format.json { render json: new_totals }
      end
    else
      redirect_to review_cart_path, notice: 'cart updating failed'
    end
  end


    def remove
        @cart_item = CartItem.find(params[:id])
    
        if @cart_item.destroy
          redirect_to cart_path, notice: 'Package removed from cart successfully.'
        else
          redirect_to cart_path, alert: 'Failed to remove package from cart.'
        end
      end


      def recalculate_cart_totals(cart)
        # Initialize variables
        subtotal = 0.0
        tax_rate = 0.1  # For example, 10%
        shipping_fee = 5.00  # You would define this method based on your shipping logic
      
        # Calculate the subtotal
        cart.cart_items.each do |item|
          # Access the price through the associated Hat model
          subtotal += item.quantity * item.hat.price
        end
      
        # Calculate taxes
        taxes = subtotal * tax_rate
      
        # Calculate the total
        total = subtotal + taxes + shipping_fee
      
        # Return a hash with all the calculated values
        {
          subtotal: subtotal,
          taxes: taxes,
          shipping_fee: shipping_fee,
          total: total
        }
      end

      private

      def cart_item_params
        params.require(:cart_item).permit(:quantity)
      end

end
