class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.all.order("created_at DESC")
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category_id, :condition_id, :charge_id, :area_id, :days_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end
