json.items(@items) do |item|
  json.id(item.id)
  json.order_id(item.order_id)
  json.text(item.text)
  json.is_completed(item.completed)
  json.is_open(item.open)
end