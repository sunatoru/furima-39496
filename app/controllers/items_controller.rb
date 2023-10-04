class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_items, only: [:edit, :show, :update]
  before_action :contributor_confirmation, only: [:edit, :update]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @items = Item.order(created_at: :desc)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_items
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  def item_params
    params.require(:item).permit(:item_name, :item_content, :category_id, :condition_id, :delivery_country_id, :delivery_date_id,
                                 :delivery_charge_id, :item_price, :image).merge(user_id: current_user.id)
  end
end
