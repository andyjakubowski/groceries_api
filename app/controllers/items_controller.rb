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
      },
      clientId: params[:client_id].presence
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
      },
      clientId: params[:client_id].presence
    )
  end

  def update_many
    many_items_params do |parameters|
      item = Item.find(parameters[:id])
      item.update(parameters)

      ActionCable.server.broadcast(
        "ListChannel",
        message_type: "item_update",
        item: {
          id: item.id,
          orderId: item.order_id,
          text: item.text,
          isCompleted: item.is_completed,
        },
        clientId: params[:client_id].presence
      )
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy

    ActionCable.server.broadcast(
      "ListChannel",
      message_type: "item_delete",
      item: {
        id: item.id
      },
      clientId: params[:client_id].presence
    )
  end

  private
    def item_params(parameters = params)
      parameters
        .require(:item)
        .permit(
          :id,
          :order_id,
          :text,
          :is_completed)
    end

    def many_items_params
      params.require(:items).each do |single_item_params|
        permitted_params = single_item_params.permit(:id, :order_id, :text, :is_completed)
        yield permitted_params
      end
    end
end
