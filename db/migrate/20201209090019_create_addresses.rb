class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.bigint :addressable_id
      t.string :addressable_type

      t.string :contact_name
      t.string :company_name
      t.string :contact_title

      t.string :street
      t.string :zip
      t.string :city
      t.string :country
      t.string :region

      t.string :phone

      t.timestamps
    end

    add_index :addresses, [:addressable_type, :addressable_id]
  end
end
