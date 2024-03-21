class OrdersController < ApplicationController

  def index 
    @item = Item.find(params[:item_id])
    if user_signed_in? && !Order.exists?(item_id: @item.id) && @item.user == !current_user

      @purchase_form = PurchaseForm.new
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id]) 
    @purchase_form = PurchaseForm.new(purchase_form_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_form_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number). merge(user_id: current_user.id, item_id: params[:item_id])
  end

end