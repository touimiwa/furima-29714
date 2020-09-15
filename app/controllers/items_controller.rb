class ItemsController < ApplicationController
def index
  @items = Item.order("created_at DESC")
end

def new
  @item = Item.new
end

def create
  Item.create(item_params)
end

private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :charges_id, :area_id, :days_id, :price, :user)
  end
end
