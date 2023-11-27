class TradeController < ApplicationController
    before_action :authenticate_user!

    def trade
        render :trade
      end
      
end
