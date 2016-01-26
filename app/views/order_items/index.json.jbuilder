json.array!(@order_items) do |order_item|
  json.extract! order_item, :id, :product_id, :order_id, :additional, :quantity, :price, :description, :deleted_at
  json.url order_item_url(order_item, format: :json)
end
