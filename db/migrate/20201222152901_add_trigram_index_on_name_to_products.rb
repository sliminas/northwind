class AddTrigramIndexOnNameToProducts < ActiveRecord::Migration[6.1]
  def up
    execute <<~SQL
      create index index_products_on_name on products using gin(coalesce("products"."name"::text, '') gin_trgm_ops)
    SQL
  end

  def down
    execute <<~SQL
      drop index index_products_on_text_search_vector
    SQL
  end
end
