class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.belongs_to :supplier, foreign_key: true
      t.belongs_to :category, foreign_key: true

      t.integer :price
      t.integer :quantity_per_unit
      t.string :unit

      t.integer :stock

      t.timestamps
    end
  end
end
