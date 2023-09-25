class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    redirect_to '/'
  end

  private
  
  def items_params
    params.require(:item).permit(:item_name, :item_content, :category_id, :condition_id, :delivery_country_id, :delivery_date_id, :delivery_charge_id, :item_price, :image).marge(user_id: current_user.id)
  end
end
