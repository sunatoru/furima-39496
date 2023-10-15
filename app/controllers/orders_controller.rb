class OrdersController < ApplicationController
  before_action :find_item, only: [:index, :create]
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def find_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :city, :address, :building, :telephone_number, :delivery_country_id).merge(item_id: params[:item_id], user_id: current_user.id )
  end
end
