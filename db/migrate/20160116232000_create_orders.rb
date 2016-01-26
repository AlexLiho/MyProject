class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :variant, null: false
      t.boolean :eco, default: false
      t.boolean :get_key, default: false

      t.text :description

      t.timestamps null: false
      t.datetime :deleted_at
    end
  end
end
