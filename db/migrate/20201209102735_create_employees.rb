class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :title

      t.integer :supervisor_id

      t.date :date_of_birth
      t.date :date_of_hiring

      t.text :notes

      t.timestamps
    end
  end
end
