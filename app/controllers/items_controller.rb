class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    Item.create(item_params)
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  private
    def item_params
      params.require(:item).permit(:id, :order_id, :text, :is_completed, :is_open)
    end
end
