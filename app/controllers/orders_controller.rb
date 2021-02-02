class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :in_advance, only: [:index, :create]
  def index
    @order_residence = OrderResidence.new
    if current_user.id == @item.user_id || @item.order != nil
      redirect_to root_path
    else
      render :index
    end
  end

  def create
    @order_residence = OrderResidence.new(order_params)
    if @order_residence.valid?
      pay_item
      @order_residence.save
      redirect_to root_path
    else
      render action: :index
    end
  end
    private

    def order_params
      params.require(:order_residence).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end
    
    def in_advance
      @item = Item.find(params[:item_id])
    end

end
