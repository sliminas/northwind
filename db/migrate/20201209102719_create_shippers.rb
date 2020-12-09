class CreateShippers < ActiveRecord::Migration[6.0]
  def change
    create_table :shippers do |t|
      t.string :name

      t.timestamps
    end
  end
end
