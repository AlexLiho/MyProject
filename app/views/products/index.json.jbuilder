json.array!(@products) do |product|
  json.extract! product, :id, :name, :additional, :price, :unit, :lead_time, :description, :visible_order, :deleted_at
  json.url product_url(product, format: :json)
end
