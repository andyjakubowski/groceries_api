json.(@items) do |item|
  json.id(item.id)
  json.update_id(item.update_id)
  json.order_id(item.order_id)
  json.text(item.text)
  json.is_completed(item.is_completed)
  json.is_open(item.is_open)
end
