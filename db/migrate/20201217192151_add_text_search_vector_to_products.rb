class AddTextSearchVectorToProducts < ActiveRecord::Migration[6.1]
  def up
    add_column :products, :text_search_vector, :tsvector
    add_index :products, :text_search_vector, using: :gin

    execute <<~SQL
      CREATE FUNCTION products_ts_vector_trigger() RETURNS trigger AS $$
      begin
        new.text_search_vector := setweight(to_tsvector('pg_catalog.english', coalesce(new.name, '')), 'A');
        return new;
      end
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
      ON products FOR EACH ROW EXECUTE FUNCTION products_ts_vector_trigger();
    SQL
  end

  def down
    remove_column :products, :text_search_vector, :tsvector

    execute <<~SQL
      drop trigger tsvectorupdate on products;
      drop FUNCTION products_ts_vector_trigger;
    SQL
  end
end

