class CartController < ApplicationController
    before_action :authenticate_user!
  
    def cart
      render :cart
    end

end
