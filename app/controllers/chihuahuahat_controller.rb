class ChihuahuahatController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_permission, except: [:index, :show, :add_to_cart]

  def add_to_cart
    flash[:notice] = 'Add to cart'
    hat = Hat.find(params[:id])
    #flash[:notice] = 'Add to cart'
    cart = Cart.find_or_create_by(user: current_user)
    cart_item = CartItem.create(hat: hat, cart: cart)
    if cart_item.save
      if cart.save
        flash[:notice] = 'Added to cart'
      else
        flash[:error] = 'Error occured while saving cart'
      end
    else
      flash[:error] = 'Error occured while saving cart item'
    end
    redirect_to chihuahuaindex_path
  end
  
  
  
  def index
    @chihuahuahats = Hat.where('title ILIKE ?', '%chihuahua%')
      if params[:sort_order].present?
        @chihuahuahats = @chihuahuahats.order(price: params[:sort_order])
     end  
   # Filter by color if the color parameter is present
   if params[:colour].present?
     @chihuahuahats = @chihuahuahats.where(colour: params[:colour])
   end
 
   # Filter by material if the material parameter is present
   if params[:material].present?
     @chihuahuahats = @chihuahuahats.where(material: params[:material])
   end
 
   # Filter by minimum price if the min_price parameter is present
   if params[:min_price].present?
     @chihuahuahats = @chihuahuahats.where('price >= ?', params[:min_price])
   end
 
   # Filter by maximum price if the max_price parameter is present
   if params[:max_price].present?
     @chihuahuahats = @chihuahuahats.where('price <= ?', params[:max_price])
   end
 
   # If you want to include a search term filter
   if params[:query].present?
     @chihuahuahats = @chihuahuahats.where('category ILIKE :search OR colour ILIKE :search OR material ILIKE :search OR description ILIKE :search OR fit ILIKE :search', search: "%#{params[:query]}%")
 
   end
    
    end

    def show
      @hat = Hat.find(params[:id])
    end

    def require_permission
      user = current_user
  if user && user.isvendors == 'n'
    redirect_to chihuahuaindex_path, notice: 'You do not have permission to perform this action.'
  end
    end

  def destroy
    @hat = Hat.find(params[:id])
    @hat.destroy
    flash[:success] = 'item was successfully destroyed.'
    redirect_to chihuahuaindex_url, status: :see_other

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
      redirect_to chihuahuahat_path(@hat), notice: 'Hat was successfully created.'
    else
      render :new
    end
  end


  # def update
  #   @hat = Hat.find(params[:id])
  #   if @hat.update(params.require(:hats).permit(:title, :price, :description, :colour, :material))
  #     redirect_to chihuahuaindex_path, notice: 'Hat was successfully updated.'
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
      redirect_to chihuahuahat_path, notice: 'Hat was successfully updated.'
    else
      # Re-render the form with error messages
      render :edit
    end
  end
  
  private
  
  def hat_params
    params.require(:hat).permit(:title, :price, :description, :colour, :material, :category, :quantity)
  end
  


  

  def set_hat
    @hat = Hat.find(params[:id])
  end





end
