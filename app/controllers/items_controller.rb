class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    Item.create(item_params)
  end

  private
    def item_params
      params.require(:item).permit(:id, :order_id, :text, :is_completed, :is_open)
    end
end
