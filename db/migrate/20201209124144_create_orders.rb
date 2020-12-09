class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :customer, foreign_key: true
      t.belongs_to :employee, foreign_key: true

      t.datetime :ordered_at
      t.datetime :shipped_at

      t.belongs_to :shipper, foreign_key: true

      t.decimal :freight
    end
  end
end
