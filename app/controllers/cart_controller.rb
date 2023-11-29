class CartController < ApplicationController
    before_action :authenticate_user!
  
    def cart
      render :cart
    end
    def review
      @cart_items = current_user.cart_items
      @subtotal = calculate_subtotal(@cart_items)
      @taxes = calculate_taxes(@subtotal)
      @total = calculate_total(@subtotal, @taxes)
    end
  
    private
  
    def calculate_subtotal(cart_items)
      cart_items.sum { |item| item.quantity * item.price }
    end
  
    def calculate_taxes(subtotal)
      subtotal * 0.1 # Assuming a 10% tax rate
    end
  
    def calculate_total(subtotal, taxes)
      subtotal + taxes
    end
  end
  