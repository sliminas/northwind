class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.belongs_to :order, foreign_key: true
      t.belongs_to :product, foreign_key: true

      t.integer :price
      t.integer :quantity
      t.integer :discount

      t.timestamps
    end
  end
end
