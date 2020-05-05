class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    item = Item.create(item_params)

    ActionCable.server.broadcast(
      "ListChannel",
      message_type: "item_create",
      item: {
        id: item.id,
        orderId: item.order_id,
        text: item.text,
        isCompleted: item.is_completed,
        isOpen: item.is_open
      }
    )
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)

    ActionCable.server.broadcast(
      "ListChannel",
      message_type: "item_update",
      item: {
        id: item.id,
        orderId: item.order_id,
        text: item.text,
        isCompleted: item.is_completed,
        isOpen: item.is_open
      }
    )
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy

    ActionCable.server.broadcast(
      "ListChannel",
      message_type: "item_delete",
      item: {
        id: item.id
      }
    )
  end

  private
    def item_params
      params.require(:item).permit(:id, :order_id, :text, :is_completed, :is_open)
    end
end
