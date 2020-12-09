# frozen_string_literal: true

module Product::Cell
  class Index < Northwind::Cell::Base
    def products
      Product.limit 100
    end
  end
end
