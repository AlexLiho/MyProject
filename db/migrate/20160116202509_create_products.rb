class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.boolean :additional, default: false
      t.integer :price, null: false
      t.string :unit, null: false
      t.integer :lead_time
      t.text :description
      t.integer :visible_order, null: false, unique: true 

      t.timestamps null: false
      t.datetime :deleted_at
    end
  end
end
