class HomeController < ApplicationController

  def show
    if params[:category].present?
      @hats = Hat.where(category: params[:category])
    else
      @hats = Hat.all
    end
  end

end
