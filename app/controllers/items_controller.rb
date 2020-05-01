class ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items, status: status
  end
end
