class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|

      t.references :product, index: true
      t.references :order, index: true

      t.boolean :additional, default: false
      t.integer :quantity, null: false
      t.integer :price, null: false, default: 0

      t.text :description

      t.timestamps null: false
      t.datetime :deleted_at
    end
  end
end
