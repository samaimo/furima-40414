class OrdersController < ApplicationController
  before_action :set_item, only: [:index,:create]

  def index 
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    if user_signed_in? && @item.user != current_user
      unless Order.exists?(item_id: @item.id, user_id: current_user.id)
        @purchase_form = PurchaseForm.new
        return
      end
    end
    redirect_to user_session_path
  end
  

  def create
    
    @purchase_form = PurchaseForm.new(purchase_form_params)
    # 入力フォームに購入情報や配送先情報があり、クレカ情報のトークンがあれば、「購入」できる
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_form_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: params[:price])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:  @item.price,
      card: purchase_form_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id]) 
  end


end