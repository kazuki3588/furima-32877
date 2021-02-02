class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_set, only: [:show, :destroy, :edit, :update]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end
  end
  
  def edit
    if current_user.id != @item.user_id && @item.order != nil
      redirect_to root_path
    else
      render :edit
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :fee_id, :price, :shipping_area_id, :delivery_date_id, :image).merge(user_id: current_user.id)
  end
  def move_set
    @item = Item.find(params[:id])
  end
end
