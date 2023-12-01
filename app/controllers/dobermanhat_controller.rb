class DobermanhatController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_permission, except: [:index, :show]
  def index
    @dobermanhats = Hat.where('category ILIKE ?', '%Doberman%')
    if params[:query].present?
        # Add the user's query to the search. Use ILIKE for case-insensitive search if using PostgreSQL.
        @dobermanhats = @dobermanhats.where('category ILIKE ?', "%#{params[:query]}%")
      end
    end

    def show
      @hat = Hat.find(params[:id])
    end

    def require_permission
      user = current_user
  if user && user.isvendor == 'n'
    redirect_to dobermanindex_path, notice: 'You do not have permission to perform this action.'
  end

    end

  def destroy
    @hat = Hat.find(params[:id])
    @hat.destroy
    flash[:success] = 'item was successfully destroyed.'
    redirect_to dobermanindex_url, status: :see_other

  end

    def edit
      @hat = Hat.find(params[:id])
    end
  

  def new
    @hat = Hat.new

  end

  def create
    @hat = Hat.new(hat_params)
    if @hat.save
      @hat.image.attach(params[:hat][:image])
      redirect_to dobermanhat_path(@hat), notice: 'Hat was successfully created.'
    else
      render :new
    end
  end


  # def update
  #   @hat = Hat.find(params[:id])
  #   if @hat.update(params.require(:hats).permit(:title, :price, :description, :colour, :material))
  #     redirect_to dobermanindex_path, notice: 'Hat was successfully updated.'
  #   else
  #     flash.now[:error] = 'To-do item update failed'
  #     render :edit, status: :unprocessable_entity
  #   end
  # end
  def update
    @hat = Hat.find(params[:id])
  
    if @hat.update(hat_params)
      # Replace old image with the new one if uploaded
      if params[:hat][:image]
        @hat.image.attach(params[:hat][:image])
      end
  
      # Redirect with success message
      redirect_to dobermanhat_path, notice: 'Hat was successfully updated.'
    else
      # Re-render the form with error messages
      render :edit
    end
  end
  
  private
  
  def hat_params
    params.require(:hat).permit(:title, :price, :description, :colour, :material, :category)
  end
  


  private

  def set_hat
    @hat = Hat.find(params[:id])
  end

end



