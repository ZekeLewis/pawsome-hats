class OrderController < ApplicationController
    before_action :authenticate_user!
    before_action :set_order, only: [:show]

    def orderhistory
        @orders = current_user.orders.order(created_at: :desc)
    end



    def show
        @order = Order.find(params[:id])
        @order_items = OrderItem.where(order: @order)
        render :show
    end

    private

    def set_order
        @order = current_user.orders.find(params[:id])
      end

end
