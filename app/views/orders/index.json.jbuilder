json.array!(@orders) do |order|
  json.extract! order, :id, :name, :phone, :email, :variant, :eco, :get_key, :description, :deleted_at
  json.url order_url(order, format: :json)
end
