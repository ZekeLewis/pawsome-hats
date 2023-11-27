class OrderController < ApplicationController
    before_action :authenticate_user!

    def order
        render :order
    end

end
