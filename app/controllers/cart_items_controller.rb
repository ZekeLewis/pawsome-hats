class CartItemsController < ApplicationController
    before_action :set_cart
    def remove
        @cart_item = CartItem.find(params[:id])
    
        if @cart_item.destroy
          redirect_to cart_path, notice: 'Package removed from cart successfully.'
        else
          redirect_to cart_path, alert: 'Failed to remove package from cart.'
        end
      end

end
